package poly.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import poly.dto.AdminDTO;
import poly.dto.StuDTO;
import poly.dto.UserDTO;
import poly.service.IUserService;
import poly.util.CmmUtil;
import poly.util.UtilFile;
import poly.util.VerifyRecaptcha;

@Controller
public class UserController {
	@Resource(name = "UserService")
	private IUserService userService;
	// --------------------------------------------------메인페이지
	// 시작---------------------------------------------------------------------------------------

	@RequestMapping(value = "index")
	public String barcode(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		try {
			String stu_no = (String) session.getAttribute("stu_no");
			if (stu_no.length() > 0) {
				UserDTO sDTO = userService.getUser(stu_no);
				AdminDTO setting = userService.getSetting(sDTO.getCampus());

				model.addAttribute("photo", sDTO.getPhoto());

				session.setAttribute("campus", sDTO.getCampus());
				session.setAttribute("nickname", sDTO.getNickname());
				session.setAttribute("setting", setting);
				// 닉네임 설정
				if (sDTO.getNickname().length() < 1) {
					String num = Integer.toString(sDTO.getUser_no());

					UserDTO nDTO = new UserDTO();
					nDTO.setNickname("user_" + num);
					nDTO.setStu_no(stu_no);

					userService.setNickname(nDTO);
				}

				String payment = "";
				try {
					payment = (String) session.getAttribute("payment");
					payment.length();
				} catch (Exception e) {
					StuDTO mDTO = userService.getStudent(stu_no);
					String barcode = userService.getBarcode(stu_no);

					model.addAttribute("barcode", barcode);

					model.addAttribute("stu_no", mDTO.getStu_no());
					model.addAttribute("stu_name", mDTO.getStu_name());
					model.addAttribute("department", mDTO.getDepartment());
					model.addAttribute("birthday", mDTO.getBirthday());

					session.setAttribute("payment", mDTO.getPayment());
				}

			}

		} catch (NullPointerException e) {
			System.out.println("비회원");
		}

		return "/index";
	}

