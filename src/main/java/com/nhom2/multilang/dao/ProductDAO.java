package com.nhom2.multilang.dao;

import java.util.List;

import com.nhom2.multilang.model.Product;

public interface ProductDAO {
	List<Product> getAllProducts();
	Product getProductById(int productId);
	int addProduct(Product product);
	void updateProduct(Product product);
	void deleteProduct(int productId);
}
