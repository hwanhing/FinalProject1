package com.spring.coffee;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.model.BeanDAO;
import com.spring.model.CoffeeBeanDTO;
import com.spring.model.CoffeeCartDTO;
import com.spring.model.CoffeeStarDTO;
import com.spring.model.CoffeeWriteDTO;

@Controller
public class CoffeeBeanController {

	@Inject
	private BeanDAO dao;

	@RequestMapping("bean_list.do")
	public String list(Model model, CoffeeBeanDTO dto) {

		// 커피 목록 리스트
		List<CoffeeBeanDTO> list = this.dao.getBeanList();
		model.addAttribute("List", list);

		return "./bean/bean_list";
	}

	// 찜 수정 또는 등록
	@RequestMapping("beans_heart.do")
	public void updateHeart(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int member_num = Integer.valueOf(request.getParameter("member_num"));
		int beans_num = Integer.valueOf(request.getParameter("beans_num"));

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("member_num", member_num);
		map.put("beans_num", beans_num);

		// 이미 데이터가 있다면 DB 수정, 없을 경우 DB 추가 (0일때는 데이터 없음)
		CoffeeStarDTO dto = this.dao.seHeart(map);
		int insertHeart = dto.getBeans_num();
		int updateHeart = dto.getCoffee_heart();

		// 찜해져있는 상태라면 찜 해제(0), 아닐경우 찜하기(1)
		if (updateHeart == 0) {
			updateHeart = 1;

		} else {
			updateHeart = 0;
		}

		map.put("coffee_heart", updateHeart);

		PrintWriter out = response.getWriter();

		if (insertHeart == 0) {
			// 찜 등록
			this.dao.insertHeart(map);
		} else {
			// 찜 수정
			this.dao.updateHeart(map);

		}

		out.println(updateHeart);

	}

	@RequestMapping("beans_list_heart.do")
	public String downlist(Model model, CoffeeBeanDTO dto) {

		// 커피 목록 리스트
		List<CoffeeBeanDTO> list = this.dao.getBeanHeartList();
		model.addAttribute("List", list);

		return "./bean/bean_list";

	}

	@RequestMapping("beans_price_down.do")
	public String priceDownList(Model model, CoffeeBeanDTO dto) {

		// 커피 목록 리스트
		List<CoffeeBeanDTO> list = this.dao.BeanPriceDownList();
		model.addAttribute("List", list);

		return "./bean/bean_list";

	}

	@RequestMapping("beans_price_up.do")
	public String priceUpList(Model model, CoffeeBeanDTO dto) {

		// 커피 목록 리스트
		List<CoffeeBeanDTO> list = this.dao.BeanPriceUpList();
		model.addAttribute("List", list);

		return "./bean/bean_list";

	}

	@RequestMapping("bean_content.do")
	public String content(@RequestParam("num") int num, CoffeeBeanDTO dto_1, Model model) {

		// 커피 목록 리스트
		List<CoffeeBeanDTO> list = this.dao.getBeanList();
		model.addAttribute("List", list);

		CoffeeBeanDTO dto = this.dao.getBeanContent(num);
		model.addAttribute("Cont", dto);

		List<CoffeeWriteDTO> list_1 = this.dao.getWriteList();
		model.addAttribute("writeList", list_1);

		return "./bean/bean_content";
	}

	@RequestMapping("write_insert.do")

	public void writeinsert(MultipartHttpServletRequest mRequest, @RequestParam(value = "writeimg",required = false ,defaultValue = "") String w_file, CoffeeWriteDTO dto, HttpServletResponse response) throws IOException {

		boolean isUpload = false;
		
		dto.setWrite_img(w_file);
		
		String uploadPath = "C:\\NCS\\workspace(spring)\\Final_Coffee\\src\\main\\webapp\\resources\\upload";
		
		Calendar cal = Calendar.getInstance();
		System.out.println(w_file+"w_file");
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		
		// 업로드된 파일들의 이름 목록을 제공하는 메서드.
		Iterator<String> iterator = mRequest.getFileNames();
		
		while(iterator.hasNext()) {
			String uploadFileName = iterator.next();
			
			MultipartFile mFile = mRequest.getFile(uploadFileName);
			
			String originalFileName = mFile.getOriginalFilename();
			
			// 실제 폴더를 만들어 보자.
			// ...................\\resources\\upload\\2022-11-25\\
			String homedir = uploadPath + year + "-" + month + "-" + day;
			
			File path1 = new File(homedir);
			
			if(!path1.exists()) {
				path1.mkdirs();
			}
			
			// 실제 파일을 만들어 보자.(파일복사느낌임)
			String saveFileName = originalFileName;
			
			if(saveFileName.equals(null)) {
				saveFileName = System.currentTimeMillis()+"_"+saveFileName;		// 현재 시간을 천분의 1초단위로 계산하고 있는 메소드래..
				
				try {
					// ...................\\resources\\upload\\2022-11-25\\실제파일
					File origin = new File(homedir+"/"+saveFileName);
					
					// transferTo() : 파일 데이터를 지정한 폴더로 실제 저장시키는 메서드.
					mFile.transferTo(origin);
					
					isUpload = true;
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} // while 문의 end 부분	
		
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("writeinsert", dto);
		map.put("w_file", w_file);
		
		System.out.println("map>>>"+map);
		
		int res = this.dao.seWrite(map);
		
		System.out.println("res>>"+ res);
		
		PrintWriter out = response.getWriter();
		
		if(res > 0) {
			out.println("<script>");
			out.println("alert('후기글 추가 완룡')");
			out.println("location.href='bean_content.do?num="+dto.getBeans_num()+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('후기글 추가 실풰..')");
			out.println("history.back()");
			out.println("</script>");
		}
		

	}

}
