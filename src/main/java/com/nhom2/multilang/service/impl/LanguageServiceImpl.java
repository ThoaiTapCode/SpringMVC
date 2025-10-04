package com.nhom2.multilang.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhom2.multilang.model.Language;
import com.nhom2.multilang.repository.LanguageRepository;
import com.nhom2.multilang.service.LanguageService;

@Service
public class LanguageServiceImpl implements LanguageService {
	
	@Autowired
	private LanguageRepository languageRepository;

	@Override
	public List<Language> getAllLanguages() {
		return languageRepository.getAllLanguages();
	}

	@Override
	public Language getLanguageById(String languageId) {
		return languageRepository.getLanguageById(languageId);
	}

	@Override
	public void addLanguage(Language language) {
		languageRepository.addLanguage(language);
	}

	@Override
	public void updateLanguage(Language language) {
		languageRepository.updateLanguage(language);
	}

	@Override
	public void deleteLanguage(String languageId) {
		languageRepository.deleteLanguage(languageId);
	}

}
