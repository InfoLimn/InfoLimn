package com.pictter.infolimn.beans;

import java.util.ArrayList;
import java.util.HashMap;

public class InfoLimnCollectionBean {

	ArrayList<String> categories;
	ArrayList<HashMap<String, String>> infolimns;

	/**
	 * @return the infolimns
	 */
	public ArrayList<HashMap<String, String>> getInfolimns() {
		return infolimns;
	}

	/**
	 * @param infolimns the infolimns to set
	 */
	public void setInfolimns(ArrayList<HashMap<String, String>> infolimns) {
		this.infolimns = infolimns;
	}

	/**
	 * @return the categories
	 */
	public ArrayList<String> getCategories() {
		return categories;
	}

	/**
	 * @param categories
	 *            the categories to set
	 */
	public void setCategories(ArrayList<String> categories) {
		this.categories = categories;
	}


}