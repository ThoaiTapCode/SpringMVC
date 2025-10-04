package com.nhom2.multilang.repository.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nhom2.multilang.dao.ProductCategoryDAO;
import com.nhom2.multilang.model.ProductCategory;
import com.nhom2.multilang.repository.ProductCategoryRepository;

@Repository
public class ProductCategoryRepositoryImpl implements ProductCategoryRepository {
	
	@Autowired
	private ProductCategoryDAO productCategoryDAO;

	@Override
	public List<ProductCategory> getAllProductCategories() {
		return productCategoryDAO.getAllProductCategories();
	}

	@Override
	public ProductCategory getProductCategoryById(int id) {
		return productCategoryDAO.getProductCategoryById(id);
	}

	@Override
	public int addProductCategory(ProductCategory category) {
		return productCategoryDAO.addProductCategory(category);
	}

	@Override
	public void updateProductCategory(ProductCategory category) {
		productCategoryDAO.updateProductCategory(category);
	}

	@Override
	public void deleteProductCategory(int id) {
		productCategoryDAO.deleteProductCategory(id);
	}

}
