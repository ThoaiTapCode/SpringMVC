package com.nhom2.multilang.repository;

import com.nhom2.multilang.model.ProductTranslation;

public interface ProductTranslationRepository {
	public ProductTranslation getById(int product, String languageId);
	public void add(ProductTranslation pt);
	public void update(ProductTranslation pt);
	public void delete(int productId, String languageId);
}
