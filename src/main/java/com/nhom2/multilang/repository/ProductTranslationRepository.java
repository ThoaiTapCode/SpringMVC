package com.nhom2.multilang.repository;

import java.util.List;

import com.nhom2.multilang.model.ProductTranslation;

public interface ProductTranslationRepository {
	public ProductTranslation getById(int product, String languageId);
	public List<ProductTranslation> getProductTranslationsById(int productId);
	public void add(ProductTranslation pt);
	public void update(ProductTranslation pt);
	public void delete(int productId, String languageId);
}
