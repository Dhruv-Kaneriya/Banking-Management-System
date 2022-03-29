package com.hindustandbank.bms.dao;

import com.hindustandbank.bms.model.User;
import com.hindustandbank.bms.util.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
    public Boolean authenticateUser(User user) throws SQLException, ClassNotFoundException {
         String username = user.getUsername();
         String password = user.getPassword();

         Connection conn = DatabaseConnection.initializeDatabase();

        PreparedStatement preparedStatement = conn.prepareStatement("Select * from USERS where user_name=? and user_password=?");
        preparedStatement.setString(2, password);
        preparedStatement.setString(1, username);

        ResultSet rs = preparedStatement.executeQuery();

        return rs.next();

    };

}
