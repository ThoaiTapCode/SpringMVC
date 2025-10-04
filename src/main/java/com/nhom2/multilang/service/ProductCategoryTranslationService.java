package com.nhom2.multilang.service;

import com.nhom2.multilang.model.ProductCategoryTranslation;

public interface ProductCategoryTranslationService {
	public ProductCategoryTranslation getTranslation(int categoryId, String languageId);
	public void addTranslation(ProductCategoryTranslation translation);
	public void updateTranslation(ProductCategoryTranslation translation);
	public void deleteTranslation(int categoryId, String languageId);
}
