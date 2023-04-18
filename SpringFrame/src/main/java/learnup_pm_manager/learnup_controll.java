package learnup_pm_manager;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import learnup_pm_actionservice.learnDAO;
import learnup_pm_model.board;

@Controller
public class learnup_controll {
	
	@Autowired
	learnDAO data;
	
	@RequestMapping("/learnup")
	public String learnup_controller(@RequestParam String a){
		System.out.println(a);
		return "/WEB-INF/learnup/learnupcontroller.jsp";
	}
	
	@RequestMapping("/info")
	public String learnup_view(Model items) {
		ArrayList<board> item = data.fullselect();
		
		return "/WEB-INF/learnup/ohyeah.jsp";
		
	}
	
}
