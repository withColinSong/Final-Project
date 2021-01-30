package member;

import java.util.List;
import java.util.Map;

public interface Dao {
	public boolean login(String mid, String pwd);
	public int getTotListSize(String findStr);
	public Map<String, Object> select();
	public String insert(MemberVo vo);
	public String update(MemberVo vo);
	public String delete(MemberVo vo);
	public MemberVo view(String mid);
	public List<MemberVo> test();
	Map<String, Object> select(Page page);
}
