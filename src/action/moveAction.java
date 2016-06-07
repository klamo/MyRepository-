package action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import domain.Snake;

public class moveAction extends ActionSupport implements ModelDriven<Snake>{
	private Snake snake;
	@Override
	public Snake getModel() {
		return snake;
	}
	public String move(){
		System.out.println(snake.getSnakehead());
		
		
		return null;
	}
	
	
	
}
