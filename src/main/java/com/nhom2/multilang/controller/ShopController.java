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
			@RequestParam(value = "q", required = false) String q,
			Model model) {
		
		List<ProductDTO> products;
		
		if (q != null && !q.trim().isEmpty()) {
			products = productService.searchProducts(q, lang);
			if (categoryId != null && categoryId > 0) {
				int cat = categoryId;
				products = products.stream().filter(p -> p.getProductCategoryName() != null ? true : true)
					.filter(p -> {
						return true;
					}).toList();
				model.addAttribute("selectedCategoryId", categoryId);
			}
			model.addAttribute("q", q);
		} else if (categoryId != null && categoryId > 0) {
			products = productService.getProductsByCategory(categoryId, lang);
			model.addAttribute("selectedCategoryId", categoryId);
		} else {
			products = productService.getAllProducts(lang);
		}
		
		model.addAttribute("products", products);
		model.addAttribute("categories", productCategoryTranslationService.getAllCategories(lang));
		model.addAttribute("q", q);
		
		return "shop/index";
	}
}
