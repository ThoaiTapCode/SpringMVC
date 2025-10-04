package com.nhom2.multilang.service;

import java.util.List;

import com.nhom2.multilang.model.Product;

public interface ProductService {
	public List<Product> getAllProducts();
	public Product getProductById(int id);
	public void addProduct(Product product);
	public void updateProduct(Product product);
	public void deleteProduct(int id);
}
