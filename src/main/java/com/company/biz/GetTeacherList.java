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
import com.company.vo.TeacherVO;


@WebServlet("/GetTeacherList")
public class GetTeacherList extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			conn=JDBCConnection.getConnection();
			String sql="select TEACHER_CODE,TEACHER_NAME,CLASS_NAME,to_char(CLASS_PRICE,'L9,999,999') as CLASS_PRICE,\r\n"
					+ "substr(TEACHER_REGIST_DATE,1,4) || '년' || substr(TEACHER_REGIST_DATE,5,2) || '월' || substr(TEACHER_REGIST_DATE,7,2) || '일'\r\n"
					+ "as TEACHER_REGIST_DATE \r\n"
					+ "from TBL_TEACHER_202201 order by TEACHER_CODE";
			stmt=conn.prepareStatement(sql);
			
			rs=stmt.executeQuery();
			
			ArrayList<TeacherVO> list=new ArrayList<TeacherVO>();
			TeacherVO teacher=null;
			while(rs.next()) {
				teacher=new TeacherVO();
				teacher.setTeacher_code(rs.getString("TEACHER_CODE"));
				teacher.setTeacher_name(rs.getString("TEACHER_NAME"));
				teacher.setClass_name(rs.getString("CLASS_NAME"));
				teacher.setClass_price(rs.getString("CLASS_PRICE"));
				teacher.setTeacher_regist_date(rs.getString("TEACHER_REGIST_DATE"));
				
				list.add(teacher);
			}
			request.setAttribute("list", list);
			
			RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp?filePath=getTeacherList");
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
