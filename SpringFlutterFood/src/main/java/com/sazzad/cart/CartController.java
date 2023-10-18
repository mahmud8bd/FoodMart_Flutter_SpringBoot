package com.sazzad.cart;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin(origins = "*")
@RestController
public class CartController {

	@Autowired
	private CartRepository cartRepository;
	
	@PostMapping("/auth/saveCart")
	public void saveCart(@RequestBody CartItem cartItem) {
		cartRepository.save(cartItem);
	}

	@GetMapping("/auth/cart")
	public List<CartItem> getCart(){
		List<CartItem> allCart = new ArrayList<>();
		allCart = cartRepository.findAll();
		return allCart;
	}
	
	@GetMapping("/auth/cartByuser")
	public List<CartItem> getCartByUserId(@RequestParam String userId){
		List<CartItem> allCart = new ArrayList<>();
		allCart = cartRepository.findAllByUserId(userId);
		return allCart;
	}
	
	@DeleteMapping("/auth/deleteCart")
	public void deleteCart(@RequestParam String id) {
		cartRepository.deleteById(id);
	}
}
