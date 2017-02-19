// ==================JsMobileBasic Script================= *

var MAP = [
    10,-1,200,-20,
    200,-20,500,-10
    //500,10,100,15
];
var ColorMap = [
    'red',
    'blue'
]

var x = 0,
    y = 50,
    z = 0,
    parseX,
    parseZ,
    parseX2,
    parseZ2,
    pNum = 0,
    color = 'black';

function onMouseMove(x1,y1){}
function onMouseDown(x,y){}
function onMouseUp(x,y){}
function onClick(x,y){}
function onRightClick(x,y){}
function onKeyPress(code){
    if(code == 119){//w
        z-=15;
    }else if(code == 97){//d
        x+=15;
    }else if(code == 115){//s
        z+=15;
    }else if(code == 100){//a
        x-=15;
    }
    else if(code == 113){//q
        
    }
    else if(code == 122){//z
        
    }else if(code == 104){//h
        
    }else if(code == 101){//E
        
    }else if(code == 99){//C
        
    }
    debug([x,z]);
    Render();
}

function Main(){
    Render();
}

function Loop(){

}

function Render(){
    cls();
    RenderBackground();
//    RenderHorizont();
/*    
    if(pNum+4<=MAP.length){
        pNum += 4
    }else if(pNum+4>MAP.length){
        pNum = 0;
    }*/
    pNum = 0;
    for(var i in MAP){
        debug(pNum);
        ParseMap(MAP,pNum);
        RenderMapRects();
        pNum+=4;
    }
    
    
}

function RenderHorizont(){
    setColor(color);
    drawLine(0,screenHeight()/2,screenWidth(),screenHeight()/2);
}

function ParseMap(map,num){
    parseX = map[num];
    parseZ = map[num+1];
    parseX2 = map[num+2];
    parseZ2 = map[num+3];
    num+=3;
}

function RenderMapRects(){
    setColor(color);
    drawRect4(parseX+x,screenHeight()/2-y-parseZ+z, //top1
              parseX2+x,screenHeight()/2-y-parseZ2+z, //top2
              parseX2+x,screenHeight()/2+y-parseZ2-z, //bottom2
              parseX+x,screenHeight()/2+y-parseZ-z); //bottom1
              
              
    drawLine(parseX+x,screenHeight()/2-y-parseZ+z,parseX+x,screenHeight()/2+y-parseZ-z);
//    drawLine(parseX2,screenHeight()/2+y-parseZ2,parseX2,screenHeight()/2-y-parseZ2);
}

function RenderBackground(){
    setColor('#b4b4b4');
    fillRect(0,0,screenWidth(),screenHeight());
    setColor('#4b4b4b');
    fillRect(0,screenHeight()/2, screenWidth(), screenHeight());
}