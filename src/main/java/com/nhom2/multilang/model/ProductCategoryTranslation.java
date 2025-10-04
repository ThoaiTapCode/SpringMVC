package com.nhom2.multilang.model;

public class ProductCategoryTranslation {
	private int productCategoryID;
	private String languageID;
	private String categoryName;
	
	public ProductCategoryTranslation() { }
	
	public ProductCategoryTranslation(int productCategoryID, String languageID, String categoryName) {
		this.productCategoryID = productCategoryID;
		this.languageID = languageID;
		this.categoryName = categoryName;
	}

	public int getProductCategoryID() {
		return productCategoryID;
	}

	public void setProductCategoryID(int productCategoryID) {
		this.productCategoryID = productCategoryID;
	}

	public String getLanguageID() {
		return languageID;
	}

	public void setLanguageID(String languageID) {
		this.languageID = languageID;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
}
