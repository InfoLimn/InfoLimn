package com.pictter.infolimn.bo;

import java.io.IOException;

import org.codehaus.jackson.map.ObjectMapper;

import com.pictter.infolimn.beans.InfoLimnBean;
import com.pictter.infolimn.beans.InfoLimnCategoriesBean;
import com.pictter.infolimn.beans.InfoLimnCollectionBean;
import com.pictter.infolimn.dao.InfoLimnCollectionDAO;

public class InfoLimnCollectionBO {
	
	public String getInfolimnCollection(){
		
		String result = "";
		InfoLimnCollectionDAO infoLimnCollectionDAO = new InfoLimnCollectionDAO();
		String resultSet = infoLimnCollectionDAO.callInfolimnCollectionSerivce();

		InfoLimnBean infoLimnBean = new InfoLimnBean();
		infoLimnBean.setTitle("pictter");
		infoLimnBean.setDescription("Company Name");
		infoLimnBean.setInfoLimnId("info_12345");
		infoLimnBean.setCategory("Politics");
		infoLimnBean.setUrl("resources/images/pictterSample.png");
		infoLimnBean.setUpLoadedTimeStamp("12345");

		String[] cat = { "Politics", "Cinema", "Science", "Others" };
		InfoLimnCategoriesBean infoLimnCategoriesBean = new InfoLimnCategoriesBean();
		infoLimnCategoriesBean.setCategories(cat);
		
		InfoLimnBean[] infoLimnBeanArray = {infoLimnBean, infoLimnBean}; 
		InfoLimnCollectionBean infoLimnCollectionBean = new InfoLimnCollectionBean();
		infoLimnCollectionBean.setCategories(infoLimnCategoriesBean.getCategories());
		infoLimnCollectionBean.setInfolimns(infoLimnBeanArray);
		
		try {
        	ObjectMapper mapper = new ObjectMapper();
        	result = mapper.writeValueAsString(infoLimnCollectionBean);
        } catch (IOException e) {
            e.printStackTrace();
        }
		
		return result;
	}
}
