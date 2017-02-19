// ==================JsMobileBasic Script================= *

var x=screenWidth()/2,
    y=screenHeight()/2,
    s1=5,
    s2=5,
    k=50,
    l=15,
    xx=x-k,
    yy=y-l,
    s1s=s1*2,
    s2s=s2*2;


function onMouseMove(x,y){
    //Этот код выполнится при движении мыши
}
function onMouseDown(x,y){
    //Этот код выполнится при нажатии любой клавиши мыши
}
function onMouseUp(x,y){
    //Этот код выполнится при отжатии любой клавиши мыши
}
function onClick(x,y){
    //Этот код выполнится при левом клике
}
function onRightClick(x,y){
    //Этот код выполнится при правом клике
}
function onKeyPress(code){
    if(code == 119){ //w
        yy--;
    }else if(code == 115){//s
        yy++;
    }else if(code == 97){//a
        xx--;
    }else if(code == 100){//d
        xx++;
    }else if(code == 111){//o (w)
        y--;
    }else if(code == 107){//k (a)
        x--;
    }else if(code == 108){//l (s)
        y++;
    }else if(code == 59){//; (d)
        x++;
    }else if(code == 113){//q
        s2++;
        s2s=s2*2;
    }else if(code == 122){//z
        s2--;
        s2s=s2*2;
    }else if(code == 101){//e
        s1++;
        s1s=s1*2;
    }else if(code == 99){//c
        s1--;
        s1s=s1*2;
    }else if(code == 104){//h
        x=screenWidth()/2;
        y=screenHeight()/2;
        s=5;
        k=50;
        l=15;
        xx=x-k;
        yy=y-l;
        ss=s*2;
    }
    Render();
}

function Main(){
    Render();
}

function Loop(){
    //Этот код выполняется 10 раз в секунду (будьте осторожны!)
}

function Render(){
    cls();
    setColor('red');
    RenderCube(x,y,0);
    setColor('blue');
    RenderCube(xx,yy,1);
    setColor('green');
    Connector(x,y,xx,yy);
}

function RenderCube(x,y,b){
    if(!b){
        var r = s1,
            rr = s1s;
    }else{
        var r = s2,
            rr = s2s;
    }
    //Квадраты
    drawRect(x-r,y-r,rr,rr);
    drawRect(x,y-rr,rr,rr);
    //Линии
    drawLine(x-r,y-r,x,y-rr);
    drawLine(x+r,y-r,x+rr,y-rr);
    drawLine(x+r,y+r,x+rr,y);
    drawLine(x-r,y+r,x,y);r
}

function Connector(x,y,x1,y1){
    //1
    drawLine(x-s1,y-s1,x1-s2,y1-s2);
    drawLine(x+s1,y-s1,x1+s2,y1-s2);
    drawLine(x+s1,y+s1,x1+s2,y1+s2);
    drawLine(x-s1,y+s1,x1-s2,y1+s2);
    //2
    drawLine(x,y-s1s,x1,y1-s2s);
    drawLine(x+s1s,y-s1s,x1+s2s,y1-s2s);
    drawLine(x+s1s,y,x1+s2s,y1);
    drawLine(x,y,x1,y1);
}