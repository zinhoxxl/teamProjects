 package bbs;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BbsDAO {
	  private Connection conn;
	    private ResultSet rs;

	    // 생성자 하나의 객체를 만들었을때 자동으로 Connection이 되도록
	    //연결
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
	    // 시간 가져오는 메소드
		public 	Date getDate() {
			String SQL ="select sysdate from dual";
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					return rs.getDate(1);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
		return null;
		}
	
		
//	     public Date getDate() {
//		 String SQL ="SELECT to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS') today FROM dual;";
//			try {
//				PreparedStatement pstmt = conn.prepareStatement(SQL);
//				rs = pstmt.executeQuery();
//				if(rs.next()) {
//					return rs.getDate(1);
//				}
//			}catch (Exception e) {
//				e.printStackTrace();
//			}
//		return null;
//		}

		//다음 게시글 번호: 마지막에 작성 게시글 번호 +1
		public int getNext() {
			String SQL ="SELECT bbsID FROM BBS ORDER BY bbsID DESC";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					return rs.getInt(1)+1;
				}
				return 1; //첫 번째 게시물인 경우
			}catch (Exception e) {
				e.printStackTrace();
			}
			return -1;//데이터베이스 오류
		}
		    //글 작성 하는 메소드 
			public int write(String bbsTitle, String userID, String bbsContent) {
				String SQL ="INSERT INTO BBS VALUES (?, ?, ?, ?, ?, ?)";
				try {
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					pstmt.setInt(1,  getNext());
					pstmt.setString(2,  bbsTitle);
					pstmt.setString(3,  userID);
					pstmt.setDate(4,  getDate());
					pstmt.setString(5,  bbsContent);
					pstmt.setInt(6,  1); //현재 글이 삭제되었는지
					return pstmt.executeUpdate(); //성공적으로 수행 -> 0이상 값 return
					
				}catch (Exception e) {
					e.printStackTrace();
				}
				return -1;//데이터베이스 오류
			}
	}