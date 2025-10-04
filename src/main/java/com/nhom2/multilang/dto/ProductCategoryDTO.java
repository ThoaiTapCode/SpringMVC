package com.nhom2.multilang.dto;

public class ProductCategoryDTO {
	private int productCategoryId;
	private String languageId;
	private String categoryName;
	private boolean canBeShipped;
	
	public ProductCategoryDTO() { }
	
	public ProductCategoryDTO(int productCategoryId, String languageId, String categoryName, boolean canBeShipped) {
		this.productCategoryId = productCategoryId;
		this.languageId = languageId;
		this.categoryName = categoryName;
		this.canBeShipped = canBeShipped;
	}

	public int getProductCategoryId() {
		return productCategoryId;
	}

	public void setProductCategoryId(int productCategoryId) {
		this.productCategoryId = productCategoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public boolean isCanBeShipped() {
		return canBeShipped;
	}

	public void setCanBeShipped(boolean canBeShipped) {
		this.canBeShipped = canBeShipped;
	}

	public String getLanguageId() {
		return languageId;
	}

	public void setLanguageId(String languageId) {
		this.languageId = languageId;
	}
}
