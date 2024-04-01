package com.protech.pharmaplus.service;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.protech.pharmaplus.dto.Customer;
import com.protech.pharmaplus.dto.Item;
import com.protech.pharmaplus.dto.Product;
import com.protech.pharmaplus.dto.RazorPayOrder;
import com.protech.pharmaplus.dto.ShoppingCart;
import com.protech.pharmaplus.repository.CustomerRepository;
import com.protech.pharmaplus.repository.ProductRepository;
import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;

import jakarta.servlet.http.HttpSession;

@Service
public class CustomerService {
	@Autowired
	CustomerRepository customerRepository;
	@Autowired
	ProductRepository productRepository;

	private static final String KEY = "rzp_test_f4vcAPoh0RDZfi";
	private static final String KEY_SECRETKEY = "jjblWSJ6F7NJuPUOtNmDjg4i";
	private static final String CURRENCY = "INR";

	public String signup(Customer customer, ModelMap model) {
		Customer customer1 = null;
		try {
			long mobile = customer.getMno();
			customer1 = customerRepository.findByMno(mobile);
		} catch (NumberFormatException e) {
			String email = customer.getEmail();
			customer1 = customerRepository.findByEmail(email);
		}
		if (customer1 == null) {
			customerRepository.save(customer);
			model.put("pass", "Data Saved Succesfully");
			return "home";
		} else {
			model.put("fail", "Email or Mobile Already Exists");
			return "customersignup";
		}

	}

	public String login(String user, String password, HttpSession session, ModelMap model) {
		Customer customer = null;
		try {
			long mobile = Long.parseLong(user);
			customer = customerRepository.findByMno(mobile);
		} catch (NumberFormatException e) {
			String email = user;
			customer = customerRepository.findByEmail(email);
		}
		if (customer == null) {
			model.put("fail", "Incorrect Email or Mobile");
			return "customerlogin";
		} else {
			if (customer.getPwd().equals(password)) {
				session.setAttribute("customer", customer);
				model.put("pass", "Login Success");
				return "home";
			} else {
				model.put("fail", "Incorrect Password");
				return "customerlogin";
			}
		}
	}

	public String fetchProducts(ModelMap model) {
		List<Product> list = productRepository.findAll();
		if (list.isEmpty()) {
			model.put("fail", "data not found");
			return "home";
		} else {
			model.put("list", list);
			return "customerproduct";
		}
	}

	public String addToCart(HttpSession session, ModelMap model, int id) {
		if (session.getAttribute("customer") == null) {
			model.put("fail", "First Login to Add to Cart");
			return "customerlogin";
		} else {

			Product product = productRepository.findById(id).orElse(null);
			Customer customer = (Customer) session.getAttribute("customer");

			ShoppingCart cart = customer.getCart();
			if (cart == null) {
				cart = new ShoppingCart();
			}

			List<Item> items = cart.getItems();

			if (items == null) {
				items = new ArrayList<Item>();
			}
			Item item = null;
			if (items.isEmpty()) {
				item = new Item();
				item.setImage(product.getImage());
				item.setName(product.getName());
				item.setPrice(product.getPrice());
				item.setQuantity(1);
				items.add(item);
			} else {
				boolean flag = false;
				for (Item item1 : items) {
					if (item1.getName().equals(product.getName())) {
						item1.setQuantity(item1.getQuantity() + 1);
						item1.setPrice(item1.getPrice() + product.getPrice());
						item = item1;
						flag = false;
						break;
					} else {
						flag = true;
					}
				}
				if (flag) {
					item = new Item();
					item.setImage(product.getImage());
					item.setName(product.getName());
					item.setPrice(product.getPrice());
					item.setQuantity(1);
					items.add(item);
				}

			}

			cart.setItems(items);
			customer.setCart(cart);

			customerRepository.save(customer);
			model.put("pass", "Added to Cart");
			List<Product> list = productRepository.findAll();
			if (list.isEmpty()) {
				model.put("fail", "data not found");
				return "home";
			} else {
				model.put("list", items);
				return "customercart";
			}
		}
	}

	public String viewCart(HttpSession session, ModelMap model) {
		Customer customer = (Customer) session.getAttribute("customer");
		if (customer == null || customer.getCart() == null || customer.getCart().getItems() == null
				|| customer.getCart().getItems().isEmpty()) {
			model.put("fail", "No Products in Cart");
			return "/home";
		} else {
			List<Item> items = customer.getCart().getItems();
			model.put("list", items);
			return "customercart";
		}
	}

	public String delete(HttpSession session, ModelMap model, String name) {
		Item item1 = null;
		Customer customer = (Customer) session.getAttribute("customer");
		if (customer == null) {
			model.put("fail", "please login again");
			return "customerlogin";
		} else {
			List<Item> items = customer.getCart().getItems();
			Product product = productRepository.findByName(name).get(0);
			for (Item item : items) {
				if (item.getName().equals(product.getName())) {
					item1 = item;
				}
			}
			if (item1.getQuantity() > 1) {
				item1.setQuantity(item1.getQuantity() - 1);
			} else {
				items.remove(item1);
			}

			ShoppingCart cart = customer.getCart();
			cart.setItems(items);
			customer.setCart(cart);
			customerRepository.save(customer);
			List<Item> items1 = customer.getCart().getItems();
			model.put("list", items1);
			model.put("pass", "Item Removed From Cart");
			return "customercart";
		}
	}

	public String billing(HttpSession session, ModelMap model, String payment) {
		double price = 0;
		Customer customer = (Customer) session.getAttribute("customer");
		if (customer == null) {
			model.put("fail", "please login again");
			return "customerlogin";
		} else {
			for (Item item : customer.getCart().getItems()) {
				price = price + (item.getPrice());
			}

			if (payment.equals("RazorPay")) {
				JSONObject object = new JSONObject();
				object.put("amount", price * 100);
				object.put("currency", CURRENCY);

				RazorpayClient client;
				try {
					client = new RazorpayClient(KEY, KEY_SECRETKEY);
					Order order2 = client.orders.create(object);

					RazorPayOrder order = new RazorPayOrder();
					order.setAmount(order2.get("amount").toString());
					order.setCurrency(order2.get("currency").toString());
					order.setPaymentId(null);
					order.setOrderid(order2.get("id").toString());
					order.setStatus(order2.get("status"));
					order.setKey(KEY);
					model.put("order", order);
					model.put("customer", customer);

				} catch (RazorpayException e) {
					e.printStackTrace();
				}
				return "razorpayhome";
			} else {
				model.put("price", price);
				model.put("payment", payment);
				model.put("customer", customer);
				customerRepository.save(customer);
				return "customerbilling";
			}
		}

	}

	public String search(String product, ModelMap map) {
		List<Product> list = (List<Product>) productRepository.findByName(product);
		if (list.isEmpty()) {
			map.put("fail", "No Product found");
			return "home";
		} else {
			map.put("list", list);
			return "search-product";
		}
	}

	public String billing(HttpSession session, ModelMap model) {
		double price = 0;
		Customer customer = (Customer) session.getAttribute("customer");
		if (customer == null) {
			model.put("fail", "please login again");
			return "customerlogin";
		} else {
			for (Item item : customer.getCart().getItems()) {
				price = price + (item.getPrice());
			}
			model.put("price", price);
			model.put("payment", "RazorPay");
			model.put("customer", customer);
			customerRepository.save(customer);
			return "customerbilling";
		}
	}
}
