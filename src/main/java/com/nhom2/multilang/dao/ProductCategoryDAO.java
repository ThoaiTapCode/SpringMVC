package com.nhom2.multilang.dao;

import java.util.List;

import com.nhom2.multilang.model.ProductCategory;

public interface ProductCategoryDAO {
	List<ProductCategory> getAllProductCategories();
	ProductCategory getProductCategoryById(int id);
	int addProductCategory(ProductCategory category);
	void updateProductCategory(ProductCategory category);
	void deleteProductCategory(int id);
}
