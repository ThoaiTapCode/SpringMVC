package com.nhom2.multilang.service;

import java.util.List;

import com.nhom2.multilang.model.ProductCategory;

public interface ProductCategoryService {
	public List<ProductCategory> getAllProductCategories();
	public ProductCategory getProductCategoryById(int id);
	public int addProductCategory(ProductCategory productCategory);
	public void updateProductCategory(ProductCategory productCategory);
	public void deleteProductCategory(int id);
}
