package dao.customerDAO;

import models.Customer;

import java.util.List;

public interface ICustomerDAO {
    public List<Customer> selectAllCustomer();
    public List<String> selectAllCustomerID();
    public List<String> selectAllCustomerIDCard();
    public List<String> selectAllCustomerPhone();
    public void insertCustomer(Customer customer);
    public Customer selectCustomer(String id);
    public void updateCustomer(Customer customer);
    public void deleteCustomer(String id);
}
