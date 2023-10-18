package com.sazzad.wishlist;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin(origins="*")
@RestController
public class WishController {
	
	@Autowired
	private WishRepository wishRepository;
	
	
	@PostMapping("/auth/saveWish")
	public void saveWish(@RequestBody WishList wishList) {
		wishRepository.save(wishList);
	}
	
	@GetMapping("/auth/getWishList")
	public List<WishList> getwishList(){
		List<WishList> allwishList = new ArrayList<>();
		allwishList = wishRepository.findAll();
		return allwishList;
	}
	
	
	

}
