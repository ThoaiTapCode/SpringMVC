package com.nhom2.multilang.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhom2.multilang.dto.ProductDTO;
import com.nhom2.multilang.model.Product;
import com.nhom2.multilang.model.ProductCategoryTranslation;
import com.nhom2.multilang.repository.ProductRepository;
import com.nhom2.multilang.service.ProductCategoryTranslationService;
import com.nhom2.multilang.service.ProductService;
import com.nhom2.multilang.service.ProductTranslationService;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductRepository productRepository;
	@Autowired
	private ProductCategoryTranslationService productCategoryService;
	@Autowired
	private ProductTranslationService productTranslationService;

	@Override
	public List<ProductDTO> getAllProducts(String languageId) {
		List<Product> products = productRepository.getAllProducts();
		return products.stream().map(p -> {
			ProductDTO dto = new ProductDTO();
			dto.setProductId(p.getProductId());
			dto.setPrice(p.getPrice());
			dto.setWeight(p.getWeight());
			
			ProductCategoryTranslation pc = 
					productCategoryService.getTranslation(p.getProductCategoryId(), languageId);
			
			dto.setProductCategoryName(pc != null ? pc.getCategoryName() : "N/A");
			var translation = productTranslationService.getTranslation(p.getProductId(), languageId);
			if (translation != null) {
				dto.setProductName(translation.getProductName());
				dto.setDescription(translation.getProductDescription());
			}
			return dto;
		}).toList();
	}

	@Override
	public Product getProductById(int id) {
		return productRepository.getProductById(id);
	}

	@Override
	public int addProduct(Product product) {
		return productRepository.addProduct(product);
	}

	@Override
	public void updateProduct(Product product) {
		productRepository.updateProduct(product);
	}

	@Override
	public void deleteProduct(int id) {
		productRepository.deleteProduct(id);
	}

	@Override
	public List<ProductDTO> getProductsByCategory(int categoryId, String languageId) {
		List<Product> products = productRepository.getAllProducts();
		return products.stream()
			.filter(p -> p.getProductCategoryId() == categoryId)
			.map(p -> {
				ProductDTO dto = new ProductDTO();
				dto.setProductId(p.getProductId());
				dto.setPrice(p.getPrice());
				dto.setWeight(p.getWeight());
				
				ProductCategoryTranslation pc = 
						productCategoryService.getTranslation(p.getProductCategoryId(), languageId);
				
				dto.setProductCategoryName(pc != null ? pc.getCategoryName() : "N/A");
				var translation = productTranslationService.getTranslation(p.getProductId(), languageId);
				if (translation != null) {
					dto.setProductName(translation.getProductName());
					dto.setDescription(translation.getProductDescription());
				}
				return dto;
			}).toList();
	}

	@Override
	public List<ProductDTO> searchProducts(String keyword, String languageId) {
		if (keyword == null || keyword.trim().isEmpty()) {
			return getAllProducts(languageId);
		}
		String k = keyword.trim().toLowerCase();
		List<Product> products = productRepository.getAllProducts();
		return products.stream()
			.filter(p -> {
				var tr = productTranslationService.getTranslation(p.getProductId(), languageId);
				if (tr == null) return false;
				String name = tr.getProductName() == null ? "" : tr.getProductName().toLowerCase();
				String desc = tr.getProductDescription() == null ? "" : tr.getProductDescription().toLowerCase();
				return name.contains(k) || desc.contains(k);
			})
			.map(p -> {
				ProductDTO dto = new ProductDTO();
				dto.setProductId(p.getProductId());
				dto.setPrice(p.getPrice());
				dto.setWeight(p.getWeight());

				ProductCategoryTranslation pc = 
					productCategoryService.getTranslation(p.getProductCategoryId(), languageId);

				dto.setProductCategoryName(pc != null ? pc.getCategoryName() : "N/A");
				var translation = productTranslationService.getTranslation(p.getProductId(), languageId);
				if (translation != null) {
					dto.setProductName(translation.getProductName());
					dto.setDescription(translation.getProductDescription());
				}
				return dto;
			}).toList();
	}
	
}
