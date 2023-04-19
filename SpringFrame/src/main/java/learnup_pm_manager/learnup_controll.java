package learnup_pm_manager;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		items.addAttribute("item", item);
		
		return "/WEB-INF/learnup/ohyeah.jsp";
		
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String learnup_insert(@ModelAttribute board item) {
		// ModelAttribute 뒤에 getter setter 클래스를 들고옴. ModelAttribute 클래스 객체 순으로 쓰면 됨.
		// input name값과 세터의 이름이 같으면, 알아서 setter를 찾아서 parameter가 들어감.
		// ex)input name="name"은 data.setName()을 input name="title"은 data.setTitle()을 찾아감.
		
		data.insert(item);
		
		return "redirect:/info";
		// redirect: 는 새로고침임.
	}
	@RequestMapping("/delete")
	public String learnup_delete(@RequestParam Integer num) {
		data.delete(num);
		
		return "redirect:/info";
	}
	
	@RequestMapping("/image")
	public String learnup_image() {
		
		return "/imageprint.jsp";
	}
	
}
