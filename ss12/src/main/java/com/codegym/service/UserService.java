package com.codegym.service;

import com.codegym.dao.IUserDAO;
import com.codegym.dao.UserDAO;
import com.codegym.model.User;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService{
    private IUserDAO userDAO = new UserDAO();

    @Override
    public void insertUser(User user) throws SQLException {
        userDAO.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        User user = userDAO.selectUser(id);
        return user;
    }

    @Override
    public List<User> selectAllUsers() {
        List<User> userList = userDAO.selectAllUsers();
        return userList;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean checkUser = userDAO.deleteUser(id);
        return checkUser;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        boolean checkUser = userDAO.updateUser(user);
        return checkUser;
    }

    @Override
    public String createWithTransaction(User user) {
        String str = userDAO.createWithTransaction(user);
        return str;
    }

    @Override
    public List<User> findByCountry(String country) {
        List<User> userList = userDAO.findByCountry(country);
        return userList;
    }

    @Override
    public List<User> sortByName() {
        List<User> userList = userDAO.sortByName();
        return userList;
    }
}
