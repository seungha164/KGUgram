package dao;
import dto.User;
import java.sql.*;


public class UserRepository {	// UserDAO
	private Connection conn;//데이터베이스에 접근하게 해주는 하나의 객체
	private PreparedStatement pstmt;//
	private ResultSet rs;//정보를 담을 수 있는 객체
	
	// 생성자 - mysql에 접속 + DB connection
	public UserRepository() {
		String dbURL = "jdbc:mysql://localhost:3306/kgugram";
		String dbID="root";
		String dbPasseord="asd13579asd";
		try {
			// mySql 드라이버 찾기
			Class.forName("com.mysql.jdbc.Driver");
			// 매개체 연결
			conn = DriverManager.getConnection(dbURL,dbID,dbPasseord);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	// login 함수
	public String login(String userID, String userPW) {
		String SQL="SELECT nickname FROM USER WHERE u_id = ? and pw = ?";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			pstmt.setString(2,userPW);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {	
				return rs.getString(1);		// 로그인 성공
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;			// 로그인 실패
	}
	public String getMyNickName(String myID) {
		String SQL="select nickname from user where u_id=?";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,myID);
			rs=pstmt.executeQuery();
			if(rs.next()) {	
				return rs.getString(1);		// 아이디 가져오기
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	// register 함수
	public void register(String userID, String userPW, String userDEPART, String userNICKNAME) {
		String SQL="insert into user values(?,?,?,?)";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			pstmt.setString(2,userPW);
			pstmt.setString(3,userDEPART);
			pstmt.setString(4,userNICKNAME);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
