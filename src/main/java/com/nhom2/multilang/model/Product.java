package com.nhom2.multilang.model;

public class Product {
	private int productId;
	private float price;
	private double weight;
	private int productCategoryId;
	
	public Product() {	}
	
	public Product(float price, double weight, int productCategoryId) {
		this.price = price;
		this.weight = weight;
		this.productCategoryId = productCategoryId;
	}

	public Product(int productId, float price, double weight, int productCategoryId) {
		this.productId = productId;
		this.price = price;
		this.weight = weight;
		this.productCategoryId = productCategoryId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
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

	public int getProductCategoryId() {
		return productCategoryId;
	}

	public void setProductCategoryId(int productCategoryId) {
		this.productCategoryId = productCategoryId;
	}

}
