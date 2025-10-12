package com.nhom2.multilang.repository.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nhom2.multilang.dao.ProductTranslationDAO;
import com.nhom2.multilang.model.ProductTranslation;
import com.nhom2.multilang.repository.ProductTranslationRepository;

@Repository
public class ProductTranslationRepositoryImpl implements ProductTranslationRepository {
	
	@Autowired
	private ProductTranslationDAO productTranslationDAO;

	@Override
	public ProductTranslation getById(int product, String languageId) {
		return productTranslationDAO.getProductTranslationByIdAndLang(product, languageId);
	}

	@Override
	public void add(ProductTranslation pt) {
		productTranslationDAO.addProductTranslation(pt);
	}

	@Override
	public void update(ProductTranslation pt) {
		productTranslationDAO.updateProductTranslation(pt);
	}

	@Override
	public void delete(int productId, String languageId) {
		productTranslationDAO.deleteProductTranslation(productId, languageId);
	}

}
