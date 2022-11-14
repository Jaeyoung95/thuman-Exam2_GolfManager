package com.company.biz;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.jdbc.JDBCConnection;
import com.company.vo.MemberVO;
import com.company.vo.TeacherPriceVO;


@WebServlet("/GetTeacherPrices")
public class GetTeacherPrices extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/GetTeacherPrices");
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			conn=JDBCConnection.getConnection();
			String sql="select T.TEACHER_CODE,T.CLASS_NAME,T.TEACHER_NAME,\r\n"
					+ "to_char(sum(C.TUITION),'L9,999,999') as SUM_PRICE\r\n"
					+ "from TBL_TEACHER_202201 T,TBL_CLASS_202201 C\r\n"
					+ "where T.TEACHER_CODE=C.TEACHER_CODE\r\n"
					+ "group by T.TEACHER_CODE,T.CLASS_NAME,T.TEACHER_NAME\r\n"
					+ "order by T.TEACHER_CODE";
			stmt=conn.prepareStatement(sql);
			
			rs=stmt.executeQuery();
			ArrayList<TeacherPriceVO> list=new ArrayList<TeacherPriceVO>();
			TeacherPriceVO vo=null;
			while(rs.next()) {
				vo=new TeacherPriceVO();
				vo.setTeacher_code(rs.getString(1));
				vo.setClass_name(rs.getString(2));
				vo.setTeacher_name(rs.getString(3));
				vo.setSum_price(rs.getString(4));
				list.add(vo);
			}
			request.setAttribute("priceList", list);
			RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp?filePath=getTeacherPrices");
			dispatcher.forward(request, response);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCConnection.close(rs, stmt, conn);
		}
		
	}

	

}
