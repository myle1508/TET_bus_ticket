package controller;

import java.io.Console;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bo.*;

@WebServlet("/thong-ke")
public class RevenueStatisticsController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        TicketStatistics_BO model = new TicketStatistics_BO();
        
        String period = request.getParameter("period");  
        if (period == null) {
            period = "%Y-%m-%d"; 
        }
        Map<String, Double> revenueByDate = null;
        try {
            revenueByDate = model.getRevenueByDate(period);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        request.setAttribute("revenueByDate", revenueByDate);
        
        List<Map<String, Object>> topUsers = null;
        try {
            topUsers = model.getTop3UsersByTickets();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        request.setAttribute("topUsers", topUsers);
        
        Map<String, Integer> topRoute = null;
        try {
            topRoute = model.getTopRouteByTickets();            
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        request.setAttribute("topRoute", topRoute);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("statistical.jsp");
        dispatcher.forward(request, response);
    }
}
