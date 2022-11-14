package com.company.biz;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.jdbc.JDBCConnection;


@WebServlet("/AddClass")
public class AddClass extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/AddClass");
		request.setCharacterEncoding("UTF-8");
		
		String classMonth=request.getParameter("classMonth");
		String no=request.getParameter("no");
		String area=request.getParameter("area");
		int price=Integer.parseInt(request.getParameter("price"));
		
		Connection conn=null;
		PreparedStatement stmt=null;
		
		try {
			conn=JDBCConnection.getConnection();
			String sql="insert into TBL_CLASS_202201(REGIST_MONTH,C_NO,CLASS_AREA,TUITION)\r\n"
					+ "values(?,?,?,?)";
			stmt=conn.prepareStatement(sql);
			stmt.setString(1, classMonth);
			stmt.setString(2, no);
			stmt.setString(3, area);
			stmt.setInt(4, price);
			
			int cnt=stmt.executeUpdate();
			
			if(cnt>0)
				response.sendRedirect("index.jsp?filePath=home");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCConnection.close(stmt, conn);
		}
	}

}
