package com.codegym.service;

import com.codegym.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    public void insertUser(User user) throws SQLException;

    public User selectUser(int id);

    public List<User> selectAllUsers();

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;
    public String createWithTransaction(User user);
    List<User> findByCountry(String country);
    public List<User> sortByName();
}
