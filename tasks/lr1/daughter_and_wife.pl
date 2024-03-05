man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).

parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).

%Сhecks if X is a daughter of Y
daughter(X,Y):- woman(X), parent(Y,X).

%The predicate that outputs the daughter of X
daughter(X):- daughter(Y,X), parent(X,Y), print(Y), nl, fail.

%Checks if X is Y wife
wife(X,Y):- woman(X), man(Y), parent(X,K), parent(Y,K), write(yes), !.

%The predicate that outputs the wife of X
wife(X):- man(X), parent(X,Z), parent(Y,Z), woman(Y), write(Y), nl, !.

%Сhecks if X is the son of Y
son(X,Y):- man(X), parent(Y,X).

%Checks if X is the grandson of Y
grand_so(X,Y):- parent(Y,Z), son(X,Z).

%Predicate that outputs all the grandsons of X
grand_sons(X):- grand_so(Y,X), print(Y), nl, fail.

%Predicate that checks whether X and Y are grandmother and grandson or grandson and grandmother.
grand_ma_and_son(X,Y):-
	parent(X,Z), parent(Z,Y), woman(X), man(Y), print(yes), nl, fail;
	parent(Y,Z), parent(Z,X), woman(Y), man(X), print(yes), nl, fail.

%Checks if X is the brother of Y
brother(X,Y):- parent(Z,X), parent(Z,Y), man(X), man(Z), print(yes), nl, fail.

%Checks if X is the uncle of Y
uncle(X,Y):- parent(Z,Y), brother(X,Z), nl, fail.

%Predicate that outputs all the uncles of X
uncle(X):- uncle(Y,X), print(Y), nl, fail.
