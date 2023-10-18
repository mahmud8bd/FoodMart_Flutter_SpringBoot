package com.sazzad.cart;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;

@Entity
@Data
public class CartItem {
	@Id
	private String foodId;
	private String userId;
	private String foodName;
	private String foodType;
	private String img;
	private String foodDescription;
	private double foodPrice;
	private double foodDiscount;
	private String shopId;
	private String shopName;
	private String shopAddress;
	private String action;
	private String quantity;

}
