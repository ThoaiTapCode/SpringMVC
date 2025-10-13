package com.nhom2.multilang.dao;

import java.util.List;

import com.nhom2.multilang.model.ProductCategoryTranslation;

public interface ProductCategoryTranslationDAO {
	ProductCategoryTranslation getProductCategoryByIdAndLanguage(int id, String languageID);

	List<ProductCategoryTranslation> getProductCategoryTranslationsById(int id);

	void addProductCategoryTranslation(ProductCategoryTranslation pct);

	void updateProductCategoryTranslation(ProductCategoryTranslation pct);

	void deleteProductCategoryTranslation(int id, String languageID);
}
