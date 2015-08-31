package com.pictter.infolimn.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.pictter.infolimn.service.InfoLimnService;

public class InfoLimnsCollectionDAO {
	public ArrayList<HashMap<String, String>> callInfolimnCollectionSerivces() {

		ArrayList<HashMap<String, String>> infoLimnsList;
		InfoLimnService infoLimnService = new InfoLimnService();
		infoLimnsList = infoLimnService.callService();

		return infoLimnsList;
	}
}
