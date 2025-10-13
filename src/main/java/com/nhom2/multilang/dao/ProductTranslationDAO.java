package com.nhom2.multilang.dao;

import java.util.List;

import com.nhom2.multilang.model.ProductTranslation;

public interface ProductTranslationDAO {
	ProductTranslation getProductTranslationByIdAndLang(int productId, String languageId);
	void addProductTranslation(ProductTranslation pt);
	void updateProductTranslation(ProductTranslation pt);
	void deleteProductTranslation(int productId, String languageId);
	List<ProductTranslation> getProductTranslationsById(int productId);
}
