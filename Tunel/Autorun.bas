// ==================JsMobileBasic Script================= *

var x = screenWidth()/2,
    y = screenHeight()/2,
    s = 5,
    sm = s/4;
    MouseControl = false
    foward = false,
    back = false,
    left = false,
    right = false,
    up = false,
    down = false,
    objfoward = false,
    objback = false;

function onMouseMove(x1,y1){
    if(MouseControl){
        x=x1;
        loop();
    }
}
function onMouseDown(x,y){}
function onMouseUp(x,y){}
function onClick(x,y){
    MouseControl = true;
    x = screenWidth()/2;
    y = screenHeight()/2;
    s = 5;
}
function onRightClick(x,y){}
function onKeyPress(code){
}

function onKeyDown(CODE){
    if(CODE == 87){ //w
        foward = true;
    }else if(CODE == 65){ //a
        left = true;
    }else if(CODE == 83){ //s
        back = true;
    }else if(CODE == 68){ //d
        right = true;
    }
    else if(CODE == 81){ //q
        up = true;
    }
    else if(CODE == 90){ //z
        down = true;
    }
    if(CODE == 72){ //h
        x = screenWidth()/2;
        y = screenHeight()/2;
        s = 5;
        CODE = null;
    }
    if(CODE == 69){//E
        objback = true;
    }else if(CODE == 67){//C
        objfoward = true;
    }
}

function onKeyUp(CODE){
    if(CODE == 87){ //w
        foward = false;
    }else if(CODE == 65){ //a
        left = false;
    }else if(CODE == 83){ //s
        back = false;
    }else if(CODE == 68){ //d
        right = false;
    }
    else if(CODE == 81){ //q
        up = false;
    }
    else if(CODE == 90){ //z
        down = false;
    }else if(CODE == 69){//E
        objback = false;
    }else if(CODE == 67){//C
        objfoward = false;
    }
}

function Main(){
    LoadTextures();
    loop();
}

function BackgroundGradient(){
    setColor('#b4b4b4');
    fillRect(0,0,screenWidth(),screenHeight());
    setColor('#4b4b4b');
    fillRect(0,y, screenWidth(), screenHeight());
}
function RenderFrame(){ //Рисуем каркасс
    setColor('#ff0000');

    drawLine(x-s,y-s,x+s,y-s); //Квадратик по центру
    drawLine(x+s,y-s,x+s,y+s);
    drawLine(x+s,y+s,x-s,y+s);
    drawLine(x-s,y+s,x-s,y-s);

    drawLine(0,0,x-s,y-s); //Основной каркас
    drawLine(screenWidth(),0,x+s,y-s);
    drawLine(0,screenHeight(),x-s,y+s);
    drawLine(screenWidth(),screenHeight(),x+s,y+s);
}
function RenderWalls(){ //Заливаем стены
    setColor('#0000ff');
//    setColor(floor);
    fillRect4(0,0,x-s,y-s,x-s,y+s,0,screenHeight());
    fillRect4(screenWidth(),0,x+s,y-s,x+s,y+s,screenWidth(),screenHeight());
    setColor('#00ff00');
    fillRect4(x-s,y-s,x+s,y-s,x+s,y+s,x-s,y+s);
}
function RenderObject1(){
    setColor('orange');
    sm2 = 0;
//    fillRect4((x-s)-sm2,(y+s)-sm2,x,(y+s+sm)-sm2,x,(y-s-sm)-sm2,(x-s)-sm2,(y)-sm2);
    /*
         +    +
        =#====#
        ===##==
        ===##==
        =#====#
         -    -
    */
//    fillRect4(x+s+sm2,y,x+s+sm2,y+s+sm2,x,y+s+sm,x,y+sm);

    setColor('purple');

//    fillTriangle(x,y+sm,x,y-s-sm,x-s-sm,y);
//    fillTriangle(x,y+sm,x,y-s-sm,x+s+sm,y);

    setColor('black');

    drawLine(x,y-sm,x,y+sm);
}
function RenderLinearWalls(count){ //Рисуем линейные стены (каркасс)
    setColor('#0000ff');
    for(i=0;i<screenHeight();i+=count){
        k = s/165;
        drawLine(0,i,x-s,(y-s)+(i/2*k)); //i*k+y-s
        drawLine(screenWidth(),i,x+s,(y-s)+(i/2*k)); //i*k+y-s
    }
}

function loop(){
    debug('x:'+x+'; y:'+y+'; s:'+s+';');
    BackgroundGradient();
    RenderFrame();
    RenderWalls();
    RenderObject1();
//    RenderLinearWalls(44);
}

function Loop(){
    if(foward){ //w
        s+=2;
    }
    if(left){ //a
        x+=2;
    }
    if(back){ //s
        s-=2;
        s=limit(s,0);
    }
    if(right){ //d
        x-=2;
    }
    if(up){ //q
        y+=2;
    }
    if(down){ //z
        y-=2;
    }
    if(objfoward){//E
        sm--;
    }
    if(objback){//C
        sm++;
    }
    loop();
}

function LoadTextures(){
    //Пол
//    gelLoad('img/cavhexfloor2_d.png','floor');
//    floor = makeTexture('floor');
//    //Потолок
//    gelLoad('','celling');
//    celling = makeTexture('celling');
//    //Правая стена
//    gelLoad('','rightwall');
//    rightwall = makeTexture('rightwall');
//    //Левая стена
//    gelLoad('','leftwall');
//    leftwall = makeTexture('leftwall');
//    //Дальняя стена
//    gelLoad('','wall');
//    wall = makeTexture('wall');
}