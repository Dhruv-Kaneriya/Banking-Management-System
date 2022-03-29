package com.hindustandbank.bms.dao;

import com.hindustandbank.bms.model.Customer;
import com.hindustandbank.bms.util.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;

public class CustomerDao {
    public Boolean addCustomer(Customer customer) throws SQLException, ClassNotFoundException {

         String accountNumber = customer.getAccountNumber();
         String firstName = customer.getFistName();
         String lastName = customer.getLastName();
         String aadharNumber = customer.getAadharNumber();
         String mobileNumber = customer.getMobileNumber();
         Date birthDate = customer.getBirthdate();
         String address = customer.getAddress();
         String gender = customer.getGender();


        Connection conn = DatabaseConnection.initializeDatabase();

        PreparedStatement preparedStatement = conn.prepareStatement("Select * from CUSTOMERS where aadhar=?");

        preparedStatement.setString(1, aadharNumber);

        //Step 4. Execute Query
        ResultSet rs = preparedStatement.executeQuery();

        if (rs.next()) {
            return false;
        }
        else {
            preparedStatement = conn.prepareStatement("Insert into CUSTOMERS (accno,firstname,lastname,aadhar,mobile,dob,address,gender) values(?,?,?,?,?,?,?,?)");
            preparedStatement.setString(1, accountNumber);
            preparedStatement.setString(2, firstName);
            preparedStatement.setString(3, lastName);
            preparedStatement.setString(4, aadharNumber);
            preparedStatement.setString(5, mobileNumber);
            preparedStatement.setDate(6, birthDate);
            preparedStatement.setString(7, address);
            preparedStatement.setString(8, gender);
            preparedStatement.executeQuery();

            preparedStatement = conn.prepareStatement("Insert into BALANCE (accno,balance) values(?,?)");
            preparedStatement.setString(1, accountNumber);
            preparedStatement.setInt(2, 0);
            preparedStatement.executeQuery();
            conn.close();
            return true;
        }
    }
}
