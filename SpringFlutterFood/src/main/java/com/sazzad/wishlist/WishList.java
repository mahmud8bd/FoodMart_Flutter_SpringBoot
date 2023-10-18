package com.sazzad.wishlist;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;
@Entity
@Data
public class WishList {
	@Id
	private String foodId;
	private String foodName;
	private String foodType;
	private String img;
	private String foodDescription;
	private double foodPrice;
	private double foodDiscount;
	private double rating;
	private String shopId;
	private String shopName;
	private String shopAddress;
	private Boolean wish;

}
