package dao.serviceDAO;

import models.Service;

import java.util.List;

public interface IServiceDAO {
    public List<Service> showAllService();
    public void insertNewService(Service service);
    public List<String> selectAllServiceID();
}
