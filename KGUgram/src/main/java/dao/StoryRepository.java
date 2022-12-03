package dao;
import dto.Story;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class StoryRepository {	// UserDAO
	private Connection conn;//데이터베이스에 접근하게 해주는 하나의 객체
	private PreparedStatement pstmt;//
	private ResultSet rs;//정보를 담을 수 있는 객체
	
	// 생성자 - mysql에 접속 + DB connection
	public StoryRepository() {
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
	
	
	// 글쓰기 메소드
	public int write(Map<String,Object> params) {
		String sql = "insert into story (s_id,content,latitude,longitude, img_name, is_anonymous,writer_id) values (null, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, (String) params.get("content"));
			pstmt.setDouble(2, Double.valueOf((String) params.get("latitude")));
			pstmt.setDouble(3, Double.valueOf((String) params.get("longitude")));
			pstmt.setString(4, String.valueOf(params.get("img_name")));
			pstmt.setBoolean(5, Boolean.valueOf((String) params.get("is_anonymous")));
			pstmt.setString(6, (String) params.get("writer_id"));
			pstmt.executeLargeUpdate();
			return 1;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	// 나의 리스트 가져오기
		public Story getStory(String s_id){
			String sql = "select * from story where s_id=? ORDER BY s_id DESC";

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, s_id);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					Story story = new Story();
					story.setS_id(rs.getInt(1));
					story.setContent(rs.getString(2));
					story.setLatitude(rs.getDouble(3));
					story.setLongitude(rs.getDouble(4));
					story.setImg_name(rs.getString(5));
					story.setIs_anonymous(rs.getBoolean(6));
					story.setWriter_id(rs.getString(7));
					story.setDate(rs.getTimestamp(8));
				
					return story;	
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return null;
		}
	// 나의 리스트 가져오기
	public List<Story> getMyList(String myID){
		String sql = "select * from story where writer_id=? ORDER BY s_id DESC";
		ArrayList<Story> llist = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, myID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Story story = new Story();
				story.setS_id(rs.getInt(1));
				story.setContent(rs.getString(2));
				story.setLatitude(rs.getDouble(3));
				story.setLongitude(rs.getDouble(4));
				story.setImg_name(rs.getString(5));
				story.setIs_anonymous(rs.getBoolean(6));
				story.setWriter_id(rs.getString(7));
				story.setDate(rs.getTimestamp(8));
			
				llist.add(story);			
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return llist;
	}
	// 해당 스토리 삭제
	public int deleteStory(String s_id) {
		String sql = "delete from story where s_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s_id);
			pstmt.executeUpdate();		
			return 1;
	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	// 해당 스토리 업데이트
		public int updateStory(Map<String,Object> params) {
			String sql = "update story set content=?,is_anonymous=?,latitude=?,longitude=? where s_id=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, (String) params.get("content"));
				pstmt.setBoolean(2, Boolean.valueOf((String) params.get("is_anonymous")));
				pstmt.setDouble(3, Double.valueOf((String) params.get("latitude")));
				pstmt.setDouble(4, Double.valueOf((String) params.get("longitude")));
				pstmt.setString(5, (String) params.get("s_id"));
				pstmt.executeUpdate();	
				return 1;
			}catch(Exception e) {
				e.printStackTrace();
			}
			return -1;
		}

	// 모든 리스트 가져오기
	public List<Story> getList(){
		String sql = "select * from story  ORDER BY s_id DESC";
		ArrayList<Story> llist = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Story story = new Story();
				story.setS_id(rs.getInt(1));
				story.setContent(rs.getString(2));
				story.setLatitude(rs.getDouble(3));
				story.setLongitude(rs.getDouble(4));
				story.setImg_name(rs.getString(5));
				story.setIs_anonymous(rs.getBoolean(6));
				story.setWriter_id(rs.getString(7));
				story.setDate(rs.getTimestamp(8));
			
				llist.add(story);			
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return llist;
	}
}
