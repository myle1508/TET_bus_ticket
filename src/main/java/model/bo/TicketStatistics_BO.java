package model.bo;

import java.util.List;
import java.util.Map;

import model.dao.TicketStatistics_DAO;
public class TicketStatistics_BO {
	TicketStatistics_DAO TicketStatistics_DAO = new TicketStatistics_DAO();
	
	public Map<String, Double> getRevenueByDate(String period) throws ClassNotFoundException 
	{
		return TicketStatistics_DAO.getRevenueByDate(period);
	}
	 public List<Map<String, Object>> getTop3UsersByTickets() throws ClassNotFoundException 
	 {
		 return TicketStatistics_DAO.getTop3UsersByTickets();
	 }
	 public Map<String, Integer> getTopRouteByTickets() throws ClassNotFoundException 
	 {
		 return TicketStatistics_DAO.getTopRouteByTickets();	
	 }
}
