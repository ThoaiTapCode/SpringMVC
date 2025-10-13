package com.nhom2.multilang.config;

import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.concurrent.ConcurrentMapCacheManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@EnableCaching
public class CacheConfig {

	@Bean
    public CacheManager cacheManager() {
        // Dùng cache trong bộ nhớ (ConcurrentHashMap)
        return new ConcurrentMapCacheManager("languages");
    }
	
}
