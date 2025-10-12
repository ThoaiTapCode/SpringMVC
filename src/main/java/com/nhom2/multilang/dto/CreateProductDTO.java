package com.nhom2.multilang.dto;

public class CreateProductDTO {
	private float price;
	private double weight;
	private String productDescription;
	private String productName;
	private int productCategoryId;

	public CreateProductDTO() {
	}

	public CreateProductDTO(float price, double weight, String productDescription, String productName,
			int productCategoryId) {
		this.price = price;
		this.weight = weight;
		this.productDescription = productDescription;
		this.productName = productName;
		this.productCategoryId = productCategoryId;
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

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductCategoryId() {
		return productCategoryId;
	}

	public void setProductCategoryId(int productCategoryId) {
		this.productCategoryId = productCategoryId;
	}
}
