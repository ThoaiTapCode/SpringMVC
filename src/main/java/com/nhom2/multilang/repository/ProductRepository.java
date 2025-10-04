package com.nhom2.multilang.repository;

import java.util.List;

import com.nhom2.multilang.model.Product;

public interface ProductRepository {
	public List<Product> getAllProducts();
	public Product getProductById(int id);
	public void addProduct(Product product);
	public void updateProduct(Product product);
	public void deleteProduct(int id);
}
