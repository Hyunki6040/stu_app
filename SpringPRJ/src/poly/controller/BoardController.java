package poly.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import poly.dto.AdminDTO;
import poly.dto.BoardDTO;
import poly.dto.CommentDTO;
import poly.service.IBoardService;
import poly.service.ICommentService;
import poly.util.CmmUtil;
import poly.util.VerifyRecaptcha;

@Controller
public class BoardController {
	@Resource(name = "BoardService")
	private IBoardService boardService;

	@Resource(name = "CommentService")
	private ICommentService commentService;

	@RequestMapping(value = "board")
	public String board(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		String campus = "";
		BoardDTO mDTO = new BoardDTO();// setting DTO
		List<CommentDTO> comments = null;
		try {
			campus = (String) session.getAttribute("campus");
			AdminDTO setting = (AdminDTO) session.getAttribute("setting");
			int hatred_limit = setting.getHatred_limit();

			mDTO.setCampus(campus);
			mDTO.setHatred(hatred_limit);
		} catch (Exception e) {
		}

		try {

			if (campus.length() > 0) {
				System.out.println("회원.글 불러오는중");
				String admin = "admin" + campus;
				// 캠퍼스 글 불러오기.
				List<BoardDTO> campus_list = boardService.CampusList(mDTO);
				List<BoardDTO> campus_best_list = boardService.CampusBestList(mDTO);

				model.addAttribute("board_list", campus_list);
				model.addAttribute("board_best_list", campus_best_list);
				model.addAttribute("admin", admin);

				// 댓글 불러오기
				comments = commentService.CampusCommentsList(mDTO);

			}
		} catch (NullPointerException e) {
			System.out.println("비회원.글 불러오는중");
			// 대학 글 불러오기
			List<BoardDTO> univ_list = boardService.UnivList();
			List<BoardDTO> univ_best_list = boardService.UnivBestList();
			model.addAttribute("board_list", univ_list);
			model.addAttribute("board_best_list", univ_best_list);

			// 댓글 불러오기
			comments = commentService.CommentsList();

		}

		model.addAttribute("comments", comments);
		model.addAttribute("univ_campus", "0");

		return "/board";
	}

