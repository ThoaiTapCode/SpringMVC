package com.nhom2.multilang.service;

import com.nhom2.multilang.model.ProductTranslation;

public interface ProductTranslationService {
	public ProductTranslation getTranslation(int productId, String languageId);
	public void addTranslation(ProductTranslation translation);
	public void updateTranslation(ProductTranslation translation);
	public void deleteTranslation(int productId, String languageId);
}
