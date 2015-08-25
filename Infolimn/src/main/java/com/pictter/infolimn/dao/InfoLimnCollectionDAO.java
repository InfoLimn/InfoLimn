package com.pictter.infolimn.dao;

import com.pictter.infolimn.service.CategoryService;
import com.pictter.infolimn.service.InfoLimnService;

public class InfoLimnCollectionDAO {
	public String callInfolimnCollectionSerivce(){
		
		String resultSet = "";
		InfoLimnService infoLimnService = new InfoLimnService();
		resultSet = infoLimnService.callService();
		
		CategoryService categoryService = new CategoryService();
		resultSet = categoryService.callService();

		return resultSet;
	}
}
