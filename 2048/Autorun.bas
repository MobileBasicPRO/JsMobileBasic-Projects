// ==================JsMobileBasic Script================= *

//Поле 4x4:
table = [
	[0,0,0,0],
	[0,0,0,0],
	[0,0,0,0],
	[8,4,2,2],
];
//Начало координат
x00 = 0;
y00 = 0;
//Размер ячейки
x02 = 120;
y02 = 128;
//Размер доски
x01 = x02*4;
y01 = y02*4;


setFontSize(25);

function Main(){
    //Этот код выполнится единожды при запуске
	Render();
}

function Loop(){
    //Этот код выполняется постоянно
}

function Render(){
	//table
	setColor('yellow');
	fillScreen('gray');
	drawRect(x00,y00,x01,y01);
	for(i = 0;i<x00+x01;i+=(x00+x01)/4){
		drawLine(i,y00,i,y00+y01);
	}
	for(i = 0;i<y00+y01;i+=(y00+y01)/4){
		drawLine(x00,i,x00+x01,i);
	}
	//loops
	setColor('red');
	for(i in table){//rows
		for(j in table[i]){//cols
			//fillRect(((x00+x02)*i)+x02/2-2.5,((y00+y02)*j)+y02/2-2.5,5,5);//Рисуем квадрат, в центре
			if(table[i][j] != 0) drawString(table[i][j],((x00+x02)*i)+x02/2-9,((y00+y02)*j)+y02/2+25/2);//Выводим число в центре ячеек
		}
	}
}


function moveUp(){
	for(i in table){//rows
		for(j = table[i].length-1;j>0;j--){//cols
// 		i=3;
			if(true){//Не начало строки
				if(table[i][j] != 0 ){//Не пустая ячейка
					if(table[i][j+1] == table[i][j]){//Если предыдущая и текущая ячейки равны
						debug('соответствие!');
						table[i][j] = table[i][j]*2;//Умножить предыдущую на 2
						table[i][j+1] = 0; //Очистить текущую
						Render();
					}
					if(table[i][j-1] == 0 && table[i][j] != 0 && j != 0){//Если предыдущая - 0; текущая не 0; не начало строки
						table[i][j-1] = table[i][j]; //переместить текущую туда
						table[i][j]=0;
					}
				}
			}

		}
	}
}

function moveDown(){
	for(i in table){//rows
		for(j in table[i]){//cols
// 		i=3;
			if(true){//Не начало строки
				if(table[i][j] != 0 ){//Не пустая ячейка
					if(table[i][j-1] == table[i][j]){//Если предыдущая и текущая ячейки равны
						debug('соответствие!');
						table[i][j] = table[i][j]*2;//Умножить предыдущую на 2
						table[i][j-1] = 0; //Очистить текущую
						Render();
					}
					if(table[i][j+1] == 0 && table[i][j] != 0){//Если предыдущая - 0; текущая не 0; не начало строки
						table[i][j+1] = table[i][j]; //переместить текущую туда
						table[i][j]=0;
					}
				}
			}

		}
	}
}

function moveLeft(){}

function moveRight(){}

function onKeyDown(code){//<37 ^38 >39 v40
	switch(code){
		case 37:
			moveLeft();
			break;
		case 38:
			moveUp();
			break;
		case 39:
			moveRight();
			break;
		case 40:
			moveDown();
			break;
	}
	debug(JSON.stringify(table));
	Render();
}
