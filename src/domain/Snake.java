package domain;

public class Snake {
	private String name;//玩家姓名
	private String prevdirection;//蛇上一步的前进方向
	private String direction;//蛇的前进方向
	private String speed = "100";//初始速度
	private String score;//分数
	private String kill;//已杀人数
	private String dt;//定时器
	private String snakehead;//蛇头位置
	private String snakepointx="0";//蛇头x坐标
	private String snakepointy="0";//蛇头y坐标
	private int state = 0;//状态码
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrevdirection() {
		return prevdirection;
	}
	public void setPrevdirection(String prevdirection) {
		this.prevdirection = prevdirection;
	}
	public String getDirection() {
		return direction;
	}
	public void setDirection(String direction) {
		this.direction = direction;
	}
	public String getSpeed() {
		return speed;
	}
	public void setSpeed(String speed) {
		this.speed = speed;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getKill() {
		return kill;
	}
	public void setKill(String kill) {
		this.kill = kill;
	}
	public String getDt() {
		return dt;
	}
	public void setDt(String dt) {
		this.dt = dt;
	}
	public String getSnakehead() {
		return snakehead;
	}
	public void setSnakehead(String snakehead) {
		this.snakehead = snakehead;
	}
	public String getSnakepointx() {
		return snakepointx;
	}
	public void setSnakepointx(String snakepointx) {
		this.snakepointx = snakepointx;
	}
	public String getSnakepointy() {
		return snakepointy;
	}
	public void setSnakepointy(String snakepointy) {
		this.snakepointy = snakepointy;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
}
