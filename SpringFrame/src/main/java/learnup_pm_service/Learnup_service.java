package learnup_pm_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import learnup_pm_actionservice.learnDAO;
import learnup_pm_model.board;
import learnup_pm_model.logincheck;

@Service
public class Learnup_service {

	@Autowired
	learnDAO data;
	
	public List<board> learnup_dataselect(int startrow){
		List<board> item = data.fullselect(startrow);
		return item;
	}
	
	public void learnup_datainsert(board item) {
		data.insert(item);
	}
	
	public void learnup_datadelete(Integer num) {
		data.delete(num);
	}

	public logincheck login_check(logincheck item) {
		logincheck check = data.logincheck(item);
		return check;
		
	}

	public board learnup_datailselect(Integer num) {
		board item = data.detail_select(num);
		return item;
	}

	public int getListCount() {
		int listCount = data.selectListCount();
		return listCount;
	}
}