	@RequestMapping(value = "loginProc", method = RequestMethod.POST)
	public String loginProc(HttpSession session, HttpServletRequest request, Model model, HttpServletResponse response)
			throws Exception {
		// reCAPTCHA
		VerifyRecaptcha.setSecretKey("6LeaUI0UAAAAACLSwHGkBDb4pF0jqZ8LyrJpnRR8");
		String gRecaptchaResponse = request.getParameter("g-recaptcha-response");

		// 0 = 성공, 1 = 실패, -1 = 오류  VerifyRecaptcha.verify(gRecaptchaResponse)
		try {
			if (VerifyRecaptcha.verify(gRecaptchaResponse)) {

				// 성공시
				String temp_id = CmmUtil.nvl(request.getParameter("id"));
				String password = CmmUtil.nvl(request.getParameter("password"));

				UserDTO tempDTO = new UserDTO();
				tempDTO.setStu_no(temp_id);
				tempDTO.setPassword(password);

				String stu_no = userService.getLogin(tempDTO);

				try {
					stu_no.length();
				} catch (NullPointerException e) {
					stu_no = "";
				}

				if (stu_no.length() < 1) {
					model.addAttribute("msg", "존재하지 않는 아이디 입니다.");
					model.addAttribute("url", "/");
					return "/alert";
				} else if (stu_no.contains("admin")) {
					session.setAttribute("stu_no", temp_id);
					model.addAttribute("url", "/admin/main.do");
					return "/alert2";
				} else if (stu_no.length() < 10) {
					model.addAttribute("msg", "잘못된 아이디입니다.");
					model.addAttribute("url", "/");
					return "/alert";
				} else {
					UserDTO userDTO = new UserDTO();

					// 쿠키
					if (request.getParameter("useCookie") != null) {
						// 쿠키 생성
						Cookie loginCookie = new Cookie("loginCookie", session.getId());
						loginCookie.setPath("/");
						loginCookie.setMaxAge(60 * 60 * 24 * 31);
						// 전송
						response.addCookie(loginCookie);

						// DB에 세션 저장
						int amount = 60 * 60 * 24 * 31; // 31일 씩
						Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount)); // 로그인 유지기간 설정

						userDTO.setStu_no(tempDTO.getStu_no());
						userDTO.setSession_key(loginCookie.getValue());
						userDTO.setSession_limit(sessionLimit);
						userService.keepLogin(userDTO);
					}

					model.addAttribute("url", "/");
					session.setAttribute("stu_no", temp_id);

				}

				return "/alert2";
			} else {
				model.addAttribute("msg", "악의적인 활동이 인지되었습니다. 잠시후, 다시시도해주세요");
				model.addAttribute("url", "/");
				return "/alert";
			}
		} catch (IOException e) {
			e.printStackTrace();
			model.addAttribute("msg", "reCAPTCHA 오류");
			model.addAttribute("url", "/");
			return "/alert";
		}

	}

	// 로그아웃 처리
	@RequestMapping(value = "logout")
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model)
			throws Exception {
		String stu_no = (String) session.getAttribute("stu_no");
		if (stu_no != null) {
			session.removeAttribute("stu_no");
			session.invalidate();

			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);

				UserDTO userDTO = new UserDTO();
				Date sessionLimit = new Date(System.currentTimeMillis());

				userDTO.setStu_no(stu_no);
				userDTO.setSession_key(null);
				userDTO.setSession_limit(sessionLimit);

				userService.keepLogin(userDTO);
			}
		}
		model.addAttribute("url", "/");

		return "/alert2";
	}

	// --------------------------------------------------메인페이지
	// 끝---------------------------------------------------------------------------------------

	// --------------------------------------------------회원가입
	// 시작---------------------------------------------------------------------------------------

	@RequestMapping(value = "/contact")
	public String contact(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session)
			throws Exception {
		return "/contact";
	}

	@RequestMapping(value = "contactProc")
	public String contactProc(HttpServletRequest req, Model model, HttpSession session) throws Exception {
		// reCAPTCHA
				VerifyRecaptcha.setSecretKey("6LeaUI0UAAAAACLSwHGkBDb4pF0jqZ8LyrJpnRR8");
				String gRecaptchaResponse = req.getParameter("g-recaptcha-response");

				// 0 = 성공, 1 = 실패, -1 = 오류
				try {
					if (VerifyRecaptcha.verify(gRecaptchaResponse)) {

						// 성공시
						String stu_no = CmmUtil.nvl(req.getParameter("stu_no"));
						String password = CmmUtil.nvl(req.getParameter("pwd"));
						String agreement = CmmUtil.nvl(req.getParameter("agreement"));
						if (agreement.length() < 1) {
							model.addAttribute("msg", "개인정보활용에 동의해주세요");
							model.addAttribute("url", "/contact.do");
							return "/alert";
						}
						String nickname = "";
						try {
							nickname = CmmUtil.nvl(req.getParameter("nickname"));
							nickname.replaceAll(" ", "");
						} catch (Exception e) {
							nickname = "";
						}

						// 아이디 중복
						String idChk = "";

						try {
							System.out.println("아이디 중복확인");
							idChk = userService.getIdChk(stu_no);
						} catch (Exception e) {
							System.out.println("아이디 중복확인 실패");
							idChk = "";
							System.out.println(e);
						}
						System.out.println("idchk" + idChk);

						// 닉네임 중복
						String nicknameCk = "";

						try {
							System.out.println("닉네임 중복확인");
							nicknameCk = userService.getNickNameCk(nickname);
						} catch (Exception e) {
							System.out.println("닉네임 중복확인 실패");
							nicknameCk = "";
							System.out.println(e);
						}

						// 중복이 일때
						if (idChk != null) {
							//System.out.println("중복일때");

							model.addAttribute("msg", "이미 존재하는 학번입니다.");
							model.addAttribute("url", "/contact.do");
						} else if (nicknameCk != null) {
							//System.out.println("닉네임 중복일때");

							model.addAttribute("msg", "이미 존재하는 닉네임입니다.");
							model.addAttribute("url", "/contact.do");
						} else if (nickname.contains("user") || nickname.contains("admin") || nickname.contains("관리자")
								|| nickname.contains("학생회")) {
							model.addAttribute("msg", "이용불가능한 닉네임입니다.");
							model.addAttribute("url", "/contact.do");
						} else {
							//System.out.println("중복이 아닐때");
							String barcode_no = CmmUtil.nvl(req.getParameter("barcode_no"));
							String name = CmmUtil.nvl(req.getParameter("name"));
							String department = (String) session.getAttribute("department");
							String birthdate = CmmUtil.nvl(req.getParameter("birthdate"));
							String campus = (String) session.getAttribute("campus");

							// compare
							StuDTO sDTO = new StuDTO();
							sDTO.setStu_no(stu_no);
							sDTO.setStu_name(name);
							sDTO.setBirthday(birthdate);
							sDTO.setDepartment(department);
							System.out.println(sDTO.getStu_no());

							String compare = "";

							try {
								compare = userService.getCompare(sDTO); // 학생정보 확인
								//System.out.println("compare");
							} catch (NullPointerException e) {
								compare = "";
							}

							if (compare == null) {// 중복이 아닌것중에서 학생정보에 없는거
								//System.out.println("학생정보에 없을때");
								model.addAttribute("msg", "학적사항이 존재하지 않습니다.");
								model.addAttribute("url", "/contact.do");
							} else if (compare.length() > 0) {
								//System.out.println("회원가입 진행");
								String period = CmmUtil.nvl(req.getParameter("period"));
								if(period.equals("기능사")) {
									int update_period = userService.updatePeriod(stu_no);
									if(update_period == 0) {
										model.addAttribute("msg", "회원가입에 실패 하셨습니다. 오류코드:기능사update");
										model.addAttribute("url", "/contact.do");
										return "alert";
									}
								}
								UserDTO uDTO = new UserDTO();
								uDTO.setStu_no(stu_no);
								uDTO.setPassword(password);
								uDTO.setBarcode_no(barcode_no);
								uDTO.setBarcode_no(barcode_no);
								uDTO.setCampus(campus);
								uDTO.setNickname(nickname);

								int result = userService.insertUser(uDTO);
								//System.out.println(result + "result");

								if (result == 0) {
									// 회원가입이 정상적으로 이루어지지 않음
									model.addAttribute("msg", "회원가입에 실패 하셨습니다.");
									model.addAttribute("url", "/contact.do");
								} else {
									System.out.println("회원가입 성공");
									// 회원가입이 정상적으로 이루어짐
									// 정상적으로 회원가입이 되면 '회원가입이 되었습니다' alert창 띄우고 main.do로 이동

									model.addAttribute("msg", "회원가입이 되었습니다.");
									model.addAttribute("url", "/");
								}
							}
						}
						return "/alert";
					} else {
						model.addAttribute("msg", "악의적인 활동이 인지되었습니다. 잠시후, 다시시도해주세요");
						model.addAttribute("url", "/");
						return "/alert";
					}
				} catch (IOException e) {
					e.printStackTrace();
					model.addAttribute("msg", "reCAPTCHA 오류");
					model.addAttribute("url", "/");
					return "/alert";
				}
		
	}

	// -------------------------------------------------회원가입
	// 끝---------------------------------------------------------------------------------------

	@RequestMapping(value = "/change")
	public String change(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session)
			throws Exception {
		return "/change";
	}

	// -------------------------------------------------사진 등록/수정 매핑
	// 시작---------------------------------------------------------------------------------------
	@RequestMapping(value = "updatePhoto")
	public String updatePhoto(@RequestParam("photo") MultipartFile photo1, MultipartHttpServletRequest request,
			HttpServletResponse response, Model model, HttpSession session) throws Exception {
		//System.out.println(photo1.getName());
		String stu_no = request.getParameter("stu_no");
		
		//기존파일 경로 확인
		String path = userService.getPath(stu_no);
		
		UtilFile utilFile = new UtilFile();

		// 파일 업로드 결과값을 path로 받아온다(이미 fileUpload() 메소드에서 해당 경로에 업로드는 끝났음)
		String photo = utilFile.fileUpload(request, photo1, path);

		int photo_num = userService.getPhotoNum(stu_no);
		if (photo_num < 4) {
			UserDTO pDTO = new UserDTO();

			pDTO.setStu_no(stu_no);
			pDTO.setPhoto(photo);
			pDTO.setPhoto_num(photo_num + 1);

			int result = userService.updatePhoto(pDTO);

			if (result != 0) {
				model.addAttribute("msg", "등록되었습니다.");
				model.addAttribute("url", "/");
			} else {
				model.addAttribute("msg", "등록에 실패하였습니다.");
				model.addAttribute("url", "/change.do");
			}
		} else {
			model.addAttribute("msg", "사진 변경 가능 횟수를 초과했습니다.");
			model.addAttribute("url", "/change.do");
		}

		return "/alert";
	}
	// -------------------------------------------------사진 등록/수정 매핑
	// 끝---------------------------------------------------------------------------------------

	// --------------------------------------------------회원정보 수정
	// 끝---------------------------------------------------------------------------------------
	// --------------------------------------------------비밀번호
	// 찾기/
	// 재설정---------------------------------------------------------------------------------------

	@RequestMapping(value = "find_pw")
	public String find_pw() throws Exception {
		return "/find_pw";
	}

	@RequestMapping(value = "set_pw")
	public String set_pw(HttpSession session) throws Exception {
		try {
			session.setAttribute("temp_id", session.getAttribute("stu_no"));
		} catch (Exception e) {
			session.setAttribute("temp_id", "");
		}

		return "/set_pw";
	}

	@RequestMapping(value = "findPW")
	public String findPW(HttpServletRequest req, Model model, HttpSession session) throws Exception {

		System.out.println("비밀번호 찾기");
		session.removeAttribute("temp_id");
		String stu_no = CmmUtil.nvl(req.getParameter("stu_no"));
		String name = CmmUtil.nvl(req.getParameter("name"));
		String department = CmmUtil.nvl(req.getParameter("department"));
		String birthdate = CmmUtil.nvl(req.getParameter("birthdate"));

		// compare
		StuDTO sDTO = new StuDTO();
		sDTO.setStu_no(stu_no);
		sDTO.setStu_name(name);
		sDTO.setBirthday(birthdate);
		sDTO.setDepartment(department);

		String compare = "";

		try {
			compare = userService.getCompare(sDTO); // 학생정보 확인
			System.out.println(compare);
		} catch (NullPointerException e) {
			System.out.println("학적사항 없음.");
			compare = "";
		}

		if (compare == null) {// 중복이 아닌것중에서 학생정보에 없는거
			System.out.println("학생정보에 없을때");
			model.addAttribute("msg", "학적사항이 존재하지 않습니다.");
			model.addAttribute("url", "/find_pw.do");
		} else {

			session.setAttribute("temp_id", stu_no);
			model.addAttribute("msg", "비밀번호를 재설정 합니다.");
			model.addAttribute("url", "/set_pw.do");
		}
		return "/alert";

	}

	@RequestMapping(value = "setPW")
	public String setPW(HttpServletRequest req, Model model, HttpSession session) throws Exception {
		String stu_no = CmmUtil.nvl((String) session.getAttribute("temp_id"));
		String password = CmmUtil.nvl(req.getParameter("pwd"));

		System.out.println("비밀번호 수정 진행");
		UserDTO uDTO = new UserDTO();
		uDTO.setStu_no(stu_no);
		uDTO.setPassword(password);

		int result = userService.setPassword(uDTO);

		if (result == 0) {
			// 회원가입이 정상적으로 이루어지지 않음
			model.addAttribute("msg", "비밀번호 수정에 실패 하셨습니다.");
			model.addAttribute("url", "/set_pw.do");
			session.setAttribute("temp_id", stu_no);
		} else {
			System.out.println("비밀번호 수정 성공");
			// 회원가입이 정상적으로 이루어짐
			// 정상적으로 회원가입이 되면 '회원가입이 되었습니다' alert창 띄우고 main.do로 이동

			model.addAttribute("msg", "비밀번호가 수정되었습니다.");
			model.addAttribute("url", "/");
			session.invalidate();
		}

		return "/alert";

	}

	// -------------------------------------------------비밀번호 찾기/재설정
	// 끝---------------------------------------------------------------------------------------

	// -------------------------------------------------웹크롤링
	// ---------------------------------------------------------------------------------------
	@RequestMapping(value = "/web_crolling", method = RequestMethod.GET)
	public String web_crolling(HttpServletRequest request, Model model) throws Exception {
		String url = CmmUtil.nvl(request.getParameter("url"));
		String type = CmmUtil.nvl(request.getParameter("type"));

		model.addAttribute("url", url);
		model.addAttribute("type", type);
		return "/web_crolling";
	}

	// --------------------------------------------------회원 탈퇴
	// 시작---------------------------------------------------------------------------------------

	@RequestMapping(value = "/deleteUser")
	public String deleteUser(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session)
			throws Exception {
		String stu_no = CmmUtil.nvl(request.getParameter("stu_no"));

		int result = userService.deleteUser(stu_no);

		if (result == 1) {
			model.addAttribute("msg", "회원탈퇴 되었습니다.");
			model.addAttribute("url", "/");
			session.invalidate();
		} else {
			model.addAttribute("msg", "회원탈퇴 실패하였습니다.");
			model.addAttribute("url", "/");
		}
		return "/alert";
	}

	// --------------------------------------------------회원 탈퇴
	// 끝---------------------------------------------------------------------------------------
	// --------------------------------------------------회원가입---------------------------------------------------------------------------------------

	@RequestMapping(value = "campus")
	public String campus(HttpSession session) throws Exception {
		session.invalidate();
		return "/campus";
	}

	@RequestMapping(value = "major")
	public String major(HttpSession session) throws Exception {
		return "/major";
	}

	@RequestMapping(value = "campusProc")
	public String campusProc(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		String campus = CmmUtil.nvl(request.getParameter("campus"));
		String period = CmmUtil.nvl(request.getParameter("period"));

		model.addAttribute("url", "/major.do");
		session.setAttribute("campus", campus);
		session.setAttribute("period", period);

		return "/alert2";
	}

	@RequestMapping(value = "majorProc")
	public String majorProc(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		String campus = CmmUtil.nvl(request.getParameter("campus"));
		String period = CmmUtil.nvl(request.getParameter("period"));
		String department = CmmUtil.nvl(request.getParameter("department"));

		model.addAttribute("url", "/contact.do");
		session.setAttribute("campus", campus);
		session.setAttribute("period", period);
		session.setAttribute("department", department);

		return "/alert2";
	}
}
