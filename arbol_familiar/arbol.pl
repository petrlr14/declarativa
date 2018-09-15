mujer(josefina).
mujer(silvia).
mujer(marina).
mujer(ligia).
mujer(regina).

hombre(manuel).
hombre(mario).
hombre(jaime).
hombre(carlos).
hombre(julio).
hombre(jacinto).

madre(josefina, mario).
madre(josefina, ligia).
madre(silvia, marina).
madre(silvia, jaime).
madre(silvia, carlos).
madre(ligia, regina).
madre(ligia, jacinto).

padre(manuel, mario).
padre(manuel, ligia).
padre(mario, marina).
padre(mario, jaime).
padre(mario, carlos).
padre(julio, regina).
padre(julio, jacinto).

hermano(X, Y):-
    hombre(X),
    padre(P, X),
    padre(P, Y),
    madre(M, X),
    madre(M, Y).

 hermana(X, Y):-
    mujer(X),
    padre(P, X),
    padre(P, Y),
    madre(M, X),
    madre(M, Y).

abuelo(X, Y):-
    hombre(X),
    padre(X, W),
    madre(W, Y).

abuelo(X, Y):-
    hombre(X),
    padre(X, W),
    padre(W, Y).

