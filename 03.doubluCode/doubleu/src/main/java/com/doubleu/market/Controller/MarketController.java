package com.doubleu.market.Controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.market.mybatis.MarketDao;
import com.doubleu.market.vo.MarketAttVo;
import com.doubleu.market.vo.MarketPage;
import com.doubleu.market.vo.MarketVo;


@RestController
public class MarketController {

	@Autowired
	MarketDao dao; 
	
	@Autowired
	MarketUploadController fu;
	
	//select결과화면->index
	@RequestMapping(value="/marketSelect" , method= {RequestMethod.GET , RequestMethod.POST})
	public ModelAndView marketSelect(HttpServletRequest req, MarketPage page) {
		ModelAndView mv = new ModelAndView();
		
		String findStr = "";
		String findType = "";
		String dibUser = "";
		String msg = "";
		
		if(page ==null || page.getNowPage()==0) {
			page.setNowPage(1);
		}
		if(req.getParameter("findStr") != null) {
			findStr = req.getParameter("findStr");
		}
		if(req.getParameter("findType") != null) {
			findType = req.getParameter("findType");
		}
		
		
		System.out.println("findStr :" + findStr);
		System.out.println("findType :" + findType);
		page.setFindType(findType);
		page.setFindStr(findStr);	
		page.setMarketWriter(dibUser);
		
		
		int cnt = dao.selectCount(page);
		if (cnt == 0) {
			 msg = "검색결과 없음";
		}
		
		Map<String, Object> map = dao.select(page);
		mv.addObject("dibUser", dibUser);

		mv.addObject("list", map.get("list"));
		mv.addObject("page", map.get("page"));
		mv.addObject("cnt", cnt);
		mv.addObject("msg", msg);
		mv.setViewName("market/market_index");
		
		return mv;
	}
	
	//insert결과화면->index
	@RequestMapping(value="/marketInsertR", method= {RequestMethod.GET , RequestMethod.POST})
	public ModelAndView marketInsertR(HttpServletRequest req,@RequestParam("attList") List<MultipartFile> mul, 
								@ModelAttribute MarketVo vo, @ModelAttribute MarketPage page) {
		ModelAndView mv = new ModelAndView();
		String msg = "";
		List<MarketAttVo> attList = fu.upload(mul);
		
		vo.setAttlist(attList);
		System.out.println("attList: " + vo.getAttlist());
		System.out.println("marketInsertR.....");
		vo.setMarketPrice(vo.getMarketPrice().replaceAll("\\,",""));
		//System.out.println("가격 : " +vo.getMarketPrice());
		msg = dao.insert(vo);
		System.out.println(msg);

		if(page ==null || page.getNowPage()==0) {
			page.setNowPage(1);
		}
		
		Map<String, Object> map = dao.select(page);

		int cnt = dao.totalCount();
		
		String dibUser = req.getParameter("dibUser");
		System.out.println("insertDibuser:" + dibUser);
		mv.addObject("dibUser", dibUser);
		mv.addObject("list", map.get("list"));
		mv.addObject("page", map.get("page"));
		mv.addObject("cnt", cnt);
		mv.setViewName("redirect:/marketIndex");
		return mv;
	}
	
	@RequestMapping(value="/marketUpdateR" , method= {RequestMethod.POST})
	public ModelAndView marketUpdateR(@RequestParam("attList") List<MultipartFile> mul, 
								@ModelAttribute MarketVo vo, @ModelAttribute MarketPage page,
								HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		List<MarketAttVo> attList = fu.upload(mul);
		String dibUser = "";
		dibUser = req.getParameter("dibUser");
		
		vo.setAttlist(attList);
		System.out.println("vo: "+vo);
		String msg = dao.update(vo);
		System.out.println(msg);
		mv.addObject("dibUser", dibUser);
		mv.addObject("msg", msg);
		mv.addObject("page", page);
		mv.setViewName("redirect:/marketIndex");
		return mv;
	}
	
	@RequestMapping(value="/marketDelete" , method=  {RequestMethod.GET , RequestMethod.POST})
	public ModelAndView deleteR(HttpServletRequest req, MarketVo vo, MarketPage page) {
		ModelAndView mv = new ModelAndView();
		String dibUser = "";
		dibUser = req.getParameter("dibUser");
		
		System.out.println("delete controller...");
		String msg = dao.delete(vo);
		System.out.println(msg);
		
		mv.addObject("dibUser", dibUser);
		mv.addObject("msg", msg);
		mv.addObject("page", page);
		mv.setViewName("redirect:/marketIndex");
		return mv;
	}
	
	@RequestMapping(value="/marketSelectMine" , method= {RequestMethod.GET , RequestMethod.POST})
	public ModelAndView marketSelectMine(HttpServletRequest req, MarketPage page) {
		ModelAndView mv = new ModelAndView();
		
		String msg = "";
		
		if(page ==null || page.getNowPage()==0) {
			page.setNowPage(1);
		}
		
		
		
		String dibUser = req.getParameter("dibUser");
		page.setMarketWriter(dibUser);
		Map<String, Object> map = dao.selectMine(page);
		
		int cnt = dao.selectMineCnt(page);
		if (cnt == 0) {
			 msg = "작성한 글 없음";
		}
		
		mv.addObject("dibUser", dibUser);

		mv.addObject("list", map.get("list"));
		mv.addObject("page", map.get("page"));
		mv.addObject("cnt", cnt);
		mv.addObject("msg", msg);
		mv.setViewName("market/market_index");
		
		return mv;
	}
	
	
}
