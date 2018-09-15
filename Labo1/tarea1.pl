calorias(paella, 200).
calorias(gazpacho, 150).
calorias(consome, 300).
calorias(filete_cerdo, 400).
calorias(pollo_asado, 280).
calorias(trucha, 160).
calorias(bacaloa, 300).
calorias(pastel, 200).
calorias(semillas, 500).
calorias(jugo_naranja, 50).
calorias(soda, 100).
calorias(horchata, 70).

fuerte(paella).
fuerte(gazpacho).
fuerte(consome).
fuerte(filete_cerdo).
fuerte(pollo_asado).
fuerte(trucha).
fuerte(bacalao).

bebida(jugo_naranja).
bebida(soda).
bebida(horchata).

postre(pastel).
postre(semillas).

valor_calorico(X, Y, Z, V) :-
    calorias(X, A),
    calorias(Y, B),
    calorias(Z, C),
    write("La cantidad de calorias consumidas es de: "),
    V is A+B+C.

comida_equilibrada(X, Y, Z) :-
    calorias(X, A),
    calorias(Y, B),
    calorias(Z, C),
    A+B+C>800,
    write("La comida supera las 800 calorias"), !.

comida_equilibrada(_, _, _) :-
    write("La comida no supera las 800 calorias").


%   Literal D ejercicio 14

consulta():-
    writeln("Cual es su limite de calorias? "),
    read(TotalCalorias),nl,
    busqueda(TotalCalorias).

busqueda(Calorias):-
    posible_plato_fuerte(CaloriasFuerte, Fuerte),
    posible_bebida(CaloriasBebida, Bebida),
    posible_postre(CaloriasPostre, Postre),
    >=(Calorias, +(+(CaloriasFuerte, CaloriasBebida), CaloriasPostre)),
    write('Puedes comer: '),
    writeln(Fuerte),
    write('Puedes beber: '),
    writeln(Bebida),
    write('Puedes disfrutar de: '),
    writeln(Postre),
    writeln(" "),
    false.
    
busqueda(_):-
    writeln("No puedes comer los tres elementos de la cena con esa cantidad de calorias :C"),!.

posible_plato_fuerte(Calorias, Fuerte):-
    fuerte(Fuerte),
    calorias(Fuerte, Calorias).
    

posible_bebida(Calorias, Bebida):-
    bebida(Bebida),
    calorias(Bebida, Calorias).
    
posible_postre(Calorias, Postre):-
    postre(Postre),
    calorias(Postre, Calorias).