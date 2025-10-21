package com.nhom2.multilang.service;

import java.util.List;

import com.nhom2.multilang.dto.ProductDTO;
import com.nhom2.multilang.model.Product;

public interface ProductService {
	public List<ProductDTO> getAllProducts(String languageId);
	public List<ProductDTO> getProductsByCategory(int categoryId, String languageId);
	public Product getProductById(int id);
	public int addProduct(Product product);
	public void updateProduct(Product product);
	public void deleteProduct(int id);
}
