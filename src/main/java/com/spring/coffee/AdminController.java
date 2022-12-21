package com.spring.coffee;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.AdminDAO;
import com.spring.model.CoffeeBeanDTO;
import com.spring.model.CoffeeOrderDTO;
import com.spring.model.FinalAdminDTO;
import com.spring.model.FinalMemberDTO;
import com.spring.model.PageDTO;

@Controller
public class AdminController {

@Inject
private AdminDAO dao;

//한페이지당 보여질 게시물수
private final int rowsize=5;
//DB상의 전체 게시물 수
private int totalRecord=0;

/*
	@RequestMapping("adminlogin.do")
	public String adminlogPage() {
		
		return "./Admin/adminlog";
	}
	
	@RequestMapping("admin_login_check.do")
	public String check_admin(FinalAdminDTO dto,HttpSession session,HttpServletResponse response) throws IOException {
		
		FinalAdminDTO a_dto = this.dao.admin_check(dto);
		
		PrintWriter out = response.getWriter();
		
		if(a_dto != null) {
				session.setAttribute("admin_id", a_dto.getAdmin_id());
			
		}else if(a_dto==null){
			out.println("<script>");
			out.println("alert('로그인안됨;;')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return "./Admin/admin_main";
	}
*/	
	
	@RequestMapping("admin_main.do")
	public String main() {
		return "./Admin/admin_main";
	}
	
	@RequestMapping("admin_memeber.do")
	public String member_list(HttpServletRequest request, Model model) {
		
		
		 // 페이징 처리 작업
        int page;    // 현재 페이지 변수

        if(request.getParameter("page") != null) {

            page = Integer.parseInt(request.getParameter("page"));

        }else {

            // 처음으로 게시물 전체 목록을 클릭한 경우.
            page = 1;
        }

        // DB상의 전체 게시물의 수를 확인하는 메서드 호출.
        totalRecord = this.dao.memberList();

        PageDTO dto = new PageDTO(page, this.rowsize,this.totalRecord);
             
        List<FinalMemberDTO> list = this.dao.memberList(dto);
        // 페이지에 해당하는 게시물을 가져오는 메서드 호출.
     

        model.addAttribute("Paging", dto);
			
		model.addAttribute("memberList", list);
		
		return "./Admin/Admin_Member_List";
	}
	@RequestMapping("admin_cont.do")
	public String admin_cont(@RequestParam("num")int num,@RequestParam("page") int nowPage ,Model model) {
		
		FinalMemberDTO dto = this.dao.admin_cont(num);
		
		List<CoffeeOrderDTO> dto1 =this.dao.admin_order(num);
		
	
	
		
		model.addAttribute("member_order", dto1);
		model.addAttribute("member_cont",dto);
		model.addAttribute("page", nowPage);
		
		return "./Admin/Admin_cont";
	}
	
	
	// 관리자 원두 관리 페이지
	@RequestMapping("admin_beans.do")
	public String admin_beans(Model model, HttpServletRequest request) {

		 // 페이징 처리 작업
        int page;    // 현재 페이지 변수

        if(request.getParameter("page") != null) {

            page = Integer.parseInt(request.getParameter("page"));

        }else {

            // 처음으로 게시물 전체 목록을 클릭한 경우.
            page = 1;
        }

        // DB상의 전체 게시물의 수를 확인하는 메서드 호출.
        totalRecord = this.dao.beansList();

        PageDTO dto = new PageDTO(page, this.rowsize,this.totalRecord);		
		
		List<CoffeeBeanDTO> list = this.dao.getBeanList(dto);
		
		// 원두 전체 개수 저장
		String count = this.dao.getBeansCount();
		System.out.println("count>>"+count);
		model.addAttribute("Count", count);
		
		model.addAttribute("beans_list", list);
		model.addAttribute("Paging", dto);
		
		/*
		 * int totalCoffeeCount = this.dao.totalCoffeeCount();
		 * 
		 * select count(*) from coffee_beans;
		 */
		
		return "./Admin/Admin_beans_List";
	}
}
