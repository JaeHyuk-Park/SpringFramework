package learnup_pm_manager;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Learnup_controller {

	@RequestMapping("/learnup.com")
	// return 됐을 때 해당 경로로 이동하겠다는 뜻.
	public String learnup_controller(){
		
		return "/WEB-INF/learnup/learnupcontroller.jsp";
	}
}
