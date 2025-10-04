package com.nhom2.multilang.model;

public class ProductCategory {
	private int productCategoryId;
	private boolean canBeShipped;
	
	public ProductCategory() { }
	
	public ProductCategory(boolean canBeShipped) {
		this.canBeShipped = canBeShipped;
	}
	
	public ProductCategory(int productCategoryId, boolean canBeShipped) {
		this.productCategoryId = productCategoryId;
		this.canBeShipped = canBeShipped;
	}

	public int getProductCategoryId() {
		return productCategoryId;
	}

	public void setProductCategoryId(int productCategoryId) {
		this.productCategoryId = productCategoryId;
	}

	public boolean isCanBeShipped() {
		return canBeShipped;
	}

	public void setCanBeShipped(boolean canBeShipped) {
		this.canBeShipped = canBeShipped;
	}
}
