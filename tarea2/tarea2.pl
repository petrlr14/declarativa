%Pedro René Gómez Fuentes 00057616

cutTree(Tree, Data):-
    search(Tree, Data, ActualTree, CutedTree),
    write("New Tree: "),
    writeln(ActualTree),
    write("Sub Tree: "),
    writeln(CutedTree).

search([], _,[],[]):-
    !.

search([Left, Root, Right], Data,[], CutedTree):-
    ==(Data, Root),
    =(CutedTree, [Left, Root, Right]),
    !.

search([Left, Root, Right], Data, ActualTree, CutedTree):-
    >(Data, Root),
    search(Right, Data, AuxTree, CutedTree),
    =(ActualTree, [Left, Root, AuxTree]),!.

search([Left, Root, Right], Data, ActualTree, CutedTree):-
    =<(Data, Root),
    search(Left, Data, AuxTree, CutedTree),
    =(ActualTree, [AuxTree, Root, Right]),!.

%Ejecutar la cláusula cutTree, que recibe el arbol y el dato a buscar