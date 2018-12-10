package com.spring.plan.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.plan.model.dao.DailyDao;
import com.spring.plan.model.service.MemberService;
import com.spring.plan.model.vo.Member;

@Controller
public class MemberController {
	
	@Resource
	private MemberService memberService;
	@Resource
	private DailyDao dailyDao;
	
	@RequestMapping("kakaoLogin.do")
	public ModelAndView kakaoLogin(Member member,HttpSession session) throws Exception{
		Member mvo;
		if(memberService.checkKakao(member)) {
			mvo = memberService.kakaoLogin(member);
			session.setAttribute("member", mvo);
		} else {
			if(member.getGender().equals("undefined")) member.setGender(null);
			if(member.getBirth().equals("undefined")) member.setBirth(null);
			if(member.getMail().equals("undefined")) member.setMail(null);
			memberService.registKakao(member);
			mvo = memberService.kakaoLogin(member);
			session.setAttribute("member", mvo);
		}
		return new ModelAndView("redirect:loadingDaily.do?memberNo="+mvo.getMemberNo());
	}
	
	@RequestMapping("login.do")
	public ModelAndView login(Member member,HttpSession session) throws Exception{
		Member mvo = memberService.login(member);
		session.setAttribute("member", mvo);
		return new ModelAndView("redirect:loadingDaily.do?memberNo="+mvo.getMemberNo());
	}
	
	@RequestMapping("idCheck.do")
	public ModelAndView idcheck(String id) throws Exception{
		boolean flag = false;
		flag = memberService.idCheck(id);
		return new ModelAndView("JsonView","flag",flag);
	}
	
	@RequestMapping("memberRegist.do")
	public ModelAndView regist(Member member) throws Exception{
		int result = memberService.regist(member);
		if(result==0) return new ModelAndView("Error");
		
		return new ModelAndView("redirect:login.jsp");
	}
}
