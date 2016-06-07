<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>JS贪吃蛇</title>
        <style>
            .box {
                position:absolute;
                background:#C4E7FB;
                border:1px solid #C4E7FB;
            }
 
            .snake {
                position:absolute;
                background:green;
                border:1px solid white;
            }
 
            .food {
                position:absolute;
                background:yellow;
                border:1px solid white;
            }
 
            #test {
                position:relative;
            }
        </style>
    </head>
    <body>
        <h1>JS贪吃蛇</h1>
        地图行数：<input type="text" name="row" value="15" />
        地图列数：<input type="text" name="col" value="30" />
        难度：<select name="hard" onchange="speed = parseInt(this.value);">
            <option value="1000">简单</option>    
            <option value="800">中等</option> 
            <option value="100">困难</option> 
        </select>
 
        <input type="button" value="开始" onclick="starts()" />&nbsp;&nbsp;<input type="button" value="暂停" onclick="pause(this)" />&nbsp;&nbsp;<input type="button" value="重新开始" onclick="location.reload()" />&nbsp;&nbsp;<span>您的分数：</span> <span id="score" style="color:red;">0</span> <span>分</span>
        <div id="test">
        </div>
        <script>
            var snake=new Array();//那条蛇
            var rows//行数
            var cols//列数
            var boxwidth=10;//一个div的宽度
            var boxheight=10;//一个div的高度
            var map=new Array();//地图数组:
            var prevdirection;//蛇上一步的前进方向
            var direction=0;//蛇的前进方向
            var speed=parseInt(document.getElementsByName('hard')[0].value);//初始速度
            var score=document.getElementById('score');//分数
            var dt;//定时器
            var snakehead;//蛇头
            var snakepointx=0;//蛇头x坐标
            var snakepointy=0;//蛇头y坐标
            var foodpointx=0;//食物x坐标
            var foodpointy=0;//食物y坐标
            var state=0;//状态码
 
            function getbox(){//生成地图、蛇头、食物
            	alert("2");
                map[snakepointx][snakepointy]=1;//1代表蛇头——map数组拿到上面的蛇头xy参数后，将map[x][y]=1，1代表此单元格为蛇头位置
                map[foodpointx][foodpointy]=2;//2代表食物——map数组拿到上面的食物mn参数后，将map[m][n]=2,2就代表此单无格为食物位置
                for(var i=0; i<rows; i++){//生成行
                    for(var j=0; j<cols; j++){//生成列
                        var div=document.createElement('div');//创建一个div
                        if(map[i][j] == 1){//如果这个map数组的值为1，则此单元格为蛇头
                            snake[0]=i*cols+j;//将蛇头的位置写入蛇数组第一个元素
                            div.className="snake";//设置此div的className属性，值为snake
                        }else if(map[i][j] == 2){//如果这个map数组的值为2，则此单元格为食物
                            div.className="food";//设置此div的className属性，值为food
                        }else{
                            div.className="box";//如果既不是蛇头也不是食物，则为空白地带
                        }
                        div.id=i*cols+j;//设置此div的id
                        div.style.width=boxwidth;//div的宽
                        div.style.height=boxheight;//div的高
                        div.style.top=50+boxheight*i;//div的y位置
                        div.style.left=50+boxwidth*j;//div的x位置
                        document.getElementById('test').appendChild(div);//向桌布上添加这个div
                    }
                }
            }
 
            window.document.onkeydown=function(e){//获取键盘码37左38上39右40下
                var ev=e || window.event;
                prevdirection=direction;//蛇上一步的前进方向
                direction = ev.keyCode;//蛇这一步的前进方向=键盘敲击的按键
                if(direction > 40 || direction < 37){//如果按下的按键是其它按键，则此次蛇的前进方向与上次的相同
                    direction = prevdirection;
                }
                if(prevdirection == 37 && direction == 39){//如果方向是左，则向右无效
                    direction = 37;
                }
                if(prevdirection == 38 && direction == 40){//如果方向是上，则向下无效
                    direction = 38;
                }
                if(prevdirection == 39 && direction == 37){//如果方向是右，则向左无效
                    direction = 39;
                }
                if(prevdirection == 40 && direction == 38){//如果方向是下，则向上无效
                    direction = 40;
                }   
            }
 
            function inarr(num, arr){//判断一个元素是否在数组中，inarr(snakehead, snake)如果蛇头不是蛇身中，则判断游戏结束
                for(var i=0, j=arr.length; i<j; i++){
                    if(num == arr[i]){
                        return true;
                    }
                }
                return false;
            }
 
            function move(){
                var head = document.getElementById(snake[0]);//蛇头位置
                var prevpoint = snake[0];//保存上一点坐标
                var snakehead=snake[0];//下一点的位置
                switch(direction){//根据方向，设置下一步蛇头的位置
                    case 37://如果按下了向左键，则蛇头所在单元格的ID-1则为新单元格ID
                    	
                    	location = "${pageContext.request.contextPath}/move.action";
                        //snakehead=snake[0]-1;
                        break;
                    case 38://如果按下了向上键，则蛇头所在单元格的ID-总列数则为新单元格ID
                        snakehead=snake[0]-cols;
                        break;
                    case 39://如果按下了向右键，则蛇头所在单元格的ID+1则为新单元格ID
                        snakehead=snake[0]+1;
                        break;
                    case 40://如果按下了向下键，则蛇头所在单元格的ID+总列数则为新单元格ID
                        snakehead=snake[0]+cols;
                    }
                    //       如果蛇头所在单元格不在地图上                                            当蛇在最左边第一列中再按下向左键时          游戏结束的条件                                                                                                  
                    if(((snakehead < 0) || (snakehead > rows*cols)) || (prevpoint - snakehead == 1 && prevpoint % cols == 0) || (snakehead - prevpoint == 1 && snakehead % cols == 0) || (prevpoint != snakehead && inarr(snakehead, snake))){
                    clearInterval(dt);
                    alert('游戏结束！您的得分是：'+score.innerHTML);
                    return false;
                }
                if(snakehead == foodpointx*cols+foodpointy){//吃到食物了，增加蛇的长度并重新生成食物
                    snake[snake.length]=snake[snake.length-1];
                     
                    speed = speed-snake.length*5 < 100 ? 100 : speed-snake.length*5 ;//速度
                     
                    score.innerHTML = Math.round(snake.length*10+snake.length/speed*1000);//积分
 
                    clearInterval(dt);
                    dt=setInterval(move,speed);
 
 
                    var prevfoodx=foodpointx;//保存上一点的食物坐标，确保下一点生成的坐标不在原点上
                    var prevfoody=foodpointy;//保存上一点的食物坐标，确保下一点生成的坐标不在原点上
                    while(inarr(foodpointx*cols+foodpointy, snake) || (prevfoodx == foodpointx && prevfoody == foodpointy)){//保证下一个生成的食物不在蛇身上，和不出现在和上一个相同的位置
                        foodpointx=Math.floor(Math.random()*rows);
                        foodpointy=Math.floor(Math.random()*cols);
                    }
                    document.getElementById(foodpointx*cols+foodpointy).className="food";
                }
                var endsnake=snake.pop();//最后一个元素出栈
                snake.unshift(snakehead);//将蛇头下一步的位置入队列
                for(var i=0, j=snake.length; i<j; i++){
                    var nextdiv=document.getElementById(snake[i]);
                    nextdiv.className='snake';
                }
                if(endsnake != snake[0]){
                    document.getElementById(endsnake).className='box';
                }
            }
 
            function starts(){
                if(state != 0){
                    alert('已经开始了！');
                    return false;
                }
                state = 1;
                rows=parseInt(document.getElementsByName('row')[0].value);//行数
                cols=parseInt(document.getElementsByName('col')[0].value);//列数
                for(var i=0; i<rows; i++){//生成地图数组
                    map[i]=new Array();
                    for(var j=0; j<cols; j++){
                        map[i][j]=0;
                    }
                }
                while(snakepointx == foodpointx && snakepointy == foodpointy){//确保蛇头和食物不出现在同一点上
                    snakepointx=Math.floor(Math.random()*rows);
                    snakepointy=Math.floor(Math.random()*cols);
                    foodpointx=Math.floor(Math.random()*rows);
                    foodpointy=Math.floor(Math.random()*cols);
                }
                getbox();
                dt=setInterval(move,speed);
            }
             
            function pause(obj){
                if(state == 0){
                    alert('还没开始暂停什么！');
                    return false;
                }
 
                if(state == 2){
                    state = 3;
                    dt=setInterval(move,speed);
                    obj.value="暂停";
 
                }else{
                    state = 2;
                    clearInterval(dt);
                    obj.value="继续";
                }
            }
        </script>
    </body>
</html>