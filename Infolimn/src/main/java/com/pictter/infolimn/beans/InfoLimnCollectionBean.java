package com.pictter.infolimn.beans;

public class InfoLimnCollectionBean {
	
	String categories[];
	InfoLimnBean infolimns[];
	
	/**
	 * @return the categories
	 */
	public String[] getCategories() {
		return categories;
	}
	/**
	 * @param categories the categories to set
	 */
	public void setCategories(String[] categories) {
		this.categories = categories;
	}
	/**
	 * @return the infolimns
	 */
	public InfoLimnBean[] getInfolimns() {
		return infolimns;
	}
	/**
	 * @param infolimns the infolimns to set
	 */
	public void setInfolimns(InfoLimnBean[] infolimns) {
		this.infolimns = infolimns;
	}
	
}