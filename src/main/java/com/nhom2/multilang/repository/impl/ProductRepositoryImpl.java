package com.nhom2.multilang.repository.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nhom2.multilang.dao.ProductDAO;
import com.nhom2.multilang.model.Product;
import com.nhom2.multilang.repository.ProductRepository;

@Repository
public class ProductRepositoryImpl implements ProductRepository {
	
	@Autowired
	private ProductDAO productDAO;

	@Override
	public List<Product> getAllProducts() {
		return productDAO.getAllProducts();
	}

	@Override
	public Product getProductById(int id) {
		return productDAO.getProductById(id);
	}

	@Override
	public void addProduct(Product product) {
		productDAO.addProduct(product);
	}

	@Override
	public void updateProduct(Product product) {
		productDAO.updateProduct(product);
	}

	@Override
	public void deleteProduct(int id) {
		productDAO.deleteProduct(id);
	}
}
