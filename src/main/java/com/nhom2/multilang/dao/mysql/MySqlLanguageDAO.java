package com.nhom2.multilang.dao.mysql;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.nhom2.multilang.dao.LanguageDAO;
import com.nhom2.multilang.model.Language;

@Repository
public class MySqlLanguageDAO implements LanguageDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public List<Language> getAllLanguages() {
		String sql = "SELECT * FROM language WHERE isDeleted = 0";
		return jdbcTemplate.query(sql, (rs, rowNum) -> new Language(
			rs.getString("languageId"),
			rs.getString("language")
		));
	}
	
	@Override
	public Language getLanguageById(String languageID) {
		String sql = "SELECT * FROM language WHERE languageId = ? AND isDeleted = 0";
		return jdbcTemplate.queryForObject(sql, new Object[] { languageID }, (rs, rowNum) -> new Language(
			rs.getString("LanguageId"),
			rs.getString("language")
		));
	}
	
	@Override
	public void addLanguage(Language language) {
		String sql = "INSERT INTO language (languageId, language) VALUES (?, ?)";
		jdbcTemplate.update(sql, language.getLanguageID(), language.getLanguageName());
	}
	
	@Override
	public void updateLanguage(Language language) {
		String sql = "UPDATE language SET language = ? WHERE languageId = ?";
		jdbcTemplate.update(sql, language.getLanguageName(), language.getLanguageID());
	}
	
	@Override
	public void deleteLanguage(String languageID) {
		String sql = "UPDATE language SET isDeleted = 1 WHERE languageId = ?";
		jdbcTemplate.update(sql, languageID);
	}
}
