package models;

public class Customer extends Person {
    private String customerType;

    public Customer() {
    }

    public Customer(String id) {
        super(id);
    }

    public Customer(String id, String name, String birthday, String gender, String idCard, String phone, String email, String address, String customerType) {
        super(id, name, birthday, gender, idCard, phone, email, address);
        this.customerType = customerType;
    }

    public String getCustomerType() {
        return customerType;
    }

    public void setCustomerType(String customerType) {
        this.customerType = customerType;
    }
}
