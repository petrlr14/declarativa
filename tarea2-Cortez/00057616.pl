%Pedro René Gómez Fuentes 00057616

%Ejercicio 3
%ejecutar enterNetwork().
enterNetwork():-
    open('frases.txt', read, Stream),
    random(1, 5, Random),
    readline(Random, Stream),
    close(Stream).

readline(Random, Stream):-
    getLine(1, Random, Read, Stream),
    writeln(Read).


getLine(Cont, Cont, Read, Stream):-
    read(Stream, Read),!.

getLine(Cont, Line, Read, Stream):-
    read(Stream, _),
    is(Aux, Cont+1),
    getLine(Aux, Line, Read, Stream),!.

%Ejercicio 5
%Se debe llamar getInfo()
getInfo():-
    open('informacion.txt', read, Stream),
    read(Stream, Some),
    fillList(Stream, List, Some),
    close(Stream),
    writeln(List).

fillList(_, List, 'end_of_file'):-
    =(List, []),!.

fillList(Stream, List, X):-
    read(Stream, Info),
    fillList(Stream, Aux, Info),
    split_string(X, "-", "", List2),
    =(List, [List2|Aux]),!.

%Ejercicio 8
%Ejecutar menu()    
menu():-
    writeln("Promedios diarios: "),
    getDayAVG(),
    writeln("Promedios por hora: "),
    getHourAVG().

getHourAVG():-
    getAVGHour('temp_lunes.txt', 'temp_martes.txt', 'temp_miercoles.txt', 'temp_jueves.txt', 'temp_viernes.txt', 'temp_sabado.txt', 'temp_domingo.txt').

getAVGHour(Day1, Day2, Day3, Day4, Day5, Day6, Day7):-
    open(Day1, read, Stream1),
    open(Day2, read, Stream2),
    open(Day3, read, Stream3),
    open(Day4, read, Stream4),
    open(Day5, read, Stream5),
    open(Day6, read, Stream6),
    open(Day7, read, Stream7),
    read(Stream1, Som1),
    read(Stream2, Som2),
    read(Stream3, Som3),
    read(Stream4, Som4),
    read(Stream5, Som5),
    read(Stream6, Som6),
    read(Stream7, Som7),
    getHAA(Stream1, Stream2, Stream3, Stream4, Stream5, Stream6, Stream7, Som1, Som2, Som3, Som4, Som5, Som6, Som7),
    close(Stream1),
    close(Stream2),
    close(Stream3),
    close(Stream4),
    close(Stream5),
    close(Stream6),
    close(Stream7).

getHAA(_, _, _,_,_,_,_,'end_of_file', _, _,_,_,_,_):-!.

getHAA(Stream1, Stream2, Stream3, Stream4, Stream5, Stream6, Stream7, Temp1, Temp2, Temp3, Temp4, Temp5, Temp6, Temp7):-
    is(Resp, /((Temp1+Temp2+Temp3+Temp4+Temp5+Temp6+Temp7),7)),
    writeln(Resp),
    read(Stream1, Som1),
    read(Stream2, Som2),
    read(Stream3, Som3),
    read(Stream4, Som4),
    read(Stream5, Som5),
    read(Stream6, Som6),
    read(Stream7, Som7),
    getHAA(Stream1, Stream2, Stream3, Stream4, Stream5, Stream6, Stream7, Som1, Som2, Som3, Som4, Som5, Som6, Som7).

getDayAVG():-
    write("En lunes "),
    getAVGDay('temp_lunes.txt'),
    write("En martes "),
    getAVGDay('temp_martes.txt'),
    write("En miercoles "),
    getAVGDay('temp_miercoles.txt'),
    write("En jueves "),
    getAVGDay('temp_jueves.txt'),
    write("En viernes "),
    getAVGDay('temp_viernes.txt'),
    write("En sabado "),
    getAVGDay('temp_sabado.txt'),
    write("En domingo "),
    getAVGDay('temp_domingo.txt').


getAVGDay(Day):-
    open(Day, read, Stream),
    getAVGNumber1(Stream).


getAVGNumber1(Stream):-
    getAVGNumber2(Stream, 1, 0).

getAVGNumber2(_, 6, Sum):-
    write("el promedio fue: "),
    is(Resp, /(Sum, 5)),
    writeln(Resp),!.

getAVGNumber2(Stream, Cont, Sum):-
    read(Stream, Data),
    is(Con2, Cont+1),
    is(Sum2, +(Sum, Data)),
    getAVGNumber2(Stream, Con2, Sum2),!.

%Ejercicio 9
%Ejecutar muestraLinea(nombreArchivo, lineaABuscar, Variable libre )
muestraLinea(Arch, NLinea, Linea):-
    open(Arch, read, Stream),
    readRomanticLine(NLinea, Stream, Linea).

readRomanticLine(NLinea, Stream, Linea):-
    getRomanticLine(1, NLinea, Linea, Stream).

getRomanticLine(Cont, Cont, Read, Stream):-
    read(Stream, Read),!.

getRomanticLine(Cont, Line, Read, Stream):-
    read(Stream, _),
    is(Aux, Cont+1),
    getRomanticLine(Aux, Line, Read, Stream).

%Ejercicio 10
%Ejecute readAndClas()
readAndClas():-
    open('misc.txt', read, Stream),
    open('int.txt', read, Int),
    open('number.txt', read, Num),
    open('otros.txt', read, Otros),
    read(Stream, Text),
    reade(Stream, Text, Int, Num, Otros),
    close(Stream),
    close(Int),
    close(Num),
    close(Otros).


reade(_, 'end_of_file', _, _, _):-!.

reade(Stream, Text, Int, Num, Otros):-
    integer(Text),
    write(Int, Text),
    write(Int, '.\n'),
    read(Stream, Aux),
    reade(Stream, Aux, Int, Num, Otros),!.

reade(Stream, Text, Int, Num, Otros):-
    number(Text),
    write(Num, Text),
    write(Num, '.\n'),
    read(Stream, Aux),
    reade(Stream, Aux, Int, Num, Otros),!.

reade(Stream, Text, Int, Num, Otros):-
    write(Otros, Text),
    write(Otros, '.\n'),
    read(Stream, Aux),
    reade(Stream, Aux, Int, Num, Otros),!.