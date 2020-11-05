package service;

import model.Products;

import java.util.List;

public interface ProductService {
    List<Products> showAll();

    void addProduct(int id,Products product);

    void save(Products product);

    Products findById(int id);

    void remove(int id);
}
