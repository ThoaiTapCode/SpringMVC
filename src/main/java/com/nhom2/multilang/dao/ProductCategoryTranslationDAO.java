package com.nhom2.multilang.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.nhom2.multilang.model.ProductCategoryTranslation;

@Repository
public class ProductCategoryTranslationDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public ProductCategoryTranslation getProductCategoryByIdAndLanguage(int id, String languageID) {
		String sql = "SELECT * FROM productcategorytranslation WHERE productCategoryID = ? AND languageID = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { id, languageID }, (rs, rowNum) -> new ProductCategoryTranslation(
				rs.getInt("productCategoryID"),
				rs.getString("languageID"),
				rs.getString("categoryName")
		));
	}
	
	public void addProductCategoryTranslation(ProductCategoryTranslation pct) {
		String sql = "INSERT INTO productcategorytranslation (productCategoryID, languageID, categoryName) VALUES (?, ?, ?)";
		jdbcTemplate.update(sql, pct.getProductCategoryID(), pct.getLanguageID(), pct.getCategoryName());
	}
	
	public void updateProductCategoryTranslation(ProductCategoryTranslation pct) {
		String sql = "UPDATE productcategorytranslation SET categoryName = ? WHERE productCategoryID = ? AND languageID = ?";
		jdbcTemplate.update(sql, pct.getCategoryName(), pct.getProductCategoryID(), pct.getLanguageID());
	}
	
	public void deleteProductCategoryTranslation(int id, String languageID) {
		String sql = "DELETE FROM productcategorytranslation WHERE productCategoryID = ? AND languageID = ?";
		jdbcTemplate.update(sql, id, languageID);
	}
}
