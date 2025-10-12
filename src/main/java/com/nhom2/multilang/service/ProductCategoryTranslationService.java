package com.nhom2.multilang.service;

import java.util.List;

import com.nhom2.multilang.model.ProductCategoryTranslation;

public interface ProductCategoryTranslationService {
	public ProductCategoryTranslation getTranslation(int categoryId, String languageId);
	public List<ProductCategoryTranslation> getAllCategories(String languageId);
	public List<ProductCategoryTranslation> getProductCategoryTranslationsById(int categoryId);
	public void addTranslation(ProductCategoryTranslation translation);
	public void updateTranslation(ProductCategoryTranslation translation);
	public void deleteTranslation(int categoryId, String languageId);
}
