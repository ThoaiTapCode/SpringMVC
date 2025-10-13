package com.nhom2.multilang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nhom2.multilang.dto.CreateProductDTO;
import com.nhom2.multilang.model.*;
import com.nhom2.multilang.service.*;

@Controller
@RequestMapping("/products")
public class ProductController {

	@Autowired
	private ProductService productService;
	@Autowired
	private ProductTranslationService productTranslationService;
	@Autowired
	private ProductCategoryTranslationService productCategoryTranslationService;
	@Autowired
	private LanguageService languageService;

	@GetMapping
	public String list(@RequestParam("lang") String lang, Model model) {
		model.addAttribute("products", productService.getAllProducts(lang));
		return "products/list";
	}

	@GetMapping("/new")
	public String createForm(@RequestParam("lang") String lang, Model model) {
		model.addAttribute("product", new Product());
		model.addAttribute("categories", productCategoryTranslationService.getAllCategories(lang));
		return "products/form-add";
	}

	@PostMapping("/save")
	public String save(@RequestParam("lang") String lang, @ModelAttribute CreateProductDTO product) {
		int id = productService
				.addProduct(new Product(product.getPrice(), product.getWeight(), product.getProductCategoryId()));
		productTranslationService.addTranslation(
				new ProductTranslation(id, lang, product.getProductName(), product.getProductDescription()));
		return "redirect:/products";
	}

	@GetMapping("/delete")
	public String delete(@RequestParam("id") int id) {
		productService.deleteProduct(id);
		return "redirect:/products";
	}

	@GetMapping("/meanings/list")
	public String listMeanings(@RequestParam("id") int id, Model model) {
		model.addAttribute("meanings", productTranslationService.getProductTranslationsById(id));
		model.addAttribute("languages", languageService.getAllLanguages());
		model.addAttribute("productId", id);
		return "products/meanings";
	}

	@PostMapping("/meanings/new")
	public String addMeaning(@ModelAttribute ProductTranslation translation) {
		productTranslationService.addTranslation(translation);
		return "redirect:/products/meanings/list?id=" + translation.getProductId();
	}

	@PostMapping("/meanings/update")
	public String updateMeaning(@ModelAttribute ProductTranslation translation) {
		productTranslationService.updateTranslation(translation);
		return "redirect:/products/meanings/list?id=" + translation.getProductId();
	}

	@GetMapping("/meanings/delete")
	public String deleteMeaning(@RequestParam("productId") int productId, @RequestParam("languageId") String languageId) {
		productTranslationService.deleteTranslation(productId, languageId);
		return "redirect:/products/meanings/list?id=" + productId;
	}

}
