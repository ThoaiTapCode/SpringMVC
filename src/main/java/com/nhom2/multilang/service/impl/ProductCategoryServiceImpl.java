package com.nhom2.multilang.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhom2.multilang.model.ProductCategory;
import com.nhom2.multilang.repository.ProductCategoryRepository;
import com.nhom2.multilang.service.ProductCategoryService;

@Service
public class ProductCategoryServiceImpl implements ProductCategoryService {
	
	@Autowired
	private ProductCategoryRepository productCategoryRepository;

	@Override
	public List<ProductCategory> getAllProductCategories() {
		return productCategoryRepository.getAllProductCategories();
	}

	@Override
	public ProductCategory getProductCategoryById(int id) {
		return productCategoryRepository.getProductCategoryById(id);
	}

	@Override
	public int addProductCategory(ProductCategory productCategory) {
		return productCategoryRepository.addProductCategory(productCategory);
	}

	@Override
	public void updateProductCategory(ProductCategory productCategory) {
		productCategoryRepository.updateProductCategory(productCategory);
	}

	@Override
	public void deleteProductCategory(int id) {
		productCategoryRepository.deleteProductCategory(id);
	}

}
