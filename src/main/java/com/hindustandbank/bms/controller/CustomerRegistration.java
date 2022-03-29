package com.hindustandbank.bms.controller;

import com.hindustandbank.bms.dao.CustomerDao;
import com.hindustandbank.bms.model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import static java.lang.System.out;

// After user has added the confirm value redirecy them to new page to confirm or delete the existing order
@WebServlet(name = "customerRegistration", value = "/customer_registration")
public class CustomerRegistration extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("views/customer_registration.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String aadhar = request.getParameter("aadhar");
        String mobile = request.getParameter("mobile");
        String dob = request.getParameter("dob");
        String address=request.getParameter("address");
        String gender= request.getParameter("inlineRadioOptions");

        java.sql.Date sqlDate = java.sql.Date.valueOf(dob);

        Date acdate = Calendar.getInstance().getTime();
        DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        String accno = dateFormat.format(acdate);

        Customer customer = new Customer();
        customer.setAccountNumber(accno);
        customer.setFistName(fname);
        customer.setLastName(lname);
        customer.setAadharNumber(aadhar);
        customer.setMobileNumber(mobile);
        customer.setBirthdate(sqlDate);
        customer.setAddress(address);
        customer.setGender(gender);

        CustomerDao customerDao = new CustomerDao();
        try {
            Boolean status = customerDao.addCustomer(customer);
            if(status){
                //Give user ACKNOWLEDGEMENT of account created

                response.sendRedirect("views/customer_registration_confirm.jsp");
            }else{
//                out.print(
//                        "<script language='javascript'>alert('Admin ID or Password Can Not Be Empty!');</script>");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }


    }
}
