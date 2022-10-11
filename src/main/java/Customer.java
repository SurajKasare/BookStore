import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CustomerServlet")
public class Customer extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		HttpSession session=req.getSession();
		String bkid=(String) session.getAttribute("bid");
		
		System.out.println("Book id in Customer:"+bkid);
		
		String qty=req.getParameter("Qty");
		
		session.setAttribute("Qty", qty);
		
		
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loaded");
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","root");
			System.out.println("Connection Success");
			
			PreparedStatement pstm=con.prepareStatement("select * from Books where Book_Id=?");
			pstm.setString(1, bkid);
			
			ResultSet rs=pstm.executeQuery();
			System.out.println("Data In Customer Page");
			
			session.setAttribute("rs2",rs);
			
			
//			while(rs.next())
//			{
//				System.out.println(rs.getString("Book_Name"+"|"));
//				System.out.println(rs.getString("Author"+"|"));
//				System.out.println(rs.getInt("Price"+"|"));
//				System.out.println();
//			}
			
			
			resp.sendRedirect("CustomerPage.jsp");
			

	
			
		}catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
				
		
	}

}
