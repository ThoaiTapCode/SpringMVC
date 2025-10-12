package com.nhom2.multilang.repository;

import java.util.List;

import com.nhom2.multilang.model.ProductCategoryTranslation;

public interface ProductCategoryTranslationRepository {
	public ProductCategoryTranslation getById(int productCategoryId, String languageId);
	public List<ProductCategoryTranslation> getByProductCategoryId(int productCategoryId);
	public void add(ProductCategoryTranslation pct);
	public void update(ProductCategoryTranslation pct);
	public void delete(int productCategoryId, String languageId);
}
