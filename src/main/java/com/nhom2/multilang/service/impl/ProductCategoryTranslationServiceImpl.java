package com.nhom2.multilang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhom2.multilang.model.ProductCategoryTranslation;
import com.nhom2.multilang.repository.ProductCategoryTranslationRepository;
import com.nhom2.multilang.service.ProductCategoryTranslationService;

@Service
public class ProductCategoryTranslationServiceImpl implements ProductCategoryTranslationService {
	@Autowired
	private ProductCategoryTranslationRepository productCategoryTranslationRepository;

	@Override
	public ProductCategoryTranslation getTranslation(int categoryId, String languageId) {
		return productCategoryTranslationRepository.getById(categoryId, languageId);
	}

	@Override
	public void addTranslation(ProductCategoryTranslation translation) {
		productCategoryTranslationRepository.add(translation);
	}

	@Override
	public void updateTranslation(ProductCategoryTranslation translation) {
		productCategoryTranslationRepository.update(translation);
	}

	@Override
	public void deleteTranslation(int categoryId, String languageId) {
		productCategoryTranslationRepository.delete(categoryId, languageId);
	}
	
}
