package br.com.fatecpg.db;

import java.util.ArrayList;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SampleConnector {
    public static ArrayList<Customer> getCustomers() throws ClassNotFoundException, SQLException{
        ArrayList<Customer> list = new ArrayList<>();
        //Copiar de: Java DB (Network) -> Personalizar
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        //Copiar de: jdbc:derby://localhost... -> Propriedades
        String url="jdbc:derby://localhost:1527/sample";
        String user="app";
        String pass="app";
        Connection con = DriverManager.getConnection(url, user, pass);
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM CUSTOMER");
        while (rs.next()){
            Customer c = new Customer(rs.getString("CUSTOMER_ID"), rs.getString("NAME"), rs.getDouble("CREDIT_LIMIT"));
            list.add(c);
        }
        return list;
    }
}
