package com.nhom2.multilang.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.nhom2.multilang.model.Language;

@Repository
public class LanguageDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Language> getAllLanguages() {
		String sql = "SELECT * FROM language";
		return jdbcTemplate.query(sql, (rs, rowNum) -> new Language(
			rs.getString("languageId"),
			rs.getString("language")
		));
	}
	
	public Language getLanguageById(String languageID) {
		String sql = "SELECT * FROM language WHERE languageId = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { languageID }, (rs, rowNum) -> new Language(
			rs.getString("LanguageId"),
			rs.getString("language")
		));
	}
	
	public void addLanguage(Language language) {
		String sql = "INSERT INTO language (languageId, language) VALUES (?, ?)";
		jdbcTemplate.update(sql, language.getLanguageID(), language.getLanguageName());
	}
	
	public void updateLanguage(Language language) {
		String sql = "UPDATE language SET language = ? WHERE languageId = ?";
		jdbcTemplate.update(sql, language.getLanguageName(), language.getLanguageID());
	}
	
	public void deleteLanguage(String languageID) {
		String sql = "DELETE FROM language WHERE languageId = ?";
		jdbcTemplate.update(sql, languageID);
	}
}
