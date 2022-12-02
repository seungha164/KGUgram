package dto;
import java.sql.Timestamp;

public class Story {
	private int s_id;				// 스토리 id
	private int good;				// 좋아요
	private int bad;				// 싫어요
	private String content;			// 내용
	private double latitude;		// 경도
	private double longitude;		// 위도
	private String img_name;		// 이미지 파일 번호
	private boolean is_anonymous;	// 익명 여부
	private String writer_id;		// 작성자 ID
	private Timestamp date;			// 작성일자	
	
	public Story() {
		this.good = 0;
		this.bad = 0;
	}
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public String getImg_name() {
		return img_name;
	}
	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}
	public boolean isIs_anonymous() {
		return is_anonymous;
	}
	public void setIs_anonymous(boolean is_anonymous) {
		this.is_anonymous = is_anonymous;
	}
	
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getBad() {
		return bad;
	}
	public void setBad(int bad) {
		this.bad = bad;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public String getWriter_id() {
		return writer_id;
	}
	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}
	
}
