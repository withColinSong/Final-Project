package member;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MemberController {
	Dao dao;
	
	 public MemberController() { }
	 public MemberController(Dao dao) {
		 this.dao = dao;
	 }
	 
	 
	 @RequestMapping(value="select.member", method= {RequestMethod.GET, RequestMethod.POST})
	 public ModelAndView select() {
		 ModelAndView mv = new ModelAndView();
		 
		 List<MemberVo> list = dao.test();
		 MemberDao dao2 = new MemberDao();
		 
		 List<UsersJoin> joins = dao2.joins();
		 System.out.println(joins);
		 
		 UsersJoin joins2 = new UsersJoin();
		 for(UsersJoin j : joins) {
			 joins2 = j;
		 }
		 
		 System.out.println(joins2);
		 System.out.println("joins2" + joins2);
		 
		 mv.addObject("join", joins2);
		 mv.addObject("list", list);
		 mv.setViewName("select");
		 return mv;
	 }
	 
	 @RequestMapping(value="select2.member", method= {RequestMethod.GET, RequestMethod.POST})
	 public ModelAndView select(Page page) {
		 
		 ModelAndView mv = new ModelAndView();
		 
		 Map<String, Object> map = dao.select(page);
		 System.out.println(page);
		 
		 
		 return mv;
	 }
	 
}
