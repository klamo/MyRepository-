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
		
		
		
		
	}
}
