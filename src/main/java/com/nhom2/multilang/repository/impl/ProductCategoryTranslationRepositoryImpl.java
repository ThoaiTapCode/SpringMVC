package com.nhom2.multilang.repository.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nhom2.multilang.repository.ProductCategoryTranslationRepository;
import com.nhom2.multilang.dao.ProductCategoryTranslationDAO;
import com.nhom2.multilang.model.ProductCategoryTranslation;

@Repository
public class ProductCategoryTranslationRepositoryImpl implements ProductCategoryTranslationRepository {
	@Autowired
	private ProductCategoryTranslationDAO productCategoryTranslationDAO;

	@Override
	public ProductCategoryTranslation getById(int productCategoryId, String languageId) {
		return productCategoryTranslationDAO.getProductCategoryByIdAndLanguage(productCategoryId, languageId);
	}

	@Override
	public void add(ProductCategoryTranslation pct) {
		productCategoryTranslationDAO.addProductCategoryTranslation(pct);
	}

	@Override
	public void update(ProductCategoryTranslation pct) {
		productCategoryTranslationDAO.updateProductCategoryTranslation(pct);
	}

	@Override
	public void delete(int productCategoryId, String languageId) {
		productCategoryTranslationDAO.deleteProductCategoryTranslation(productCategoryId, languageId);
	}

	@Override
	public List<ProductCategoryTranslation> getByProductCategoryId(int productCategoryId) {
		return productCategoryTranslationDAO.getProductCategoryTranslationsById(productCategoryId);
	}
}
