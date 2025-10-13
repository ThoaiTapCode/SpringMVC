package com.nhom2.multilang.dao.mysql;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.nhom2.multilang.dao.ProductCategoryTranslationDAO;
import com.nhom2.multilang.model.ProductCategoryTranslation;

@Repository
public class MySqlProductCategoryTranslationDAO implements ProductCategoryTranslationDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public ProductCategoryTranslation getProductCategoryByIdAndLanguage(int id, String languageID) {
		try {
			String sql = "SELECT * FROM productcategorytranslation WHERE productCategoryID = ? AND languageID = ?";
			return jdbcTemplate.queryForObject(sql, new Object[] { id, languageID },
					(rs, rowNum) -> new ProductCategoryTranslation(rs.getInt("productCategoryID"),
							rs.getString("languageID"), rs.getString("categoryName")));
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	@Override
	public List<ProductCategoryTranslation> getProductCategoryTranslationsById(int id) {
		String sql = "SELECT * FROM productcategorytranslation WHERE productCategoryID = ?";
		return jdbcTemplate.query(sql, new Object[] { id },
				(rs, rowNum) -> new ProductCategoryTranslation(rs.getInt("productCategoryID"),
						rs.getString("languageID"), rs.getString("categoryName")));
	}

	@Override
	public void addProductCategoryTranslation(ProductCategoryTranslation pct) {
		String sql = "INSERT INTO productcategorytranslation (productCategoryID, languageID, categoryName) VALUES (?, ?, ?)";
		jdbcTemplate.update(sql, pct.getProductCategoryID(), pct.getLanguageID(), pct.getCategoryName());
	}

	@Override
	public void updateProductCategoryTranslation(ProductCategoryTranslation pct) {
		String sql = "UPDATE productcategorytranslation SET categoryName = ? WHERE productCategoryID = ? AND languageID = ?";
		jdbcTemplate.update(sql, pct.getCategoryName(), pct.getProductCategoryID(), pct.getLanguageID());
	}

	@Override
	public void deleteProductCategoryTranslation(int id, String languageID) {
		String sql = "DELETE FROM productcategorytranslation WHERE productCategoryID = ? AND languageID = ?";
		jdbcTemplate.update(sql, id, languageID);
	}
}
