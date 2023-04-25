package learnup_pm_manager;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import learnup_pm_actionservice.learnDAO;
import learnup_pm_model.board;
import learnup_pm_model.logincheck;
import learnup_pm_service.Learnup_service;

@Controller
public class learnup_controll {

	@Autowired
	learnDAO data;
	@Autowired
	Learnup_service service;

	@RequestMapping("/")
	public String login_controll() {
		
		return "/WEB-INF/learnup/loginpage.jsp";
	}
	
	@RequestMapping("/logout")
	public String logout_controll() {
		
		return "/WEB-INF/learnup/logout.jsp?error=false";
	}
	
	@RequestMapping(value = "/logincheck", method = RequestMethod.POST)
	public String login_check(@ModelAttribute logincheck item, HttpSession session, @RequestParam("password") String pass, @RequestParam("email") String email, Model model) {
		logincheck check = service.login_check(item);
		if(check == null) {
			return "/WEB-INF/learnup/loginpage.jsp?error=email";
		}
		if(!check.getPassword().equals(pass)) {
			return "/WEB-INF/learnup/loginpage.jsp?error=password";
		}
		session.setAttribute("nickname", check.getNickname());

		return "redirect:/info";
		// redirect: �� ���ΰ�ħ��.
	}
	
	@RequestMapping("/learnup")
	public String learnup_controller() {
		
		return "/WEB-INF/learnup/learnupcontroller.jsp";
	}

	@RequestMapping("/info")
	public String learnup_view(Model items) {
//		ArrayList<board> item = data.fullselect();
		List<board> item = service.learnup_dataselect();
		items.addAttribute("item", item);

		return "/WEB-INF/learnup/ohyeah.jsp";
	}
	
	@RequestMapping("/ohyeahinsert")
	public String ohyeah_insert(){
		return "/WEB-INF/learnup/ohyeahinsert.jsp";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String learnup_insert(@ModelAttribute board item) {
		// ModelAttribute �ڿ� getter setter Ŭ������ ����. ModelAttribute Ŭ���� ��ü ������ ���� ��.
		// input name���� ������ �̸��� ������, �˾Ƽ� setter�� ã�Ƽ� parameter�� ��.
		// ex)input name="name"�� data.setName()�� input name="title"�� data.setTitle()��
		// ã�ư�.

		service.learnup_datainsert(item);

		return "redirect:/info";
		// redirect: �� ���ΰ�ħ��.
	}

	@RequestMapping("/delete")
	public String learnup_delete(@RequestParam Integer num) {
		service.learnup_datadelete(num);

		return "redirect:/info";
	}

	@RequestMapping("/image")
	public String learnup_image() {

		return "/imageprint.jsp";
	}

}
