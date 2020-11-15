package models;

public class Employee extends Person {
    int salary;
    int positionId, educationId, divisionId;
    String position, education, division;
    String username;

    public Employee() {
    }

    public Employee(String name, String birthday, String idCard, String phone, String email, String address, int salary, int positionId, int educationId, int divisionId, String username) {
        super(name, birthday,idCard, phone, email, address);
        this.salary = salary;
        this.positionId = positionId;
        this.educationId = educationId;
        this.divisionId = divisionId;
        this.username = username;
    }

    public Employee(String id, String name, String birthday, String idCard, String phone, String email, String address, int salary, int positionId, int educationId, int divisionId, String username) {
        super(id, name, birthday, idCard, phone, email, address);
        this.salary = salary;
        this.positionId = positionId;
        this.educationId = educationId;
        this.divisionId = divisionId;
        this.username = username;
    }

    public Employee(String id, String name, String birthday,
                    String idCard, int salary, String phone, String email, String address,
                    String position, String education, String division,
                    String username) {
        super(id, name, birthday, idCard, phone, email, address);
        this.salary = salary;
        this.position = position;
        this.education = education;
        this.division = division;
        this.username = username;
    }


    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public int getPositionId() {
        return positionId;
    }

    public void setPositionId(int positionId) {
        this.positionId = positionId;
    }

    public int getEducationId() {
        return educationId;
    }

    public void setEducationId(int educationId) {
        this.educationId = educationId;
    }

    public int getDivisionId() {
        return divisionId;
    }

    public void setDivisionId(int divisionId) {
        this.divisionId = divisionId;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getDivision() {
        return division;
    }

    public void setDivision(String division) {
        this.division = division;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
