package learnup_pm_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import learnup_pm_actionservice.learnDAO;
import learnup_pm_model.board;

@Service
public class Learnup_service {

	@Autowired
	learnDAO data;
	
	public List<board> learnup_dataselect(){
		List<board> item = data.fullselect();
		return item;
	}
	
	public void learnup_datainsert(board item) {
		data.insert(item);
	}
	
	public void learnup_datadelete(Integer num) {
		data.delete(num);
	}
}
