package com.pictter.infolimn.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.pictter.infolimn.service.CategoryService;
import com.pictter.infolimn.service.InfoLimnService;

public class InfoLimnCategoriesDAO {
	public ArrayList<String> callInfolimnCollectionSerivces() {

		ArrayList<String> categoriesList;
		CategoryService categoryService = new CategoryService();
		categoriesList = categoryService.callService();

		return categoriesList;
	}
}
