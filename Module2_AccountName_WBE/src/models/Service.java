package models;

public class Service {
    String serviceId,name;
    double serviceArea;
    int serviceCost,serviceMaxPeople;
    int serviceTypeId,rentTypeId;
    String serviceTypeName,rentTypeName;
    int rentTypeCost;
    String standardRoom,description;
    Double poolArea;
    int numOfFloor;
    String status;


    public Service() {
    }

    public Service(String serviceId, String name, double serviceArea, int serviceCost, int serviceMaxPeople, int rentTypeId, int serviceTypeId, String standardRoom, String description, Double poolArea, int numOfFloor, String status) {
        this.serviceId = serviceId;
        this.name = name;
        this.serviceArea = serviceArea;
        this.serviceCost = serviceCost;
        this.serviceMaxPeople = serviceMaxPeople;
        this.rentTypeId = rentTypeId;
        this.serviceTypeId = serviceTypeId;
        this.standardRoom = standardRoom;
        this.description = description;
        this.poolArea = poolArea;
        this.numOfFloor = numOfFloor;
        this.status = status;
    }

    public Service(String serviceId, String name, double serviceArea, int serviceCost, int serviceMaxPeople, String serviceTypeName, String rentTypeName, int rentTypeCost, String standardRoom, String description, Double poolArea, int numOfFloor, String status) {
        this.serviceId = serviceId;
        this.name = name;
        this.serviceArea = serviceArea;
        this.serviceCost = serviceCost;
        this.serviceMaxPeople = serviceMaxPeople;
        this.serviceTypeName = serviceTypeName;
        this.rentTypeName = rentTypeName;
        this.rentTypeCost = rentTypeCost;
        this.standardRoom = standardRoom;
        this.description = description;
        this.poolArea = poolArea;
        this.numOfFloor = numOfFloor;
        this.status = status;
    }

    public String getServiceId() {
        return serviceId;
    }

    public void setServiceId(String serviceId) {
        this.serviceId = serviceId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getServiceArea() {
        return serviceArea;
    }

    public void setServiceArea(double serviceArea) {
        this.serviceArea = serviceArea;
    }

    public int getServiceCost() {
        return serviceCost;
    }

    public void setServiceCost(int serviceCost) {
        this.serviceCost = serviceCost;
    }

    public int getServiceMaxPeople() {
        return serviceMaxPeople;
    }

    public void setServiceMaxPeople(int serviceMaxPeople) {
        this.serviceMaxPeople = serviceMaxPeople;
    }

    public String getServiceTypeName() {
        return serviceTypeName;
    }

    public void setServiceTypeName(String serviceTypeName) {
        this.serviceTypeName = serviceTypeName;
    }

    public String getRentTypeName() {
        return rentTypeName;
    }

    public void setRentTypeName(String rentTypeName) {
        this.rentTypeName = rentTypeName;
    }

    public int getRentTypeCost() {
        return rentTypeCost;
    }

    public void setRentTypeCost(int rentTypeCost) {
        this.rentTypeCost = rentTypeCost;
    }

    public String getStandardRoom() {
        return standardRoom;
    }

    public void setStandardRoom(String standardRoom) {
        this.standardRoom = standardRoom;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getPoolArea() {
        return poolArea;
    }

    public void setPoolArea(Double poolArea) {
        this.poolArea = poolArea;
    }

    public int getNumOfFloor() {
        return numOfFloor;
    }

    public void setNumOfFloor(int numOfFloor) {
        this.numOfFloor = numOfFloor;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getServiceTypeId() {
        return serviceTypeId;
    }

    public void setServiceTypeId(int serviceTypeId) {
        this.serviceTypeId = serviceTypeId;
    }

    public int getRentTypeId() {
        return rentTypeId;
    }

    public void setRentTypeId(int rentTypeId) {
        this.rentTypeId = rentTypeId;
    }
}
