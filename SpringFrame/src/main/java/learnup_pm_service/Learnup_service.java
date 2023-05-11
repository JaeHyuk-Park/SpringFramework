package learnup_pm_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import learnup_pm_actionservice.learnDAO;
import learnup_pm_model.Board;
import learnup_pm_model.logincheck;

@Service
public class Learnup_service {

	@Autowired
	learnDAO data;
	
	public List<Board> learnup_dataselect(int startrow){
		List<Board> item = data.fullselect(startrow);
		return item;
	}
	
	public List<Board> datasearchselect(Board board) {
		List<Board> item = data.datasearchselect(board);
		return item;
	}
	
	public void learnup_datainsert(Board item) {
		data.insert(item);
	}
	
	public void learnup_datadelete(Integer num) {
		data.delete(num);
	}

	public logincheck login_check(logincheck item) {
		logincheck check = data.logincheck(item);
		return check;
		
	}

	public Board learnup_datailselect(Integer num) {
		Board item = data.detail_select(num);
		return item;
	}

	public int getListCount() {
		int listCount = data.selectListCount();
		return listCount;
	}

	public int getsearchListCount(String parameter) {
		int listCount = data.selectsearchListCount(parameter);
		return listCount;
	}

	
}
