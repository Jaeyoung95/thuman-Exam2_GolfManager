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


@WebServlet("/GetMemberList")
public class GetMemberList extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/GetMemberList");
		
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			conn=JDBCConnection.getConnection();
			String sql="select \r\n"
					+ "substr(T.TEACHER_REGIST_DATE,1,4) || '년' || \r\n"
					+ "substr(T.TEACHER_REGIST_DATE,5,2) || '월' || \r\n"
					+ "substr(T.TEACHER_REGIST_DATE,7,2) || '일'\r\n"
					+ "as TEACHER_REGIST_DATE,M.C_NO,M.C_NAME,T.CLASS_NAME,C.CLASS_AREA,to_char(C.TUITION,'L9,999,999') as TUITION,M.GRADE\r\n"
					+ "from TBL_CLASS_202201 C,TBL_MEMBER_202201 M,TBL_TEACHER_202201 T\r\n"
					+ "where C.C_NO=M.C_NO and T.TEACHER_CODE=C.TEACHER_CODE\r\n"
					+ "order by C.C_NO";
			stmt=conn.prepareStatement(sql);
			
			rs=stmt.executeQuery();
			
			ArrayList<MemberVO> list=new ArrayList<MemberVO>();
			MemberVO member=null;
			while(rs.next()) {
				member=new MemberVO();
				member.setTeacher_regist_date(rs.getString(1));
				member.setC_no(rs.getString(2));
				member.setC_name(rs.getString(3));
				member.setClass_name(rs.getString(4));
				member.setClass_area(rs.getString(5));
				member.setTuition(rs.getString(6));
				member.setGrade(rs.getString(7));
				list.add(member);
			}
			
			request.setAttribute("memberList", list);
			RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp?filePath=getMemberList");
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
