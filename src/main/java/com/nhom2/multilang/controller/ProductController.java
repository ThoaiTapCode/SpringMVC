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
	public String createForm(@RequestParam(value = "lang", defaultValue = "vi") String lang, Model model) {
		model.addAttribute("product", new Product());
		// Lấy danh mục bằng tiếng Việt để người dùng dễ chọn
		model.addAttribute("categories", productCategoryTranslationService.getAllCategories("vi"));
		return "products/form-add";
	}

	@PostMapping("/save")
	public String save(@RequestParam("lang") String lang, @ModelAttribute CreateProductDTO product,
			org.springframework.web.servlet.mvc.support.RedirectAttributes redirectAttributes) {
		// Mặc định luôn dùng ngôn ngữ "vi" khi thêm mới
		int id = productService
				.addProduct(new Product(product.getPrice(), product.getWeight(), product.getProductCategoryId()));
		productTranslationService.addTranslation(
				new ProductTranslation(id, "vi", product.getProductName(), product.getProductDescription()));
		
		redirectAttributes.addFlashAttribute("success", 
			"Tạo sản phẩm thành công! Vào 'Quản lý nghĩa' để thêm các ngôn ngữ khác.");
		return "redirect:/products?lang=vi";
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
	public String addMeaning(@ModelAttribute ProductTranslation translation, Model model) {
		// Kiểm tra xem nghĩa đã tồn tại chưa
		ProductTranslation existingTranslation = productTranslationService
				.getTranslation(translation.getProductId(), translation.getLanguageID());
		
		if (existingTranslation != null) {
			// Nghĩa đã tồn tại, hiển thị thông báo lỗi
			model.addAttribute("meanings", productTranslationService.getProductTranslationsById(translation.getProductId()));
			model.addAttribute("languages", languageService.getAllLanguages());
			model.addAttribute("productId", translation.getProductId());
			model.addAttribute("error", "Nghĩa cho ngôn ngữ này đã tồn tại! Vui lòng sử dụng chức năng 'Lưu' để cập nhật nghĩa hiện có.");
			model.addAttribute("duplicateLanguage", translation.getLanguageID());
			return "products/meanings";
		}
		
		productTranslationService.addTranslation(translation);
		return "redirect:/products/meanings/list?id=" + translation.getProductId();
	}

	@PostMapping("/meanings/update")
	public String updateMeaning(@ModelAttribute ProductTranslation translation,
			org.springframework.web.servlet.mvc.support.RedirectAttributes redirectAttributes) {
		productTranslationService.updateTranslation(translation);
		redirectAttributes.addFlashAttribute("success", "Cập nhật nghĩa thành công!");
		return "redirect:/products/meanings/list?id=" + translation.getProductId();
	}

	@GetMapping("/meanings/delete")
	public String deleteMeaning(@RequestParam("productId") int productId, @RequestParam("languageId") String languageId,
			org.springframework.web.servlet.mvc.support.RedirectAttributes redirectAttributes) {
		productTranslationService.deleteTranslation(productId, languageId);
		redirectAttributes.addFlashAttribute("success", "Xóa nghĩa thành công!");
		return "redirect:/products/meanings/list?id=" + productId;
	}

}
