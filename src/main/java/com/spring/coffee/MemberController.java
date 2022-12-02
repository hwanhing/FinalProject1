package com.spring.coffee;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	
	
	@RequestMapping("member_logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		this.dao.logout(session); 
		 mav.setViewName("main"); 
		 mav.addObject("message", "logout"); 
		  return mav;
		  }
	
	@RequestMapping("member_mypage.do")
	public String Mypage(@RequestParam("num") int num ,Model model ) {
		
		FinalMemberDTO dto = this.dao.MemberMyPage(num);
		
		model.addAttribute("Mypage",dto);
		
		return "./member/Mypage";
	}

	
	  @RequestMapping("addr_modify.do")
	  public String Modify(@RequestParam("num")int num,Model model) {
		  
		  FinalMemberDTO dto = this.dao.MemberMyPage(num);
		  
		  model.addAttribute("AddrModify",dto);
		  
		  return "./member/addr_modify";
	  }
	  
	 @RequestMapping("addr_modify_ok.do")
	 public void addr_modify_ok(FinalMemberDTO dto, HttpServletResponse response) throws IOException {
		 
		 response.setContentType("text/html; charset=UTF-8");
		 
		 int check = this.dao.addrModify(dto);
		 System.out.println("rk >>"+ dto.getMember_addr());
		 System.out.println(dto.getMember_num());
		 
		 PrintWriter out = response.getWriter();
		 
			if(check>0) {
				out.println("<script>");
				out.println("alert('주소 수정 성공')");
				out.println("location.href='member_mypage.do?num="+dto.getMember_num()+"'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('주소 수정 실패')");
				out.println("history.back()");
				out.println("</script>");
	 }
	  
	 	}
			}
		
	
	

