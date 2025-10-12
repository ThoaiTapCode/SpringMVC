package com.nhom2.multilang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nhom2.multilang.model.ProductTranslation;
import com.nhom2.multilang.repository.ProductTranslationRepository;
import com.nhom2.multilang.service.ProductTranslationService;

@Repository
public class ProductTranslationServiceImpl implements ProductTranslationService {
	
	@Autowired
	private ProductTranslationRepository productTranslationRepository;

	@Override
	public ProductTranslation getTranslation(int productId, String languageId) {
		return productTranslationRepository.getById(productId, languageId);
	}

	@Override
	public void addTranslation(ProductTranslation translation) {
		productTranslationRepository.add(translation);
	}

	@Override
	public void updateTranslation(ProductTranslation translation) {
		productTranslationRepository.update(translation);
	}

	@Override
	public void deleteTranslation(int productId, String languageId) {
		productTranslationRepository.delete(productId, languageId);
	}

}
