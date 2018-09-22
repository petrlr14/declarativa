%Ejercicio 1

compararListas([],[]):-!.

compararListas(L1, L2):-
    =([Head1|Tail1], L1),
    =([Head2|Tail2], L2),
    ==(Head1, Head2),
    compararListasAnidadas(Head1, Head2),
    compararListas(Tail1, Tail2),!.

compararListas(L1, L2):-
    =([Head1|Tail1], L1),
    =([Head2|Tail2], L2),
    ==(Head1, Head2),
    compararListas(Tail1, Tail2),!.

compararListasAnidadas([], []):-!.

compararListasAnidadas(L1, L2):-
    =([Head1|Tail1], L1),
    =([Head2|Tail2], L2),
    ==(Head1, Head2),
    compararListas(Tail1,Tail2),!.

%Ejercicio 2

invertirLista(L):-
    invertir(L,[], Response),
    write(Response),
    !.

invertir([], New, Response):-
    =(Response, New),!.

invertir(L, RecursiveTail, Response):-
    =([Head|Tail],L),
    atomic(Head),
    =(New, [Head|RecursiveTail]),
    invertir(Tail, New, Response),
    !.

invertir(L, RecursiveTail, Response):-
    =([Head|Tail],L),
    invertir(Head, [], Final),
    =(Recursive, [Final|RecursiveTail]),
    invertir(Tail, Recursive, Response),!.
