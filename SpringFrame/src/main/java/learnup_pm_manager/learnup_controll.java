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
		// ModelAttribute �ڿ� getter setter Ŭ������ ����. ModelAttribute Ŭ���� ��ü ������ ���� ��.
		// input name���� ������ �̸��� ������, �˾Ƽ� setter�� ã�Ƽ� parameter�� ��.
		// ex)input name="name"�� data.setName()�� input name="title"�� data.setTitle()�� ã�ư�.
		
		data.insert(item);
		
		return "redirect:/info";
		// redirect: �� ���ΰ�ħ��.
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
