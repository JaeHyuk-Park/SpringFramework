package learnup_pm_service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import learnup_pm_actionservice.learnDAO;
import learnup_pm_model.board;

@Service
public class Learnup_service {

	@Autowired
	learnDAO data;
	
	public ArrayList<board> learnup_dataselect(){
		ArrayList<board> item = data.fullselect();
		return item;
	}
	
	public void learnup_datainsert(board item) {
		data.insert(item);
	}
	
	public void learnup_datadelete(Integer num) {
		data.delete(num);
	}
}
