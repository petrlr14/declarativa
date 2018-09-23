%Ejercicio 1

compararListas([],[]):-!.

compararListas(L1, L2):-
    =([Head1|Tail1], L1),
    =([Head2|Tail2], L2),
    atomic(Head1),
    atomic(Head2),
    ==(Head1, Head2),
    compararListas(Tail1, Tail2),!.

compararListas(L1, L2):-
    =([Head1|Tail1], L1),
    =([Head2|Tail2], L2),
    compararListas(Head1, Head2),
    compararListas(Tail1, Tail2),!.

%Ejercicio 2

invertirLista(L):-
    invertir(L,[], Response),
    write(Response),
    !.

invertir([], RecursiveTail, Response):-
    =(Response, RecursiveTail),!.

invertir(L, RecursiveTail, Response):-
    =([Head|Tail],L),
    atomic(Head),
    =(Recursive, [Head|RecursiveTail]),
    invertir(Tail, Recursive, Response),
    !.

invertir(L, RecursiveTail, Response):-
    =([Head|Tail],L),
    invertir(Head, [], Final),
    =(Recursive, [Final|RecursiveTail]),
    invertir(Tail, Recursive, Response),!.
