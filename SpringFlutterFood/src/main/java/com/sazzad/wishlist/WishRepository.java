package com.sazzad.wishlist;

import org.springframework.data.jpa.repository.JpaRepository;

public interface WishRepository extends JpaRepository<WishList, String> {

}
