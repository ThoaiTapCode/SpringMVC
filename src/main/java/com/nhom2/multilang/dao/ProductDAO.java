package com.nhom2.multilang.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.nhom2.multilang.model.Product;

@Repository
public class ProductDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Product> getAllProducts() {
		String sql = "SELECT * FROM product";
		return jdbcTemplate.query(sql, (rs, rowNum) -> new Product(
				rs.getInt("productID"),
				rs.getFloat("price"),
				rs.getDouble("weight"),
				rs.getInt("productCategoryID")
		));
	}

	public Product getProductById(int productId) {
		String sql = "SELECT * FROM product WHERE productID = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { productId }, (rs, rowNum) -> new Product(
				rs.getInt("productID"),
				rs.getFloat("price"),
				rs.getDouble("weight"),
				rs.getInt("productCategoryID")
		));
	}
	
	public void addProduct(Product product) {
		String sql = "INSERT INTO product (price, weight, productCategoryID) VALUES (?, ?, ?)";
		jdbcTemplate.update(sql, product.getPrice(), product.getWeight(), product.getProductCategoryId());
	}
	
	public void updateProduct(Product product) {
		String sql = "UPDATE product SET price = ?, weight = ?, productCategoryID = ? WHERE productID = ?";
		jdbcTemplate.update(sql, product.getPrice(), product.getWeight(), product.getProductCategoryId(), product.getProductId());
	}
	
	public void deleteProduct(int productId) {
		String sql = "DELETE FROM product WHERE productID = ?";
		jdbcTemplate.update(sql, productId);
	}
}
