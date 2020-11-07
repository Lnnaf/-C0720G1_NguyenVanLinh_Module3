package dao;

import model.User;
import java.sql.SQLException;
import java.util.List;

public interface IUserDAO {
    public void insertUser(User user) throws SQLException;

    public User selectUser(int id) throws SQLException;
    public List<User> selectUserByName(String inputName) throws SQLException;
    public List<User> selectUserByCountry(String country) throws SQLException;

    public List<User> selectAllUser();

    public List<User> sortByName(String name);
    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;
}
