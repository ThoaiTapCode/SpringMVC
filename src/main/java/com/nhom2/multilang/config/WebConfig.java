package com.nhom2.multilang.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.nhom2.multilang")
@PropertySource("classpath:db.properties")
public class WebConfig implements WebMvcConfigurer {
	
	@Autowired
	private Environment env;
	
	@Bean
	public DataSource dataSource() {
		HikariConfig config = new HikariConfig();
		config.setDriverClassName(env.getProperty("db.driverClassName"));
		config.setJdbcUrl(env.getProperty("db.url"));
		config.setUsername(env.getProperty("db.username"));
		config.setPassword(env.getProperty("db.password"));
		
		// Pool settings
		config.setMaximumPoolSize(Integer.parseInt(env.getProperty("jdbc.pool.size", "10")));
        config.setIdleTimeout(Long.parseLong(env.getProperty("jdbc.idleTimeout", "30000")));
        config.setMaxLifetime(Long.parseLong(env.getProperty("jdbc.maxLifetime", "1800000")));
        config.setConnectionTimeout(Long.parseLong(env.getProperty("jdbc.connectionTimeout", "30000")));
        
        return new HikariDataSource(config);
	}
	
	@Bean
	public JdbcTemplate jdbcTemplate(DataSource dataSource) {
		return new JdbcTemplate(dataSource);
	}
	
	@Bean
	public InternalResourceViewResolver viewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}
	
}
