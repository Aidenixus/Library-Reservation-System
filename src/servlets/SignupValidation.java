package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/SignupValidation")
public class SignupValidation extends HttpServlet {
	public static final long serialVersionUID = 1;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    Connection conn = null;
	    HttpSession session = request.getSession();
	    Statement st = null;
	    ResultSet rs = null;
	    String userInputName = request.getParameter("username");
	    String userInputPw = request.getParameter("password");
	    String userInputPwConfirmation = request.getParameter("passwordConfirm");
	    boolean isSignedUp = false; 
	    boolean passwordIncorrect = false;
	    try {
	    	Class.forName("com.mysql.jdbc.Driver");
	        conn = DriverManager.getConnection("jdbc:mysql://localhost/roomreservationdatabase?user=root&password=peter971008&useSSL=false");
	        st = conn.createStatement();
	        String query = "select* from user";
	        rs = st.executeQuery(query);
	        ArrayList<String> usernames = new ArrayList<String>();
	        ArrayList<String> passwords = new ArrayList<String>();
	      
	        while (rs.next()) {
	        	String username = rs.getString("username");
	        	String password = rs.getString("password");
	        	
	        	if(username.equals(userInputName))
	        	{
	        			isSignedUp = true;
	        			break;
	        	}
	        	
	        	usernames.add(username);
	        	passwords.add(password);
	        	
	        }
	        if(!isSignedUp) {
	        	if(!userInputPw.equals(userInputPwConfirmation)) {
	        		passwordIncorrect = true;
	        	}
	        	else {
	        		String insertST = "INSERT INTO user (username,password) VALUES (?, ?)";
	        		PreparedStatement ps = conn.prepareStatement(insertST);
	        		session.setAttribute("username", userInputName);
	        		ps.setString(1, userInputName);
	        		ps.setString(2, userInputPw);
	        		ps.executeUpdate();
	        		
	        	}
	        }
	    } catch (SQLException sqle) {
	    	System.out.println (sqle.getMessage());
	    } catch (ClassNotFoundException cnfe) {
	    	System.out.println (cnfe.getMessage());
	    } finally {
	    	try {
	    		if (rs != null) {
	    			rs.close();
	    		}
	    		if (st != null) {
	    			st.close();
	    		}
	    		if (conn != null) {
	    			conn.close();
	    		}
	    	} catch (SQLException sqle) {
	    		System.out.println(sqle.getMessage());
	    	}
	    }  
	    String nextJSP = "";
	    if(isSignedUp || passwordIncorrect) {
	    	nextJSP = "/SignUp.jsp";
	    	if(isSignedUp) {
	    		request.setAttribute("usernameTaken", "This email already has an account associated with it. Please login or try another email.");
	    	}
	    	if(passwordIncorrect) {
	    		request.setAttribute("diffPw", "Password and Password Confirmation must match. Please try again.");
	    	}
	    }
	    else {
	    	nextJSP = "/testEntry";
	    	
	    }
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
		dispatcher.forward(request,response);
	}
}

