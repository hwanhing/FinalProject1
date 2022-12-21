package com.spring.coffee;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpResponse;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.model.BoardMemberDTO;
import com.spring.model.BoardReplyDTO;
import com.spring.model.CoffeeTestDAO;
import com.spring.model.CoffeeTestDTO;
import com.spring.model.FinalAdminDTO;
import com.spring.model.FinalMemberDTO;
import com.spring.model.MemberDAO;

@Controller
public class MemberController {

	@Inject
	private MemberDAO dao;
	
	
	@RequestMapping("member_login_check.do")
	public String check(FinalMemberDTO dto, HttpSession session, HttpServletResponse response) throws IOException {

		PrintWriter out = response.getWriter();

		// input창에 아이디값이 admin일 경우에 관리자 페이지로 넘어간다.
		if (dto.getMember_id().equals("admin")) {
			dto.setAdmin_id(dto.getMember_id());
			dto.setAdmin_pwd(dto.getMember_pwd());

			FinalAdminDTO a_dto = this.dao.checkAdmin(dto);
			
			session.setAttribute("admin_num", a_dto.getAdmin_num());
			session.setAttribute("admin_id", a_dto.getAdmin_id());
			session.setAttribute("admin_name", a_dto.getAdmin_name());
			
			return "./Admin/admin_main";
		}

		
		if(!dto.getMember_id().equals("admin")) {
			
		
			FinalMemberDTO f_dto = this.dao.checkMember(dto);

			if (f_dto != null) { // 세션 변수 저장
				
				session.setAttribute("member_num", f_dto.getMember_num());
				
				session.setAttribute("member_id", f_dto.getMember_id());
				
				session.setAttribute("member_name", f_dto.getMember_name());
				session.setAttribute("member_img", f_dto.getMember_img());
				
				session.setAttribute("member_name", f_dto.getMember_name());
				session.setAttribute("member_point", f_dto.getMember_point());
				session.setAttribute("test_num", f_dto.getTest_num());
				session.setAttribute("test_img", f_dto.getTest_img());
				session.setAttribute("test_name", f_dto.getTest_name());
				
			}else if(f_dto == null) {
				
				out.println("<script>");
				out.println("alert('로그인안됨;;')"); 
				out.println("history.back()");
				out.println("</script>");
			}

		}
		return "main";

	}

	/*
	 * @RequestMapping("member_join_check.do")
	 * 
	 * @ResponseBody public void joinCheck(@RequestParam("joinId") String joinId,
	 * FinalMemberDTO dto, HttpResponse response) {
	 * 
	 * dto.setMember_id(joinId);
	 * 
	 * int res = this.dao.joinIdCheck(dto);
	 * 
	 * System.out.println("ssss" + res);
	 * 
	 * return "main";
	 * 
	 * }
	 * 
	 * 
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping("member_Id_check.do") public int
	 * joinIdCheck(@RequestParam("member_id")String joinId, HttpServletResponse
	 * response) {
	 * 
	 * System.out.println("controller id: " + joinId);
	 * 
	 * int result = dao.joinIdCheck(joinId);
	 * 
	 * System.out.println("controller result: " + result);
	 * 
	 * return result;
	 * 
	 * 
	 * }
	 */
	
	@RequestMapping("member_logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		this.dao.logout(session); 
		 mav.setViewName("main"); 
		 mav.addObject("message", "logout"); 
		  return mav;
		  }
	
