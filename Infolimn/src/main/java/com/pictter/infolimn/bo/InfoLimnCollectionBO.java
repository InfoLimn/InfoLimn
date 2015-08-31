package com.pictter.infolimn.bo;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import org.codehaus.jackson.map.ObjectMapper;

import com.pictter.infolimn.beans.InfoLimnBean;
import com.pictter.infolimn.beans.InfoLimnCategoriesBean;
import com.pictter.infolimn.beans.InfoLimnCollectionBean;
import com.pictter.infolimn.dao.InfoLimnCategoriesDAO;
import com.pictter.infolimn.dao.InfoLimnsCollectionDAO;

public class InfoLimnCollectionBO {
	
	public String getInfolimnCollection(){
		
		String result = "";
		InfoLimnCategoriesDAO infoLimnCategoriesDAO = new InfoLimnCategoriesDAO();
		ArrayList<String> categoriesList = infoLimnCategoriesDAO.callInfolimnCollectionSerivces();
		InfoLimnCategoriesBean infoLimnCategoriesBean = new InfoLimnCategoriesBean();
		infoLimnCategoriesBean.setCategories(categoriesList);
		
		InfoLimnsCollectionDAO infoLimnsCollectionDAO = new InfoLimnsCollectionDAO();
		ArrayList<HashMap<String, String>> infolimnsList = infoLimnsCollectionDAO.callInfolimnCollectionSerivces();
		InfoLimnBean infoLimnBean = new InfoLimnBean();
		infoLimnBean.setInfoLimns(infolimnsList);

		
		InfoLimnCollectionBean infoLimnCollectionBean = new InfoLimnCollectionBean();
		infoLimnCollectionBean.setCategories(infoLimnCategoriesBean.getCategories());
		infoLimnCollectionBean.setInfolimns(infoLimnBean.getInfoLimns());
		
		try {
        	ObjectMapper mapper = new ObjectMapper();
        	result = mapper.writeValueAsString(infoLimnCollectionBean);
        } catch (IOException e) {
            e.printStackTrace();
        }
		
		return result;
	}
}
