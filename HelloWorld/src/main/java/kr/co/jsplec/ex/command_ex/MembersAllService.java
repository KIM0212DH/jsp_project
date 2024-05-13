package kr.co.jsplec.ex.command_ex;

import java.util.ArrayList;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MembersAllService implements Service{
	
	@Override
	public ArrayList<MemberDTO> execute(HttpServletRequest request, HttpServletResponse response){
		MemberDAO mDao = new MemberDAO();
		ArrayList<MemberDTO> mList = mDao.showUsersInfo();
		
		return mList;
		
	}

}
