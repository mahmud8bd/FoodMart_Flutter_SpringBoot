package com.sazzad.cart;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CartRepository extends JpaRepository<CartItem, String> {

	List<CartItem> findAllByUserId(Object object);

}