	@RequestMapping("member_mypage.do")
	public String Mypage(@RequestParam("num") int num, Model model, HttpSession session) {

		session.getAttribute("member_num");

		FinalMemberDTO dto = this.dao.MemberMyPage(num);

		model.addAttribute("Mypage", dto);

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
	 
	  @RequestMapping("addr_modify2.do")
	  public String Modify2(@RequestParam("num")int num,Model model) {
		  
		  FinalMemberDTO dto = this.dao.MemberMyPage(num);
		  
		  model.addAttribute("AddrModify",dto);
		  
		  return "./member/addr_modify2";
	  }
	 
	 @RequestMapping("addr_modify2_ok.do")
	 public void addr_modify2_ok(FinalMemberDTO dto, HttpServletResponse response) throws IOException {
		 
		 response.setContentType("text/html; charset=UTF-8");
		 
		 int check = this.dao.addrModify2(dto);

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
	 
	  @RequestMapping("addr_modify3.do")
	  public String Modify3(@RequestParam("num")int num,Model model) {
		  
		  FinalMemberDTO dto = this.dao.MemberMyPage(num);
		  
		  model.addAttribute("AddrModify",dto);
		  
		  return "./member/addr_modify3";
	  }
	 
	 
	 @RequestMapping("addr_modify3_ok.do")
	 public void addr_modify3_ok(FinalMemberDTO dto, HttpServletResponse response) throws IOException {
		 
		 response.setContentType("text/html; charset=UTF-8");
		 
		 int check = this.dao.addrModify3(dto);
		
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
	 
	  @RequestMapping("addr_modify4.do")
	  public String Modify4(@RequestParam("num")int num,Model model) {
		  
		  FinalMemberDTO dto = this.dao.MemberMyPage(num);
		  
		  model.addAttribute("AddrModify",dto);
		  
		  return "./member/addr_modify4";
	  }
	 
	 @RequestMapping("addr_modify4_ok.do")
	 public void addr_modify4_ok(FinalMemberDTO dto, HttpServletResponse response) throws IOException {
		 
		 response.setContentType("text/html; charset=UTF-8");
		 
		 int check = this.dao.addrModify4(dto);

		 
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
	 
	  @RequestMapping("addr_modify5.do")
	  public String Modify5(@RequestParam("num")int num,Model model) {
		  
		  FinalMemberDTO dto = this.dao.MemberMyPage(num);
		  
		  model.addAttribute("AddrModify",dto);
		  
		  return "./member/addr_modify5";
	  }
	 
	 @RequestMapping("addr_modify5_ok.do")
	 public void addr_modify5_ok(FinalMemberDTO dto, HttpServletResponse response) throws IOException {
		 
		 response.setContentType("text/html; charset=UTF-8");
		 
		 int check = this.dao.addrModify5(dto);

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
	 
	  @RequestMapping("user_delete.do")
	  public String delete(@RequestParam("num")int num,Model model) {
		  
		  FinalMemberDTO dto = this.dao.MemberMyPage(num);
		  
		  model.addAttribute("delete",dto);
		  
		  return "./member/user_delete";
	  }	


	  @RequestMapping("memberDelete.do")
	  public void deleteok(@RequestParam("num")int num,FinalMemberDTO dto ,HttpServletRequest request ,HttpServletResponse response) throws IOException {
		  System.out.println("num>>>>>>>>>>>>>>>>>>>>" + num);
		  
		response.setContentType("text/html; charset=UTF-8");

		int check = this.dao.deletemember(num);

		PrintWriter out = response.getWriter();
		System.out.println("check>>>>>>>>>>>>>>>" + check);
		if (check > 0) {
			out.println("<script>");
			out.println("alert('그동안 이용해주셔서 감사합니다')");
			out.println("location.href='" + request.getContextPath() + "/'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('데이터 통신 오류')");
			out.println("history.back()");
			out.println("</script>");

		}
	}

	@RequestMapping("member_Phone_Modify.do")
	public String phoneModify(@RequestParam("num") int num, @RequestParam("phone") String phone, Model model) {

		FinalMemberDTO dto = this.dao.MemberMyPage(num);

		model.addAttribute("phone", dto);

		return "./member/PhoneModify";
	}

	@RequestMapping("phone_modify_ok.do")
	public void PhoneModifyok(FinalMemberDTO dto, HttpServletResponse response) throws IOException {
		System.out.println(" dto.getMember_phone()>>" + dto.getMember_phone());
		System.out.println(" dto.getMember_num()>>" + dto.getMember_num());
		int check = this.dao.phone_modify(dto);

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		System.out.println("check>>>>>>>>>>>>>>>" + check);

		if (check > 0) {
			out.println("<script>");
			out.println("alert('연락처 수정완료')");
			out.println("location.href='member_mypage.do?num=" + dto.getMember_num() + "'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('데이터 통신 오류')");
			out.println("history.back()");
			out.println("</script>");
		}

	}

	@RequestMapping("member_Email_Modify.do")
	public String Email_Modify(@RequestParam("num") int num, Model model) {

		FinalMemberDTO dto = this.dao.MemberMyPage(num);

		model.addAttribute("Email", dto);

		return "./member/Email_Modify";
	}

	@RequestMapping("Email_Modify_ok.do")
	public void Email_Modify_ok(FinalMemberDTO dto, HttpServletResponse response) throws IOException {

		int check = this.dao.email_modify(dto);

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		System.out.println("check>>>>>>>>>>>>>>>" + check);

		if (check > 0) {
			out.println("<script>");
			out.println("alert('이메일 수정완료')");
			out.println("location.href='member_mypage.do?num=" + dto.getMember_num() + "'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('데이터 통신 오류')");
			out.println("history.back()");
			out.println("</script>");
		}

	}

	@RequestMapping("member_Pwd_Modify.do")
	public String pwd_modify(@RequestParam("num") int num, Model model) {

		FinalMemberDTO dto = this.dao.MemberMyPage(num);

		model.addAttribute("pwd", dto);

		return "./member/pwd_modify";
	}

	@RequestMapping("pwd_modifyOk.do")

	public void pwd_modifyok(@RequestParam("db_pwd2") String pwd2, FinalMemberDTO dto, HttpServletResponse response)
			throws IOException {

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		if (dto.getMember_pwd().equals(pwd2)) {

			System.out.println(dto.getMember_pwd());
			System.out.println(pwd2);

			int check = this.dao.pwd_modify(dto);
			System.out.println("check>>>" + check);
			if (check > 0) {

				out.println("<script>");
				out.println("alert('비밀번호 수정완료')");
				out.println("location.href='member_mypage.do?num=" + dto.getMember_num() + "'");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('데이터 통신오류')");
				out.println("history.back()");
				out.println("</script>");
			}

		} else {
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다')");
			out.println("history.back()");
			out.println("</script>");
		}

	}

	@RequestMapping("member_heart.do")
	public String member_herat(@RequestParam("num") int num, Model model) {

		List<FinalMemberDTO> dto = this.dao.member_heart(num);

		model.addAttribute("mystar", dto);

		return "./member/MyHeart";
	}

	@RequestMapping("myheart_delete.do")
	public void myheart_delete(@RequestParam("num") int num, FinalMemberDTO dto, HttpServletResponse response)
			throws IOException {

		int check = this.dao.myheartdelete(num);

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		if (check > 0) {

			out.println("<script>");
			out.println("alert('찜목록삭제')");
			out.println("location.href='member_heart.do?num=" + dto.getMember_num() + "'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('데이터 통신오류')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

	@RequestMapping("board_list.do")
	public String board_list(@RequestParam("num") int num, Model model) {

		List<FinalMemberDTO> dto = this.dao.BoardList(num);

		model.addAttribute("board_list", dto);

		return "./member/board_list";

	}

	@RequestMapping("board_cont.do")
	public String board_cont(@RequestParam("num") int num, Model model) {

		FinalMemberDTO dto = this.dao.boardcont(num);

		BoardReplyDTO dto1 = this.dao.replycont(num);

		model.addAttribute("board_cont", dto);

		model.addAttribute("admin_reply", dto1);

		return "./member/board_cont";

	}

	@RequestMapping("myboard_delete.do")
	public void myboarddelete(@RequestParam("no") int no, @RequestParam("num") int num, FinalMemberDTO dto,
			HttpServletResponse response) throws IOException {

		int check = this.dao.myboard_delete(no);

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();
		System.out.println(">>>>>>>>" + num);
		if (check > 0) {

			out.println("<script>");
			/* out.println("alert('삭제')"); */
			out.println("location.href='board_list.do?num=" + num + "'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('데이터 통신오류')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

	@RequestMapping("w_write.do")
	public String w_write(FinalMemberDTO dto, Model model) {

		return "./member/w_write";

	}

	@RequestMapping("write_ok.do")
	public void write_ok(HttpSession session, FinalMemberDTO dto, HttpServletResponse response) throws IOException {

		Object num = session.getAttribute("member_num");

		System.out.println("세션>>>>>>>" + session.getAttribute("member_num"));
		int check = this.dao.w_writeok(dto);

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		if (check > 0) {

			out.println("<script>");
			out.println("location.href='board_list.do?num=" + num + "'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('데이터 통신오류')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

	@RequestMapping("imgchang.do")
	public String imgchange(@RequestParam("num") int num, Model model) {
		FinalMemberDTO dto = this.dao.MemberMyPage(num);

		model.addAttribute("hana", dto);

		return "./member/mypage_img";
	}

	@RequestMapping("addr_imgmodify_ok.do")
	public void addr_imgmodfiy_ok(MultipartHttpServletRequest mRequest, @RequestParam("member_num") int member_num,
			@RequestParam(value = "img", required = false, defaultValue = "") String img, HttpServletResponse response,
			HttpServletRequest request) throws IOException {

		System.out.println("dddd222dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd");
		FinalMemberDTO fmdto = this.dao.MemberMyPage(member_num);
		// String uploadPath = "C:\\Users\\user\\Desktop\\spring\\img\\";
		////////////////////////// 572줄 공란
		String uploadPath = request.getRealPath("/resources/res/img/");
		System.out.println(uploadPath);

		// 업로드된 파일들의 이름 목록을 제공하는 메서드.
		Iterator<String> iterator = mRequest.getFileNames();
		System.out.println("iterator : " + iterator);
		// 실제 폴더를 만들어 보자.

		String homedir = uploadPath;
		System.out.println("homedir : " + homedir);

		File path1 = new File(homedir);
		System.out.println("path1 : " + path1);

		if (!path1.exists()) {
			path1.mkdirs();
		}
		while (iterator.hasNext()) {
			System.out.println("dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd");
			String uploadFileName = iterator.next();
			System.out.println("uploadFileName : " + uploadFileName);

			MultipartFile mFile = mRequest.getFile(uploadFileName);
			System.out.println("mFile : " + mFile);

			String originalFileName = mFile.getOriginalFilename();
			System.out.println("originalFileName : " + originalFileName);

			// 실제 파일을 만들어 보자.(파일복사느낌임)
			String saveFileName = originalFileName;
			System.out.println("saveFileName : " + saveFileName);

			if (!saveFileName.equals(null)) {
				saveFileName = System.currentTimeMillis() + "_" + saveFileName; // 현재 시간을 천분의 1초단위로 계산하고 있는 메소드래..
				System.out.println("saveFileName : " + saveFileName);

				try {
					// ...................\\resources\\upload\\2022-11-25\\실제파일
					File origin = new File(uploadPath + "/" + saveFileName);

					// transferTo() : 파일 데이터를 지정한 폴더로 실제 저장시키는 메서드.
					if (!img.equals(""))
						new File(img).delete();

					mFile.transferTo(origin);
					fmdto.setMember_img(saveFileName);

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			int i = dao.Memberupdate(fmdto);
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();

			out.println("<script>location.href='" + mRequest.getContextPath() + "/member_mypage.do?num=" + member_num
					+ "';</script>");
		}

	}
}
