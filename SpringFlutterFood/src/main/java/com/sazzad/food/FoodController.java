package com.sazzad.food;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin(origins="*")
public class FoodController {
	
	@Autowired
	private FoodRepository repository;
	
	@GetMapping("/auth/food")
	public List<Food> allFood(){
		List<Food> foods = new ArrayList<>();
		foods = repository.findAll();
		return foods;
	}

}
