package model;

public class Customer {
    String name,date, address,imgUrl;

    public Customer() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public Customer(String name, String date, String address, String imgUrl) {
        this.name = name;
        this.date = date;
        this.address = address;
        this.imgUrl = imgUrl;

    }
}
