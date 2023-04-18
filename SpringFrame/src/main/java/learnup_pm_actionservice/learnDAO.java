package learnup_pm_actionservice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import learnup_pm_model.board;

@Repository
public class learnDAO {
	Connection connect = null;
	Statement exe = null;
	ResultSet iot = null;
	
	public void databases() {
		try {
			Class.forName("com.mysql.jdbc.Driver");   
			connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/function","root","1324");   
		}catch(Exception e) {
			System.out.println(e+"오류입니다.");
		}
	}
	
	public ArrayList<board> fullselect(){
		databases();
		ArrayList<board> item = new ArrayList<board>();
		board data;
		try {
			exe = connect.createStatement();
			String s = "select*from function.board";
			iot = exe.executeQuery(s);
			
			while(iot.next()) {
				data = new board();
				data.setNum(iot.getInt("num"));
				data.setName(iot.getString("name"));
				data.setTitle(iot.getString("title"));
				data.setDate(iot.getString("date"));
				
				item.add(data);
			}
		} catch (Exception eo) {
			// TODO Auto-generated catch block
			System.out.println(eo+"오류입니다.");
		}finally {
			try {
				connect.close();
				exe.close();
				iot.close();
			}catch(Exception eod) {
				System.out.println(eod+"오류입니다.");
			}
		}

		return item; 
	}

	
}
