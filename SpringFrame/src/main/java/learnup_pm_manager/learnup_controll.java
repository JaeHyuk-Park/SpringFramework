package learnup_pm_manager;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	@Autowired
	ServletContext context;
	
	//로그인 페이지
	@RequestMapping("/")
	public String login_controll() {
		
		return "/WEB-INF/learnup/loginpage.jsp";
	}
	
	//로그아웃 처리
	@RequestMapping("/logout")
	public String logout_controll() {
		
		return "/WEB-INF/learnup/logout.jsp?error=false";
	}
	
	
	//로그인 체크
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
		// redirect: 는 새로고침임.
	}
	
	// 별 기능 없음. 테스트
	@RequestMapping("/learnup")
	public String learnup_controller() {
		
		return "/WEB-INF/learnup/learnupcontroller.jsp";
	}

	// 데이터 전체 보이게 하는 것
	@RequestMapping("/info")
	public String learnup_view(Model items) {
//		ArrayList<board> item = data.fullselect();
		List<board> item = service.learnup_dataselect();
		items.addAttribute("item", item);

		return "/WEB-INF/learnup/ohyeah.jsp";
	}
	
	// 게시글 작성 페이지로 이동
	@RequestMapping("/ohyeahinsert")
	public String ohyeah_insert(){
		return "/WEB-INF/learnup/ohyeahinsert.jsp";
	}

	// 게시글 작성된 데이터 인설트처리
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String learnup_insert(@ModelAttribute board item, @RequestParam("file") MultipartFile fileitem) {
		// ModelAttribute 뒤에 getter setter 클래스를 들고옴. ModelAttribute 클래스 객체 순으로 쓰면 됨.
		// input name값과 세터의 이름이 같으면, 알아서 setter를 찾아서 parameter가 들어감.
		// ex)input name="name"은 data.setName()을 input name="title"은 data.setTitle()을
		// 찾아감.
		
		String realFolder="";
		String realpath = "/Springitem";
		realFolder = context.getRealPath(realpath);
		System.out.println("폴더 위치 : "+realFolder);
		String originalFileName = fileitem.getOriginalFilename();
		File folder = new File(realFolder);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		if(!originalFileName.isEmpty()) {
		    String saveFileName = UUID.randomUUID().toString() + originalFileName.substring(originalFileName.lastIndexOf("."));
		    item.setSavefile(saveFileName);
		    System.out.println("파일 이름들 "+originalFileName + " /// "+saveFileName);
		    
		    try {
				fileitem.transferTo(new File(folder + "/" + saveFileName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
			
		service.learnup_datainsert(item);
		
		return "redirect:/info";
		// redirect: 는 새로고침임.
	}

	// 게시글 상세페이지로 이동
	@RequestMapping("/ohyeahdetail")
	public String ohyeah_detail(Model items, @RequestParam Integer num){
		board item = service.learnup_datailselect(num);
		items.addAttribute("item", item);
		return "/WEB-INF/learnup/ohyeahdetail.jsp";
	}
	
	
	
	// 게시글 작성된 데이터 딜리트처리
	@RequestMapping("/delete")
	public String learnup_delete(@RequestParam Integer num) {
		service.learnup_datadelete(num);
		System.out.println(num);

		return "redirect:/info";
	}

	// 이미지 확인 테스트 
	@RequestMapping("/image")
	public String learnup_image() {

		return "/imageprint.jsp";
	}

}
