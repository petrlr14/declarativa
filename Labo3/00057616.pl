%Base de conocimiento del ejericio 5, para conocer la casa

conecta(calle,cochera).
conecta(cochera,calle).
conecta(cochera,sala).
conecta(sala,cochera).
conecta(sala,pasillo1).
conecta(pasillo1,sala).
conecta(comedor,pasillo1).
conecta(pasillo1,comedor).
conecta(banio,pasillo1).
conecta(pasillo1,banio).
conecta(cocina,pasillo1).
conecta(pasillo1,cocina).
conecta(cocina,lavadero).
conecta(lavadero,cocina).
conecta(cocina,lavadero).
conecta(pasillo1,lavadero).
conecta(lavadero,pasillo1).
conecta(pasillo1,pasillo2).
conecta(pasillo2,pasillo1).
conecta(cuarto_de_papas,pasillo2).
conecta(pasillo2,cuarto_de_papas).
conecta(cuarto_de_rodri,pasillo2).
conecta(pasillo2,cuarto_de_rodri).
conecta(pasillo2,jardin).
conecta(jardin,pasillo2).
conecta(quiosco,jardin).
conecta(jardin,quiosco).

%Ejercicio 6

esta_en(flores, jardin).
esta_en(pantuflas, cuarto_de_rodri).
esta_en(papel_higienico, banio).

traer(Objeto, A):-
    esta_en(Objeto, B),
    ida_y_vuelta(A, B).

ida_y_vuelta(A, B):-
    ir_hacia(B, A),
    writeln("-----Llendo de regreso-----"),
    ir_hacia(A, B).

ir_hacia(A, B):-
    abolish(visitado, 1),
    assert(visitado(A)),
    ir(A, B),
    writeln(A),!.

ir(A, B):-
    conecta(A, B),
    writeln(B),
    assert(visitado(B)),!.

ir(A, B):-
    conecta(A, C),
    \+visitado(C),
    assert(visitado(C)),
    ir(C, B),
    writeln(C),!.

%Para ejecutar el ejercicio se escribe en consola traer(el_nombre_del_objeto, donde_estas_actualmente)