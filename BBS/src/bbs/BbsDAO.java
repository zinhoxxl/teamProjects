 package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BbsDAO {
	  private Connection conn;
	    private ResultSet rs;

	    // 생성자 하나의 객체를 만들었을때 자동으로 Connection이 되도록
	    public BbsDAO() {
	        try {
	            String dbURL = "jdbc:oracle:thin:@db202110231136_high?TNS_ADMIN=/Users/alpha/oracle/Wallet_DB202110231136";
	            String dbID = "BBS";
	            String dbPassword = "Oracle12345678";
	            Class.forName("oracle.jdbc.OracleDriver"); //mysql에 접속할 수 있도록 매개체 역할을 하는 라이브러리
	            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    public String getDate() {
	    	String SQL = "SELECT NOW()";
	    	try {
	    		PreparedStatement pstmt = conn.prepareStatement(SQL);
	    		rs=pstmt.executeQuery();
	    		if(rs.next()) {
	    			return rs.getString(1);
	    		}
	    	}catch (Exception e) {
	    		e.printStackTrace();
	    	}
 	    	return ""; //데이터베이스 오류
	    }
	    public int getNext() {
	    	String SQL = "SELECT bbsID FROM BBS ODER BY bbsID DESC";
	    	try {
	    		PreparedStatement pstmt = conn.prepareStatement(SQL);
	    		rs=pstmt.executeQuery();
	    		if(rs.next()) {
	    			return rs.getInt(1) +1;
	    		}
	    		return 1; //첫번째 게시물 인 경우
	    	}catch (Exception e) {
	    		e.printStackTrace();
	    	}
 	    	return -1 ; //데이터베이스 오류
	    }
	    public int write (String bbsTitle, String userID, String bbsContent) {
	    	String SQL = "INSERT INTO BBS VALUE (?, ?, ?, ?, ?, ?) ";
	    	try {
	    		PreparedStatement pstmt = conn.prepareStatement(SQL);
	    		pstmt.setInt(1, getNext());
	    		pstmt.setString(2, bbsTitle);
	    		pstmt.setString(3, userID);
	    		pstmt.setString(4, getDate());
	    		pstmt.setString(5, bbsContent);
	    		pstmt.setInt(6, 1);
	    		return pstmt.executeUpdate();
	    	}catch (Exception e) {
	    		e.printStackTrace();
	    	}
 	    	return -1 ; //데이터베이스 오류
	    }
}
