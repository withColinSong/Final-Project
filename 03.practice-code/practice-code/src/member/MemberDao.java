package member;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import bean.MemberFactory;

public class MemberDao implements Dao{
	SqlSession sqlSession;
	
	public MemberDao() { 
		sqlSession = MemberFactory.getFactory().openSession();
	} 
	
	public MemberDao(MemberFactory factory) {
		sqlSession = factory.getFactory().openSession();
	}
	
	
	public List<UsersJoin> joins() {
		List<UsersJoin> list = sqlSession.selectList("member.joins");
		System.out.println(list);
		return list;
	}
	
	public String song() {
		String smith = sqlSession.selectOne("member.song", "SMITH");
		System.out.println(smith);
		
		
		return smith;
	}
	
	
	
	@Override
	public List<MemberVo> test() {
		
		List<MemberVo> list = sqlSession.selectList("member.pra", "oh");
		System.out.println(list);
		
		
		return list;
	}
	
	@Override
	public boolean login(String mid, String pwd) {
		
		return false;
		
	}

	@Override
	public int getTotListSize(String findStr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Map<String, Object> select(Page page) {
		
		Map<String, Object> map = new HashMap<>();
		
		
		if(page == null) {
			page = new Page();
			page.setNowPage(1);
		}else if (page.getNowPage() < 1) {
			page.setNowPage(1);
			
		}
		
		page.setFindStr("song");
		System.out.println(page.getFindStr());
		System.out.println(page.getNowPage());
		System.out.println(page);
		
		int cnt = sqlSession.selectOne("member.tot_list_size", page.getFindStr());
		
		return map;
	}

	@Override
	public String insert(MemberVo vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String update(MemberVo vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String delete(MemberVo vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVo view(String mid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> select() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
