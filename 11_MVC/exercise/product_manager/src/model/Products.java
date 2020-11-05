package model;

public class Products {
    int id;
    String name, code, date, origin, company;
    String imgUrl;

    public Products() {
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public Products(int id, String name, String code, String date, String origin, String company, String imgUrl) {
        this.id = id;
        this.name = name;
        this.code = code;
        this.date = date;
        this.origin = origin;
        this.company = company;
        this.imgUrl = imgUrl;
    }

    public Products(int id, String name, String code, String date, String origin, String company) {
        this.id = id;
        this.name = name;
        this.code = code;
        this.date = date;
        this.origin = origin;
        this.company = company;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }
}
