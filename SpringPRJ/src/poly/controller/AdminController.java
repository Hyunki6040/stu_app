package poly.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.dto.AdminDTO;
import poly.service.IAdminService;

@Controller
public class AdminController {
	@Resource(name = "AdminService")
	private IAdminService adminService;


	@RequestMapping(value = "admin/main")
	public String admin(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		String stu_no = (String)session.getAttribute("stu_no");
		String campus = (String)stu_no.replaceAll("admin", "");
		AdminDTO admin = adminService.getAdmin(campus);
		try {
		model.addAttribute("admin", admin);
		}catch(Exception e) {
			return "/";
		}
		
		return "/admin/main";
	}
	
	@RequestMapping(value = "admin/agreement")
	public String agreement() throws Exception {
		return "/admin/agreement";
	}


}
