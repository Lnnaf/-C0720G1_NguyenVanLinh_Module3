package Service;

import dao.customerDAO.CustomerDAO;
import dao.customerDAO.ICustomerDAO;
import dao.serviceDAO.IServiceDAO;
import dao.serviceDAO.ServiceDAO;
import models.Customer;
import models.Service;

import java.util.List;

public class ServicesImp implements  IServices{
    private ICustomerDAO customerDAO = new CustomerDAO();
    private IServiceDAO serviceDAO = new ServiceDAO();

    @Override
    public List<Customer> selectAllUserServices() {
        List<Customer> listCustomer;
        listCustomer = customerDAO.selectAllCustomer();
        return listCustomer;
    }

    @Override
    public void insertNewCustomer(Customer customer) {
        customerDAO.insertCustomer(customer);
    }

    @Override
    public void insertNewService(Service service) {
        serviceDAO.insertNewService(service);
    }

    @Override
    public String randomID() {
        List<String> lisCustomer = customerDAO.selectAllCustomerID();
        int num;
        num=(int)(Math.random()*9999);
        String id = "KH-"+num;
        for (String ID:lisCustomer) {
            if(ID.equals(id)){
                randomID();
            }else{
                break;
            }
        }
        return id;
    }

    @Override
    public String randomServiceID() {
        List<String> listServiceID = serviceDAO.selectAllServiceID();
        int num;
        num=(int)(Math.random()*9999);
        String id = "DV-"+num;
        for (String ID:listServiceID) {
            if(ID.equals(id)){
                randomID();
            }else{
                break;
            }
        }
        return id;
    }

    @Override
    public Customer selectCustomer(String id) {
        Customer customer;
        customer = customerDAO.selectCustomer(id);
        return customer;
    }

    @Override
    public void updateCustomer(Customer customer) {
        customerDAO.updateCustomer(customer);
        }

    @Override
    public void deleteCustomer(String id) {
        customerDAO.deleteCustomer(id);
    }

    @Override
    public List<String> selectAllCustomerIDCard() {
        return customerDAO.selectAllCustomerIDCard();
    }

    @Override
    public List<String> selectAllCustomerPhone() {
        return customerDAO.selectAllCustomerPhone();
    }

    @Override
    public List<Service> showAllService() {
        return serviceDAO.showAllService();
    }
}

