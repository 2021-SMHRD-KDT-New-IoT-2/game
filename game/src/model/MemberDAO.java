package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.MemberVO;

public class MemberDAO {
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	int cnt = 0;
	MemberVO vo = null;
	ArrayList<MemberVO> al = null;
	boolean check = false;

	public void connection() {

		try {
			
			Class.forName("project-db-stu.ddns.net");

			String url = "jdbc:oracle:thin:@localhost:1524:xe";
			String user = "campus_b_3_1025";
			String password = "smhrd3";

			conn = DriverManager.getConnection(url, user, password);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("연결실패");
		}
	}

	public void close() {

		try {
			if (rs != null) {
				rs.close();
			}
			if (pst != null) {
				pst.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int Join(String id, String pw, String nick) {

		try {
			connection();

			String sql = "insert into web_member values (?,?)";

			pst = conn.prepareStatement(sql);

			pst.setString(1, id);
			pst.setString(2, pw);

			cnt = pst.executeUpdate();

		} catch (Exception e) {
			System.out.println("가입실패");
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public MemberVO login(String id, String pw, String nick) {

		try {
			connection();

			String sql = "select id, pw from web_member where id = ? and pw = ?";

			pst = conn.prepareStatement(sql);

			pst.setString(1, id);
			pst.setString(2, pw);

			rs = pst.executeQuery(); 

			if (rs.next()) {
				System.out.println("로그인성공!");

				String get_id = rs.getString("id");
				String get_pw = rs.getString("pw");
				String get_nick = rs.getString("nick");

				vo = new MemberVO(get_id, get_pw, get_nick);

			} else {
				System.out.println("로그인실패!");
			}
		} catch (Exception e) {
			System.out.println("로그인실패!");
			e.printStackTrace();
		} finally {
			close();
		}
		return vo;
	}

	public int update(String id, String pw, String nick) {

		try {
			connection();

			String sql = "update web_member where id=?";

			pst = conn.prepareStatement(sql);

			pst.setString(1, id);
			pst.setString(2, pw);

			cnt = pst.executeUpdate();

		} catch (Exception e) {
			System.out.println("수정실패");
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public ArrayList<MemberVO> selectAll() {

		al = new ArrayList<MemberVO>();

		try {
			connection();

			String sql = "select id, pw from web_member";

			pst = conn.prepareStatement(sql);

			rs = pst.executeQuery();

			while (rs.next()) {

				String get_id = rs.getString("id");
				String get_pw = rs.getString("pw");
				String get_nick = rs.getString("nick");

				vo = new MemberVO(get_id, get_pw, get_nick);

				al.add(vo);
			}

		} catch (Exception e) {
			System.out.println("조회실패!");
			e.printStackTrace();
		} finally {
			close();
		}
		return al;
	}

	public int delete(String id) {

		try {
			connection();

			String sql = "delete from web_member where id=?";

			pst = conn.prepareStatement(sql);

			pst.setString(1, id);

			cnt = pst.executeUpdate();

		} catch (Exception e) {
			System.out.println("삭제실패!");
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public boolean idCheck(String id) {

		try {
			connection();

			String sql = "select id from web_member where id = ?";
			
			pst = conn.prepareStatement(sql);
			
			pst.setString(1, id);
			
			rs = pst.executeQuery();
			
			if (rs.next()) {
				check = true;
			} else {
				check = false;
			}
		} catch (Exception e) {
			System.out.println("로그인실패!");
			e.printStackTrace();
		} finally {
			close();
		}
		return check;
	}
}