	// 게시글 작성처리
	@RequestMapping(value = "BoardProc", method = RequestMethod.POST)
	public String BoardProc(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		// reCAPTCHA
		VerifyRecaptcha.setSecretKey("6LeaUI0UAAAAACLSwHGkBDb4pF0jqZ8LyrJpnRR8");
		String gRecaptchaResponse = request.getParameter("g-recaptcha-response");

		// 0 = 성공, 1 = 실패, -1 = 오류
		try {
			if (VerifyRecaptcha.verify(gRecaptchaResponse)) {

				// 성공시
				String nickname = (String) session.getAttribute("nickname");
				String contents = CmmUtil.nvl(request.getParameter("contents"));
				String board = CmmUtil.nvl(request.getParameter("board"));

				int result = 0;

				contents = contents.replace("\n", "<br>");
				BoardDTO bDTO = new BoardDTO();
				bDTO.setWriter(nickname);
				bDTO.setContents(contents);

				if (board.equals("폴리텍")) {
					result = boardService.Univcreate(bDTO);
				} else if (board.equals("캠퍼스")) {
					String campus = (String) session.getAttribute("campus");
					bDTO.setCampus(campus);
					result = boardService.create(bDTO);
				}

				if (result == 0) {
					model.addAttribute("msg", "게시글 저장에 실패 하셨습니다.");
					model.addAttribute("url", "/board.do");
				} else {
					model.addAttribute("msg", "게시글이 저장되었습니다.");
					model.addAttribute("url", "/board.do");
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

	// 댓글 작성처리
	@RequestMapping(value = "CommentProc", method = RequestMethod.POST)
	public String CommentProc(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		// reCAPTCHA
		VerifyRecaptcha.setSecretKey("6LeaUI0UAAAAACLSwHGkBDb4pF0jqZ8LyrJpnRR8");
		String gRecaptchaResponse = request.getParameter("g-recaptcha-response");

		// 0 = 성공, 1 = 실패, -1 = 오류
		try {
			if (VerifyRecaptcha.verify(gRecaptchaResponse)) {

				// 성공시
				int bno = Integer.parseInt(CmmUtil.nvl(request.getParameter("bno")));
				String writer = (String) session.getAttribute("nickname");
				String comments = CmmUtil.nvl(request.getParameter("comments"));

				int result = 0;

				comments = comments.replace("\n", "<br>");
				CommentDTO cDTO = new CommentDTO();
				cDTO.setBno(bno);
				cDTO.setWriter(writer);
				cDTO.setComments(comments);

				result = commentService.insert(cDTO);

				if (result == 0) {
					model.addAttribute("msg", "댓글 저장에 실패 하셨습니다.");
					model.addAttribute("url", "/board.do");
				} else {
					model.addAttribute("msg", "댓글이 저장되었습니다.");
					model.addAttribute("url", "/board.do");
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

	// 게시글 좋아요 처리
	@RequestMapping(value = "LikedContext", method = RequestMethod.GET)
	public String LikedContext(HttpServletRequest request, Model model, HttpSession session) throws Exception {

		String nickname = (String) session.getAttribute("nickname");
		int result = 0;
		int bno = Integer.parseInt(CmmUtil.nvl(request.getParameter("bno")));

		BoardDTO bDTO = new BoardDTO();
		bDTO = boardService.getBoard(bno);

		String liked_usr = bDTO.getLiked_usr();
		int liked = bDTO.getLiked();
		List<String> likedUserList = new ArrayList<String>();

		likedUserList = new ArrayList<String>(Arrays.asList(liked_usr.split(", ")));
		if (liked_usr.equals(", ")) {
			liked_usr = nickname + ", ";
		} else {
			liked_usr += nickname + ", ";
		}

		if (likedUserList.contains(nickname)) {
			result = 2;
		} else {
			BoardDTO aDTO = new BoardDTO();
			liked++;
			aDTO.setBno(bno);
			aDTO.setLiked_usr(liked_usr);
			aDTO.setLiked(liked);

			result = boardService.updateLikedBoard(aDTO);
		}

		if (result == 0) {
			model.addAttribute("msg", "게시글 좋아요에 실패 하셨습니다.");
			model.addAttribute("url", "/board.do");
		} else if (result == 2) {
			model.addAttribute("msg", "이미 좋아요를 누르셨습니다.");
			model.addAttribute("url", "/board.do");
		} else {
			model.addAttribute("url", "/board.do");
			return "/alert2";
		}

		return "/alert";
	}

	// 게시글 신고 처리
	@RequestMapping(value = "HatredContext", method = RequestMethod.GET)
	public String HatredContext(HttpServletRequest request, Model model, HttpSession session) throws Exception {

		String nickname = (String) session.getAttribute("nickname");
		int result = 0;
		int bno = Integer.parseInt(CmmUtil.nvl(request.getParameter("bno")));

		BoardDTO bDTO = new BoardDTO();
		bDTO = boardService.getBoard(bno);

		String hatred_usr = bDTO.getHatred_usr();
		int hatred = bDTO.getHatred();
		List<String> hatredUserList = new ArrayList<String>();

		hatredUserList = new ArrayList<String>(Arrays.asList(hatred_usr.split(", ")));
		if (hatred_usr.equals(", ")) {
			hatred_usr = nickname + ", ";
		} else {
			hatred_usr += nickname + ", ";
		}

		if (hatredUserList.contains(nickname)) {
			result = 2;
		} else {
			BoardDTO aDTO = new BoardDTO();
			hatred++;
			aDTO.setBno(bno);
			aDTO.setHatred_usr(hatred_usr);
			aDTO.setHatred(hatred);

			result = boardService.updateHatredBoard(aDTO);
		}

		if (result == 0) {
			model.addAttribute("msg", "게시글 신고에 실패 하셨습니다.");
			model.addAttribute("url", "/board.do");
		} else if (result == 2) {
			model.addAttribute("msg", "이미 신고한 게시글입니다.");
			model.addAttribute("url", "/board.do");
		} else {
			model.addAttribute("msg", "게시글이 신고되었습니다.");
			model.addAttribute("url", "/board.do");
		}

		return "/alert";
	}

	// 댓글 좋아요 처리
	@RequestMapping(value = "LikedComment", method = RequestMethod.GET)
	public String LikedComment(HttpServletRequest request, Model model, HttpSession session) throws Exception {

		String nickname = (String) session.getAttribute("nickname");
		int result = 0;
		int cno = Integer.parseInt(CmmUtil.nvl(request.getParameter("cno")));

		CommentDTO bDTO = new CommentDTO();
		bDTO = commentService.getComment(cno);

		String liked_usr = bDTO.getLiked_usr();
		int liked = bDTO.getLiked();
		List<String> likedUserList = new ArrayList<String>();

		likedUserList = new ArrayList<String>(Arrays.asList(liked_usr.split(", ")));
		if (liked_usr.equals(", ")) {
			liked_usr = nickname + ", ";
		} else {
			liked_usr += nickname + ", ";
		}

		if (likedUserList.contains(nickname)) {
			result = 2;
		} else {
			CommentDTO aDTO = new CommentDTO();
			liked++;
			aDTO.setCno(cno);
			aDTO.setLiked_usr(liked_usr);
			aDTO.setLiked(liked);

			result = commentService.updateLikedComment(aDTO);
		}

		if (result == 0) {
			model.addAttribute("msg", "댓글 좋아요에 실패 하셨습니다.");
			model.addAttribute("url", "/board.do");
		} else if (result == 2) {
			model.addAttribute("msg", "이미 좋아요를 누르셨습니다.");
			model.addAttribute("url", "/board.do");
		} else {
			model.addAttribute("url", "/board.do");
			return "/alert2";
		}

		return "/alert";
	}

	// 댓글 신고 처리
	@RequestMapping(value = "HatredComment", method = RequestMethod.GET)
	public String HatredComment(HttpServletRequest request, Model model, HttpSession session) throws Exception {

		String nickname = (String) session.getAttribute("nickname");
		int result = 0;
		int cno = Integer.parseInt(CmmUtil.nvl(request.getParameter("cno")));

		CommentDTO bDTO = new CommentDTO();
		bDTO = commentService.getComment(cno);

		String hatred_usr = bDTO.getHatred_usr();
		int hatred = bDTO.getHatred();
		List<String> hatredUserList = new ArrayList<String>();

		hatredUserList = new ArrayList<String>(Arrays.asList(hatred_usr.split(", ")));
		if (hatred_usr.equals(", ")) {
			hatred_usr = nickname + ", ";
		} else {
			hatred_usr += nickname + ", ";
		}

		if (hatredUserList.contains(nickname)) {
			result = 2;
		} else {
			CommentDTO aDTO = new CommentDTO();
			hatred++;
			aDTO.setCno(cno);
			aDTO.setHatred_usr(hatred_usr);
			aDTO.setHatred(hatred);

			result = commentService.updateHatredComment(aDTO);
		}

		if (result == 0) {
			model.addAttribute("msg", "댓글 신고에 실패 하셨습니다.");
			model.addAttribute("url", "/board.do");
		} else if (result == 2) {
			model.addAttribute("msg", "이미 신고한 댓글입니다.");
			model.addAttribute("url", "/board.do");
		} else {
			model.addAttribute("msg", "댓글이 신고되었습니다.");
			model.addAttribute("url", "/board.do");
		}

		return "/alert";
	}

	// 게시물 삭제
	@RequestMapping(value = "BoardDel")
	public String BoardDel(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		String nickname = (String) session.getAttribute("nickname");
		int result = 0;
		int bno = Integer.parseInt(CmmUtil.nvl(request.getParameter("bno")));

		BoardDTO bDTO = new BoardDTO();
		bDTO.setWriter(nickname);
		bDTO.setBno(bno);

		result = boardService.delete(bDTO);

		if (result == 0) {
			model.addAttribute("msg", "게시글 삭제에 실패 하셨습니다.");
			model.addAttribute("url", "/board.do");
		} else {
			result = boardService.Commentdelete(Integer.toString(bDTO.getBno()));

			if (result == 0) {
				model.addAttribute("msg", "해당 게시글의 댓글 삭제에 실패 하셨습니다.");
				model.addAttribute("url", "/board.do");
			} else {
				model.addAttribute("msg", "해당 게시글이 삭제되었습니다.");
				model.addAttribute("url", "/board.do");
			}
		}

		return "/alert";
	}

	// 댓글 삭제
	@RequestMapping(value = "CommentDel")
	public String CommentDel(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		String nickname = (String) session.getAttribute("nickname");
		int result = 0;
		int cno = Integer.parseInt(CmmUtil.nvl(request.getParameter("cno")));

		CommentDTO bDTO = new CommentDTO();
		bDTO.setWriter(nickname);
		bDTO.setCno(cno);

		result = commentService.delete(bDTO);
		if (result == 0) {
			model.addAttribute("msg", "댓글 삭제에 실패 하셨습니다.");
			model.addAttribute("url", "/board.do");
		} else {
			model.addAttribute("msg", "해당 댓글이 삭제되었습니다.");
			model.addAttribute("url", "/board.do");
		}

		return "/alert";
	}

}
