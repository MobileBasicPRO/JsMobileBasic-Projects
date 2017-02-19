 // ==================JsMobileBasic Script================= *

var Mouse = false,
    width = 10,
    color = 'Black',
    mode = 'arc', //arc/rect/triangle,text
    text = 'Hello World',
    textFont = 'Droid Sans',
    algo = '',
    g;


//Обработчики событий (НЕ УДАЛЯЙТЕ ФУНКЦИИ!)
function onMouseMove(x,y){
    //Этот код выполнится при движении мыши
	if(Mouse){
		switch(mode){
			case 'arc':
				setColor(color);
				fillArc(x,y,width);
				algo += 'setColor(color);fillArc(x,y,width);';
			break;

			case 'rect':
				setColor(color);
				fillRect(x-width/2,y-width/2,width,width);
				algo += 'setColor(color);fillRect(x-width/2,y-width/2,width,width);';
			break;

			case 'triangle':
				setColor(color);
				fillTriangle(x,y-width/2,x+width/2,y+width/2,x-width/2,y+width/2);
				algo += 'setColor('+color+');fillTriangle('+x+','+(y-width/2)+','+(x+width/2)+','+(y+width/2)+','+(x-width/2)+','+(y+width/2)+');';
			break;

			case 'text':
				setColor(color);
				setFont(textFont);
				setFontSize(width);
				drawString(text,x,y);
				algo += 'setColor(color);setFont(textFont);setFontSize(width);drawString(text,x,y);';
			break;
		}
	}
}
function onMouseDown(x,y){
    //Этот код выполнится при нажатии любой клавиши мыши
	Mouse = true;
}
function onMouseUp(x,y){
    //Этот код выполнится при отжатии любой клавиши мыши
	Mouse = false;
}
function onClick(x,y){
    //Этот код выполнится при левом клике
	onMouseMove(x,y);
}
function onRightClick(x,y){
    //Этот код выполнится при правом клике
}
function onKeyPress(code){
    //Этот код выполнится при нажатии клавиши на клавиатуре
}

function Main(){
    //Этот код выполнится единожды при запуске
	InitMenus();
}

function Loop(){
    //Этот код выполняется до 100 раз в секунду (будьте осторожны!)
}

function InitMenus(){
	//Файл
	menuAdd('file', 'Создать', MCreate);
	menuAdd('file', 'Открыть', MOpen);
	menuAdd('file','Сохранить',MSave);
	menuAddSeparator('file');
	menuAdd('file','Выход', function(){
		window.close();
	});
	//Правка
	menuAdd('edit', 'Очистить экран', function(){
		cls();
		algo = '';
	});

	//Инструменты
	menuAdd('instr', 'Круг', function(){
		mode='arc';
	});
	menuAdd('instr', 'Квадрат', function(){
		mode='rect';
	});
	menuAdd('instr', 'Треугольник', function(){
		mode='triangle';
	});
	menuAdd('instr', 'Текст', function(){
		text = input('Введите текст:');
		mode='text';
	})

	//Параметры
	menuAdd('params', 'Задать цвет', function(){
		var tmp = input('Укажите цвет:');
		tmp ? color = tmp : null;
	});
	menuAdd('params', 'Задать размер', function(){
		var tmp = input('Укажите размер');
		tmp ? width=parseInt(tmp) : null;
	});
	menuAdd('params', 'Задать цвет фона', function(){
		var tmp = input('Укажите цвет фона');
		tmp ? fillScreen(tmp) : null;
	})
	menuAddSeparator('params');
	menuAdd('params', 'Задать шрифт', function(){
		var tmp = input('Укажите шрифт:');
		tmp ? textFont = tmp : null;
	})
	menuAddSeparator('params');
	menuAdd('params', 'Задать фоновый градиент', function(){
		if(confirm('Создать фоновый градиент?')){
		g = makeLinearGradient(0,0,screenWidth(),screenHeight());
		setGradientColor(g,0,input('Задайте цвет слева:'));
		setGradientColor(g,1,input('Задайте цвет справа:'));
		color = g;
		setColor(g);
	}});
	menuAdd('params', 'Искользовать градиент для рисования', function(){
		if(g !== undefined){
			setColor(g);
			color = g;
		}else{
			alert('Сначала создайте градиент!');
		}
	});
	menuAdd('params', 'Использовать градиент для фона',function(){
		if(g !== undefined){
			fillScreen(g);
		}else{
			alert('Сначала создайте градиент!');
		}
	});

	//Бар
	menuBarAdd('main', 'Файл', 'file');
	menuBarAdd('main', 'Правка', 'edit');
	menuBarAdd('main', 'Инструменты', 'instr');
	menuBarAdd('main', 'Параметры', 'params');

	menuBarShow('main');
}

function MCreate(){
	alert('Недоступно!');
}

function MSave(){
	var name = input('Введите имя файла:');
	if(name){
		var save = {
			version: '1.0',
			algo: algo
		}
		saveData(name, save, alert('Успешно сохранено! =D'));
	}
}
function MOpen(){
	var name = input('Введите имя файла:');
	if(name){
		cls();
		var data = readData(name);
		eval(data.algo);
	}
}
