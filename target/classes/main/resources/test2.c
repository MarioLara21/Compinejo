
int g;
void x; //deberia de dar error pues no se pueden declarar variables void
y;  // error
int z, t, y, y;

int funcion1(){
int k;
int g  //error por no tener ;


a = a * funcion(8);
a = a * c // error por el punto y coma

	if (y>=0) {
		x= a+b;
	}
	else {
		x--;
	}
	else { //deberia dar error por doble uso de else
		x= a+b;
	}


	if x==3 {//deberia dar error por expresion fuera de parentesis
		x= a+b;
	}
	else {
		x--;
	}
}


int funcion4(int, int) { //no se permite solo los tipos

	if ( (x<7) && (x>2) ){
 		x= g+6;
	}

	while ( ){ //debe dar error porque falta expresion
		x= a+b;
		break;
	}

	for (x=0; ) { //error pues hay solamente una expresion
		x= a+b;
		break;
	}
}

int funcion1( int x   {  // falta parentesis

	while (x && y){
		x++;
 	}

	switch(x) {

	case 5:    //se espera error por no tener ;
        case 8: {break;}
	case 5: {break;}
	case x: {break;}  //error debe ser constante
	default 5: {break;} //error por el 5, default no lleva expresion_constante
	default: x++;  //se espera error por doble default habiendo quitado el error anterior
 	}

read(X);
read(123);  //se espera error, pues no se acepta expresion entre ( )
read(x++); //se espera error

write(C- 123);
write( );     //se espera error

}