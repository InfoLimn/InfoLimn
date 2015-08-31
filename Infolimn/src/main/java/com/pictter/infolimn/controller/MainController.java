package com.pictter.infolimn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.pictter.infolimn.bo.InfoLimnCollectionBO;

@Controller
public class MainController {

	@RequestMapping("/home.do")
	public ModelAndView showMessage(
			@RequestParam(value = "name", required = false, defaultValue = "World") String name) {

		System.out.println("In MainController");

		InfoLimnCollectionBO infoLimnCollectionBO = new InfoLimnCollectionBO();
		String result = infoLimnCollectionBO.getInfolimnCollection();

		ModelAndView mv = new ModelAndView("home");
		mv.addObject("infolimnJSON", result);
		return mv;
	}
	
	@RequestMapping(value="/getInfoLimns.do", method = RequestMethod.GET)
	public @ResponseBody String getInfoLimnCollectionBOInJSON() {

		InfoLimnCollectionBO infoLimnCollectionBO = new InfoLimnCollectionBO();
		String result = infoLimnCollectionBO.getInfolimnCollection();
		
		return result;

	}
}