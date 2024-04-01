package com.protech.pharmaplus.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.protech.pharmaplus.dto.Product;

public interface ProductRepository extends JpaRepository<Product, Integer> 
{

	List<Product> findByName(String name);

}
