package com.application.service;

import com.application.model.Customer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerServiceImpl implements CustomerService {
    private static Map<Integer, Customer> customers;

    static{
        customers = new HashMap<>();
        customers.put(1, new Customer(1,"John", "john@codegym.vn", "Bangkok"));
        customers.put(2, new Customer(2,"Dax", "Dax@codegym.vn", "Jakarta"));
        customers.put(3, new Customer(3,"Grak", "Grak@codegym.vn", "Tokyo"));
        customers.put(4, new Customer(4,"Phantom", "Phantom@codegym.vn", "Manila"));
        customers.put(5, new Customer(5,"Wick", "Wick@codegym.vn", "Singapore"));
        customers.put(6, new Customer(6,"Suut", "Suut@codegym.vn", "San Fransisco"));
        customers.put(7, new Customer(7,"Lynn", "Lynn@codegym.vn", "Los Angeles"));
    }

    @Override
    public List<Customer> findAll() {
        return new ArrayList<>(customers.values());
    }

    @Override
    public void save(Customer customer) {
        customers.put(customer.getId(),customer);
    }

    @Override
    public Customer findById(int id) {
        return customers.get(id);
    }

    @Override
    public void update(int id, Customer customer) {
        customers.put(id,customer);
    }

    @Override
    public void remove(int id) {
        customers.remove(id);
    }
}
