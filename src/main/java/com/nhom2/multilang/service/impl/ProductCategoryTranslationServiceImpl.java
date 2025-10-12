package com.nhom2.multilang.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhom2.multilang.model.ProductCategory;
import com.nhom2.multilang.model.ProductCategoryTranslation;
import com.nhom2.multilang.repository.ProductCategoryRepository;
import com.nhom2.multilang.repository.ProductCategoryTranslationRepository;
import com.nhom2.multilang.service.ProductCategoryTranslationService;

@Service
public class ProductCategoryTranslationServiceImpl implements ProductCategoryTranslationService {
	@Autowired
	private ProductCategoryTranslationRepository productCategoryTranslationRepository;
	@Autowired
	private ProductCategoryRepository productCategoryRepository;

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

	@Override
	public List<ProductCategoryTranslation> getProductCategoryTranslationsById(int categoryId) {
		return productCategoryTranslationRepository.getByProductCategoryId(categoryId);
	}

	@Override
	public List<ProductCategoryTranslation> getAllCategories(String languageId) {
		List<ProductCategory> categories = productCategoryRepository.getAllProductCategories();
		List<ProductCategoryTranslation> rs = categories.stream()
				.map(c -> {
					ProductCategoryTranslation t = productCategoryTranslationRepository.getById(c.getProductCategoryId(), languageId);
					if (t == null) {
						t = productCategoryTranslationRepository.getById(c.getProductCategoryId(), "vi");
					}
					return t;
				})
				.filter(t -> t != null)
				.toList();
		
		return rs;
	}
	
}
