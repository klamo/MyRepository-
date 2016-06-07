package action;

import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

public class loginAction {
	public void login(){
		System.out.println("login");
		//创建一个map集合，存放玩家的信息
		Map<String,Object> map = new HashMap<String,Object>();
		//登录后获取玩家姓名
		String id = ServletActionContext.getRequest().getParameter("name");
		//登录后获取玩家姓名
		String id2 = ServletActionContext.getRequest().getParameter("name");
		//登录后获取玩家姓名
		String id3 = ServletActionContext.getRequest().getParameter("name");
		String id4 = ServletActionContext.getRequest().getParameter("name");
		String id5 = ServletActionContext.getRequest().getParameter("name");
		String id6 = ServletActionContext.getRequest().getParameter("name");
		String id7 = ServletActionContext.getRequest().getParameter("name");
		String id8 = ServletActionContext.getRequest().getParameter("name");
		String id9 = ServletActionContext.getRequest().getParameter("name");
		String id10 = ServletActionContext.getRequest().getParameter("name");
		String id11 = ServletActionContext.getRequest().getParameter("name");
		String id12 = ServletActionContext.getRequest().getParameter("name");
		String id13 = ServletActionContext.getRequest().getParameter("name");
		String id14 = ServletActionContext.getRequest().getParameter("name");
		
		
		
		
	}
}
