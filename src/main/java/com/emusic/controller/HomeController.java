package com.emusic.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.emusic.Constants.Constants;
import com.emusic.dao.ProductDAOInterface;
import com.emusic.model.Product;

@Controller
public class HomeController {
	
	@Autowired
	private ProductDAOInterface productDAO;
	
	private Path path;
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	@RequestMapping(Constants.GET_PRODUCTS)
	public String getProducts(Model model){
		
		List<Product> productsList = new ArrayList<Product>();		
		productsList = productDAO.getAllProducts();
		model.addAttribute("products", productsList);
		
		return "productList";
	}

	@RequestMapping(Constants.GET_ALL_PRODUCTS)
	public String viewProductsDetails(@PathVariable long productId, Model model) throws IOException {
		
		Product product;
		product = productDAO.getProductById(productId);
		model.addAttribute("product", product);	
		
		return "viewProduct";
	}
	
	@RequestMapping(Constants.ADMIN_VIEW)
	public String adminPage() {
		return "admin";
	}
	
	@RequestMapping(Constants.PRODUCT_INVEN)
	public String productsInventory(Model model) throws IOException {
		
		List<Product> productsList = productDAO.getAllProducts();
		model.addAttribute("products", productsList);	
		
		return "productInventory";
	}	
	
	@RequestMapping(Constants.ADD_PRODUCT_INVEN)
    public String addProduct(Model model) throws IOException {
		
		Product product = new Product();
		product.setProductCategory("Instrument");
		product.setProductCondition("New");
		product.setProductStatus("Active");
		
		model.addAttribute("product", product);
		
		return "addProduct";
	}	 
	

	@RequestMapping(value=Constants.ADD_PRODUCT_INVEN_POST , method = RequestMethod.POST)
    public String addProductPOST(@ModelAttribute("product") Product product, HttpServletRequest request) throws IOException {
		
		productDAO.addProduct(product);
		
		MultipartFile productImage = product.getProductImage();
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		path = Paths.get(rootDirectory + "\\WEB-INF\\resouces\\images\\" + product.getProductId() +".png");
		
		if(productImage != null && !productImage.isEmpty() ) {
			try {
			    productImage.transferTo(new File(path.toString()));
			}
			catch(Exception ex) {
				ex.printStackTrace();
				throw new RuntimeException("Product image saving failed");	
			}
		}
		product.setProductImage(productImage);
		
		return "redirect:/admin/productInventory";
	}	 
	
	@RequestMapping(Constants.DELETE_PRODUCT)
	public String deleteProduct(@PathVariable long id, Model model) throws IOException {
		
		productDAO.deleteProduct(id);
		
		return "redirect:/admin/productInventory";
	}
	
}
