package com.nhom2.multilang.dto;

public class ProductDTO {
	private int productId;
	private String productName;
	private float price;
	private double weight;
	private String description;
	private String productCategoryName;
	private int productCategoryId;
	
	public ProductDTO() { }
	
	public ProductDTO(int productId, String productName, float price, double weight, String description, String productCategoryName) {
		this.productId = productId;
		this.productName = productName;
		this.price = price;
		this.weight = weight;
		this.description = description;
		this.productCategoryName = productCategoryName;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getProductCategoryName() {
		return productCategoryName;
	}

	public void setProductCategoryName(String productCategoryName) {
		this.productCategoryName = productCategoryName;
	}

	public int getProductCategoryId() {
		return productCategoryId;
	}

	public void setProductCategoryId(int productCategoryId) {
		this.productCategoryId = productCategoryId;
	}
}
