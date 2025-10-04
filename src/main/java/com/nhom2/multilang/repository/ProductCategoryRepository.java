package com.nhom2.multilang.repository;

import java.util.List;

import com.nhom2.multilang.model.ProductCategory;

public interface ProductCategoryRepository {
	public List<ProductCategory> getAllProductCategories();
	public ProductCategory getProductCategoryById(int id);
	public int addProductCategory(ProductCategory category);
	public void updateProductCategory(ProductCategory category);
	public void deleteProductCategory(int id);
}
