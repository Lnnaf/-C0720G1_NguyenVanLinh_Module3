package main;

import model.Customer;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class MainController {
    public static List<Customer> readFile(){
        List<Customer> listCustomer = new ArrayList<>();
        try{
            int index=0;
            FileReader fileReader = new FileReader("C:\\Study\\-C0720G1_NguyenVanLinh_Module3\\10_JSP\\exercise\\list_customers\\web\\customer.CSV");
            BufferedReader bufferedReader = new BufferedReader(fileReader);
            String temp = null;
            String[] line = null;
            while ((temp = bufferedReader.readLine()) != null) {
                line = temp.split(",");
                Customer customer = new Customer(line[0], line[1], line[2], line[3]);
                listCustomer.add(customer);
            }
            Customer customer1;

            bufferedReader.close();
        }catch(IOException e){
            e.getMessage();
        }
        return listCustomer;
    }
}
