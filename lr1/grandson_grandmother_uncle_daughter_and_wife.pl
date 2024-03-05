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

%son(?X, +Y) - checks if X is the son of Y
son(X,Y):- man(X), parent(Y,X).

%grand_so(?X, +Y) - checks if X is the grandson of Y
grand_so(X,Y):- parent(Y,Z), son(X,Z).

%grand_sons(+X) - predicate that outputs all the grandsons of X
grand_sons(X):- grand_so(Y,X), print(Y), nl, fail.

%grand_ma_and_son(+X, +Y) - predicate that checks whether X and Y are grandmother and grandson or grandson and grandmother
grand_ma_and_son(X,Y):- parent(X,Z), parent(Z,Y), woman(X), man(Y), print(yes), nl, fail;
%parent(Y,Z), parent(Z,X), woman(Y), man(X), print(yes), nl, fail.

