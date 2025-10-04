package com.nhom2.multilang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nhom2.multilang.model.Language;
import com.nhom2.multilang.service.LanguageService;

@Controller
@RequestMapping("/languages")
public class LanguageController {

    @Autowired
    private LanguageService languageService;

    @GetMapping
    public String listLanguages(Model model) {
        model.addAttribute("languages", languageService.getAllLanguages());
        return "languages/list";
    }

    @GetMapping("/new")
    public String newLanguageForm(Model model) {
        model.addAttribute("language", new Language());
        return "languages/form";
    }

    @PostMapping("/save")
    public String saveLanguage(@ModelAttribute Language language) {
        languageService.addLanguage(language);
        return "redirect:/languages";
    }

    @GetMapping("/edit")
    public String editLanguageForm(@RequestParam("id") String id, Model model) {
        Language lang = languageService.getLanguageById(id);
        model.addAttribute("language", lang);
        return "languages/form";
    }

    @PostMapping("/update")
    public String updateLanguage(@ModelAttribute Language language) {
        languageService.updateLanguage(language);
        return "redirect:/languages";
    }

    @GetMapping("/delete")
    public String deleteLanguage(@RequestParam("id") String id) {
        languageService.deleteLanguage(id);
        return "redirect:/languages";
    }

}
