import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CustomerRegistration")
public class CustomerRegistration extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String nm=req.getParameter("Cust_Name");
		String addr=req.getParameter("Address");
		String phno=req.getParameter("Phone_No");
		String dt=req.getParameter("Date");
		Date date=Date.valueOf(dt);
		
		HttpSession session=req.getSession();
		String qty=(String) session.getAttribute("Qty");
		int Qty=Integer.parseInt(qty);
		
		String bkid=(String) session.getAttribute("bid");
			
		System.out.println(nm+" "+addr+" "+phno+" "+Qty+" "+bkid+" "+date);
		
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loaded");
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","root");
			System.out.println("Connection Success");
			
			PreparedStatement pstm=con.prepareStatement("insert into cust_detail(Cust_Name,Phone_No,Address,Quantity,Book_Id,Order_Date) values(?,?,?,?,?,?)");
			pstm.setString(1, nm);
			pstm.setString(2, phno);
			pstm.setString(3, addr);
			pstm.setInt(4, Qty);
			pstm.setString(5, bkid);			
			pstm.setDate(6, date);
			
			int i=pstm.executeUpdate();
			
			if(i!=0) 
			{	
				System.out.println("Record Inserted");
				resp.sendRedirect("ThankYou.jsp");
			}
			else
			{
				System.out.println("Error");
				resp.sendRedirect("Error.jsp");
			}
			
			
			
		} 
		catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
