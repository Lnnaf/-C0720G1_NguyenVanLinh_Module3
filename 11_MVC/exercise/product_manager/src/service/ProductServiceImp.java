package service;

import model.Products;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImp implements ProductService{
    private static Map<Integer,Products> products ;

    static{
        products = new HashMap<Integer,Products>();
        products.put(1,new Products(1,"Iphone 5 ","IP5AP","12/02/2017","China","Apple"));
        products.put(2,new Products(2,"Iphone 5 S","IP5SAP","12/02/2017","China","Apple"));
        products.put(3,new Products(3,"Iphone 6 ","IP6AP","12/02/2017","China","Apple"));
        products.put(4,new Products(4,"Iphone 6 S Plus","IP6SPAP","12/02/2017","China","Apple"));
        products.put(5,new Products(5,"Iphone 7 ","IP7AP","12/02/2017","China","Apple"));
        products.put(6,new Products(6,"Iphone 7 Plus","IP7PAP","12/02/2017","China","Apple"));
        products.put(7,new Products(7,"Iphone 8 ","IP8AP","12/02/2017","China","Apple"));
        products.put(7,new Products(7,"Iphone 8 Plus  ","IP8PAP","12/02/2017","China","Apple"));
    }
    @Override
    public List<Products> showAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void addProduct(int id, Products product) {
        products.put(id,product);
    }

    @Override
    public void save(Products product) {
        products.put(product.getId(),product);
    }

    @Override
    public Products findById(int id) {
        return products.get(id);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }
}
