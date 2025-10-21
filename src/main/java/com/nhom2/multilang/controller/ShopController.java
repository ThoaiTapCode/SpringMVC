package com.nhom2.multilang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nhom2.multilang.dto.ProductDTO;
import com.nhom2.multilang.service.ProductCategoryTranslationService;
import com.nhom2.multilang.service.ProductService;

@Controller
@RequestMapping("/shop")
public class ShopController {

	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductCategoryTranslationService productCategoryTranslationService;

	@GetMapping
	public String shop(@RequestParam(value = "lang", defaultValue = "vi") String lang,
			@RequestParam(value = "categoryId", required = false) Integer categoryId,
			Model model) {
		
		List<ProductDTO> products;
		
		if (categoryId != null && categoryId > 0) {
			// Filter by category
			products = productService.getProductsByCategory(categoryId, lang);
			model.addAttribute("selectedCategoryId", categoryId);
		} else {
			// All products
			products = productService.getAllProducts(lang);
		}
		
		model.addAttribute("products", products);
		model.addAttribute("categories", productCategoryTranslationService.getAllCategories(lang));
		
		return "shop/index";
	}
}
