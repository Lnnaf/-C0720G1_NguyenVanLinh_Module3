package Service;

import models.Customer;
import models.Service;

import java.util.List;

public interface IServices {
    public List<Customer> selectAllUserServices();
    public  void insertNewCustomer(Customer customer);
    public  void insertNewService(Service service);
    public String randomID();
    public String randomServiceID();
    public Customer selectCustomer(String id);
    public void updateCustomer(Customer customer);
    public void deleteCustomer(String id);
    public List<String> selectAllCustomerIDCard();
    public List<String> selectAllCustomerPhone();
    public List<Service> showAllService();
}
