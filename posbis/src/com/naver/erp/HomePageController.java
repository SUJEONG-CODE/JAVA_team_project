package com.naver.erp;

import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


//-------------------------------------------------------------------------------
// 가상 URL 주소로 접속하며 호출되는 메소드를 소유한 [컨트롤러 클래스] 선언.
// @Controller 를 붙임으로써 [컨트롤러 클래스]임을 지정한다.
//-------------------------------------------------------------------------------
@Controller
// 클래스 내부에서 발생하는 모든 예외를 잡는 것. (잡히면 @ExceptionHandler 가 붙은 메소드를 호출함.)
@ControllerAdvice
public class HomePageController {
	
	 @Autowired private SalesService salesService;
	  
	@RequestMapping( value="/homePageForm.do" )	
	public ModelAndView homePageForm(
			HttpSession session
			) {		// 메소드 이름은 상관 없음.

		// [ModelAndView 객체] 생성.
		// [ModelAndView 객체] 에 [호출할 JSP 페이지명] 을 저장하기.
		// [ModelAndView 객체] 리턴하기
		ModelAndView mav = new ModelAndView();
		mav.setViewName("homePageForm.jsp");    // webContent/WEB-INF/spring/appServlet 폴더 안의 servlet-context.xml 파일 안에 46~49 줄이 접두사 , 접미사 설정이 되어있음. 

	    String rank_code = (String)session.getAttribute("rank_code");
	    mav.addObject("rank_code",rank_code);

		try {
			// 사업자번호 (가게명) 얻기.         
			//=========================================================================================================
			String user_id = (String)session.getAttribute("user_id"); 
			//String user_id = "user7";
		     //System.out.println(user_id);
		     // user_id 를 가지고 u_no 값 얻기
		     int u_no = this.salesService.getUserNo(user_id);
		     System.out.println("user_no : " + u_no);

		     // u_no 값 가지고 business_no, business_name 값 얻기 (N행 N열이라 List<Map<String,String>> .  N행 1열이면 List<String> )
		     List<Map<String,String>> salesNow = this.salesService.getSalesNow(u_no);
		     
		     // ModelAndView 객체에 검색 개수, 게시판 검색 목록 저장하기
		     // ModelAndView 객체에 저장된 DB 연동 결과물은 JSP 페이지에서 EL 문법으로 꺼낼 수 있다. ${저장키값명}
		     // JSP 페이지에서 사용하기 위해 addObject를 사용하여 ModelAndView 객체에 저장.
		     
		     mav.addObject("salesNow" , salesNow);
		     
			//mav.addObject("salesSearchDTO",salesSearchDTO); //자동 기능...안써도 감...? => 안 쓰면 안찍힘...
			 		
			 }catch(Exception e) { //try 구문에서 예외가 발생하면 실행할 구문 설정
				 	System.out.println("<에러발생>");
					System.out.println(e.getMessage()); }
		
		return mav;
		
	}
	


}


// xxx.do로 접속하면 @Controller 가 붙어있는 클래스 안에 @RequestMapping( value="/xxx.do" ) 가 붙어있는 메소드 호출.


