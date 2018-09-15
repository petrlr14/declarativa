and(A, B) :-
    A,
    B ,!.

/* and(A, B):-
    A, B. */

or(A, B) :-
    A\==B, !.
/* or(A, B):-
    \==(A, B) */
or(A, B) :-
    A\==0,
    B\==0.

negacion(A, S) :-
    A==0,
    S is 1, !.
negacion(A, S) :-
    A==1,
    S is 0, !.

nand(A, B, S) :-
    A==1,
    B\==1,
    S is 1, !.

nand(A, B, S) :-
    A\==1,
    B==1,
    S is 1, !.

nand(A, B, S) :-
    A==0,
    B==0,
    S is 1, !.

nand(A, B, S) :-
    A==1,
    B==1,
    S is 0, !.

nor(A, B, S) :-
    or(A, B)==1,
    S is 0, !.

xor(A, B)   :-
    A\==B.

xnor(A, B)  :-
    A==B.