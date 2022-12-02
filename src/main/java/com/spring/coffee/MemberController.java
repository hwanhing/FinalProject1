package com.spring.coffee;

import java.io.IOException;
import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.FinalMemberDTO;
import com.spring.model.MemberDAO;


@Controller
public class MemberController {
	
	@Inject
	private MemberDAO dao;
	
	@RequestMapping("member_login.do")
	public String login() {
		
		return "./member/member_login";
	}
	
	@RequestMapping("member_login_check.do")
	public String check(FinalMemberDTO dto, HttpSession session, HttpServletResponse response) throws IOException {
		
		PrintWriter out = response.getWriter();
		
		FinalMemberDTO f_dto = this.dao.checkMember(dto);
		
		 if (f_dto != null) { // 세션 변수 저장
			 
			 session.setAttribute("member_num", f_dto.getMember_num());
			 session.setAttribute("member_id", f_dto.getMember_id());
			  session.setAttribute("member_name", f_dto.getMember_name());
			  
			}else if(f_dto == null) {
				out.println("<script>");
				out.println("alert('로그인안됨;;')");
				out.println("history.back()");
				out.println("</script>");
			}
			 return "main"; 
			}
}
