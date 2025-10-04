package com.nhom2.multilang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nhom2.multilang.model.Product;
import com.nhom2.multilang.service.ProductCategoryService;
import com.nhom2.multilang.service.ProductService;

@Controller
@RequestMapping("/products")
public class ProductController {

    @Autowired
    private ProductService productService;
    @Autowired
    private ProductCategoryService productCategoryService;

    @GetMapping
    public String list(Model model) {
        model.addAttribute("products", productService.getAllProducts());
        return "products/list";
    }

    @GetMapping("/new")
    public String createForm(Model model) {
        model.addAttribute("product", new Product());
        model.addAttribute("categories", productCategoryService.getAllProductCategories());
        return "products/form";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute Product product) {
        productService.addProduct(product);
        return "redirect:/products";
    }

    @GetMapping("/edit")
    public String edit(@RequestParam("id") int id, Model model) {
        model.addAttribute("product", productService.getProductById(id));
        model.addAttribute("categories", productCategoryService.getAllProductCategories());
        return "products/form";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute Product product) {
        productService.updateProduct(product);
        return "redirect:/products";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") int id) {
        productService.deleteProduct(id);
        return "redirect:/products";
    }

}
