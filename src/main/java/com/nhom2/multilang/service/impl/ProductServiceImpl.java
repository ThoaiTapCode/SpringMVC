package com.nhom2.multilang.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhom2.multilang.model.Product;
import com.nhom2.multilang.repository.ProductRepository;
import com.nhom2.multilang.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductRepository productRepository;

	@Override
	public List<Product> getAllProducts() {
		return productRepository.getAllProducts();
	}

	@Override
	public Product getProductById(int id) {
		return productRepository.getProductById(id);
	}

	@Override
	public void addProduct(Product product) {
		productRepository.addProduct(product);
	}

	@Override
	public void updateProduct(Product product) {
		productRepository.updateProduct(product);
	}

	@Override
	public void deleteProduct(int id) {
		productRepository.deleteProduct(id);
	}
	
}
