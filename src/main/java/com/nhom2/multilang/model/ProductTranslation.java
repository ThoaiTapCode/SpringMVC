package com.nhom2.multilang.model;

public class ProductTranslation {
	private int productId;
	private String languageID;
	private String productName;
	private String productDescription;
	
	public ProductTranslation() { }
	
	public ProductTranslation(int productId, String languageID, String productName, String productDescription) {
		this.productId = productId;
		this.languageID = languageID;
		this.productName = productName;
		this.productDescription = productDescription;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getLanguageID() {
		return languageID;
	}

	public void setLanguageID(String languageID) {
		this.languageID = languageID;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
}
