package learnup_pm_actionservice;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import learnup_pm_model.Board;
import learnup_pm_model.logincheck;

@Repository
public class learnDAO {
	@Autowired
	DataSource source;
	@Autowired
	SqlSession sqls;
	

	Connection connect = null;
	Statement exe = null;
	ResultSet iot = null;

	public List<Board> fullselect(int startrow){
		List<Board> item = sqls.selectList("full", startrow);
		//sqls.close();
		return item;
	}
	
	public List<Board> datasearchselect(Board board) {
		List<Board> item = sqls.selectList("searchselect", board);
		return item;
	}
	
	public void insert(Board item) {
		sqls.insert("insert", item);
	}
	
	public void delete(Integer num) {
		sqls.delete("delete", num);
	}

	public logincheck logincheck(logincheck item) {
		logincheck check = sqls.selectOne("logincheck", item);
		return check;
	}

	public Board detail_select(Integer num) {
		Board item = sqls.selectOne("detailselect", num);
		return item;
	}

	public int selectListCount() {
		int listcount = sqls.selectOne("countboard");
		return listcount;
	}

	public int selectsearchListCount(String parameter) {
		int listcount = sqls.selectOne("searchlistboard", parameter);
		return listcount;
	}
	
//	public void databases() {
//		try {
//			Class.forName("com.mysql.jdbc.Driver");   
//			connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/function","root","1324");   
//		}catch(Exception e) {
//			System.out.println(e+"오류입니다.");
//		}
//	}

	
	
	
//	public ArrayList<board> fullselect() {
////		databases();
//
//		ArrayList<board> item = new ArrayList<board>();
//		board data;
//		try {
//			connect = source.getConnection();
//			exe = connect.createStatement();
//			String s = "select*from function.board";
//			iot = exe.executeQuery(s);
//
//			while (iot.next()) {
//				data = new board();
//				data.setNum(iot.getInt("num"));
//				data.setName(iot.getString("name"));
//				data.setTitle(iot.getString("title"));
//				data.setDate(iot.getString("date"));
//
//				item.add(data);
//			}
//		} catch (Exception eo) {
//			// TODO Auto-generated catch block
//			System.out.println(eo + "오류입니다.");
//		} finally {
//			try {
//				connect.close();
//				exe.close();
//				iot.close();
//			} catch (Exception eod) {
//				System.out.println(eod + "오류입니다.");
//			}
//		}
//
//		return item;
//	}

	
	
//	public void insert(board item) {
////		databases();
//		try {
//			connect = source.getConnection();
//			exe = connect.createStatement();
//			String s = "insert into function.board(name, title) values('" + item.getName() + "', '" + item.getTitle()
//					+ "')";
//			exe.executeUpdate(s);
//		} catch (Exception e) {
//			System.out.println(e + "오류입니다.");
//		} finally {
//			try {
//				connect.close();
//				exe.close();
//			} catch (Exception eo) {
//				System.out.println(eo + "오류입니다.");
//			}
//		}
//	}

	
//	public void delete(Integer num) {
//		// TODO Auto-generated method stub
////		databases();
//		try {
//			connect = source.getConnection();
//			exe = connect.createStatement();
//			String s = "delete from function.board where num=" + num + "";
//			exe.executeUpdate(s);
//		} catch (Exception e) {
//			System.out.println(e + "오류입니다.");
//		} finally {
//			try {
//				connect.close();
//				exe.close();
//			} catch (Exception eo) {
//				System.out.println(eo + "오류입니다.");
//			}
//		}
//	}

}
