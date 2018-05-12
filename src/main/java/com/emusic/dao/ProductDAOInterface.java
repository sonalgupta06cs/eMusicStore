/**
 * 
 */
package com.emusic.dao;

import java.util.List;

import com.emusic.model.Product;

/**
 * @author SonaSach
 *
 */
public interface ProductDAOInterface {

	void addProduct(Product product);
	
	Product getProductById(long id);
	
	List<Product> getAllProducts();
	
	void deleteProduct(long id);
	
}
