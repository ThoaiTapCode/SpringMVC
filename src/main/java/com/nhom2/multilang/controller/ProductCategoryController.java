package com.nhom2.multilang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nhom2.multilang.dto.ProductCategoryDTO;
import com.nhom2.multilang.model.ProductCategory;
import com.nhom2.multilang.model.ProductCategoryTranslation;
import com.nhom2.multilang.service.LanguageService;
import com.nhom2.multilang.service.ProductCategoryService;
import com.nhom2.multilang.service.ProductCategoryTranslationService;

@Controller
@RequestMapping("/categories")
public class ProductCategoryController {

	@Autowired
	private ProductCategoryService productCategoryService;
	@Autowired
	private LanguageService languageService;
	@Autowired
	private ProductCategoryTranslationService productCategoryTranslationService;

	@GetMapping
	public String list(@RequestParam("lang") String lang, Model model) {
		List<ProductCategory> categories = productCategoryService.getAllProductCategories();
		List<ProductCategoryDTO> categoryDTOs = categories.stream().map(category -> {
			ProductCategoryTranslation translation = productCategoryTranslationService
					.getTranslation(category.getProductCategoryId(), lang);
			String categoryName = translation != null ? translation.getCategoryName() : "N/A";
			return new ProductCategoryDTO(category.getProductCategoryId(), lang, categoryName,
					category.isCanBeShipped());
		}).toList();

		model.addAttribute("categories", categoryDTOs);
		return "categories/list";
	}

	@GetMapping("/new")
	public String createForm(Model model) {
		model.addAttribute("category", new ProductCategoryDTO());
		model.addAttribute("languages", languageService.getAllLanguages());
		return "categories/form";
	}

	@PostMapping("/save")
	public String save(@ModelAttribute ProductCategoryDTO category) {
		int id = productCategoryService.addProductCategory(new ProductCategory(category.isCanBeShipped()));
		productCategoryTranslationService.addTranslation(
				new ProductCategoryTranslation(id, category.getLanguageId(), category.getCategoryName()));
		return "redirect:/categories";
	}

	@GetMapping("/edit")
	public String edit(@RequestParam("lang") String lang, @RequestParam("id") int id, Model model) {
		ProductCategory category = productCategoryService.getProductCategoryById(id);
		if (category == null) {
			return "redirect:/categories";
		}
		ProductCategoryTranslation translation = productCategoryTranslationService.getTranslation(id, lang);

		ProductCategoryDTO categoryDTO = new ProductCategoryDTO(category.getProductCategoryId(), lang,
				translation != null ? translation.getCategoryName() : "N/A", category.isCanBeShipped());

		model.addAttribute("category", categoryDTO);
		model.addAttribute("languages", languageService.getAllLanguages());
		return "categories/form";
	}

	@PostMapping("/update")
	public String update(@ModelAttribute ProductCategoryDTO category) {
		productCategoryService.updateProductCategory(new ProductCategory(category.getProductCategoryId(),
				category.isCanBeShipped()));
		productCategoryTranslationService.updateTranslation(new ProductCategoryTranslation(category.getProductCategoryId(),
				category.getLanguageId(), category.getCategoryName()));
		return "redirect:/categories";
	}

	@GetMapping("/delete")
	public String delete(@RequestParam("id") int id) {
		productCategoryService.deleteProductCategory(id);
		return "redirect:/categories";
	}

	@GetMapping("/meanings/list")
	public String listMeanings(@RequestParam("id") int id, Model model) {
		model.addAttribute("meanings", productCategoryTranslationService.getProductCategoryTranslationsById(id));
		model.addAttribute("languages", languageService.getAllLanguages());
		model.addAttribute("categoryId", id);
		return "categories/meanings";
	}

	@PostMapping("/meanings/new")
	public String addMeaning(@ModelAttribute ProductCategoryTranslation translation) {
		productCategoryTranslationService.addTranslation(translation);
		return "redirect:/categories/meanings/list?id=" + translation.getProductCategoryID();
	}

	@PostMapping("/meanings/update")
	public String updateMeaning(@ModelAttribute ProductCategoryTranslation translation) {
		productCategoryTranslationService.updateTranslation(translation);
		return "redirect:/categories/meanings/list?id=" + translation.getProductCategoryID();
	}

	@GetMapping("/meanings/delete")
	public String deleteMeaning(@RequestParam("categoryId") int categoryId, @RequestParam("languageId") String languageId) {
		productCategoryTranslationService.deleteTranslation(categoryId, languageId);
		return "redirect:/categories/meanings/list?id=" + categoryId;
	}

}
