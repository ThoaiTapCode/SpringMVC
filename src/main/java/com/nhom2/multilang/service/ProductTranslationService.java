package com.nhom2.multilang.service;

import java.util.List;

import com.nhom2.multilang.model.ProductTranslation;

public interface ProductTranslationService {
	public ProductTranslation getTranslation(int productId, String languageId);
	public List<ProductTranslation> getProductTranslationsById(int productId);
	public void addTranslation(ProductTranslation translation);
	public void updateTranslation(ProductTranslation translation);
	public void deleteTranslation(int productId, String languageId);
}
