:- dynamic asked/2.

footballer(messi, [la_league-yes, golden_ball-yes, winner_champions_league-yes, current_coach-no, rofl_surname-yes]).
footballer(ronaldo, [la_league-yes, golden_ball-yes, winner_champions_league-yes, current_coach-no, rofl_surname-no]).
footballer(guardiola, [la_league-yes, golden_ball-no, winner_champions_league-yes, current_coach-yes, rofl_surname-no]).
footballer(ibrahimovic, [la_league-yes, golden_ball-no, winner_champions_league-no, current_coach-no, rofl_surname-no]).
footballer(levandowski, [la_league-yes, golden_ball-no, winner_champions_league-yes, current_coach-no, rofl_surname-no]).
footballer(rooney, [la_league-no, golden_ball-no, winner_champions_league-yes, current_coach-yes, rofl_surname-no]).
footballer(arshavin, [la_league-no, golden_ball-no, winner_champions_league-no, current_coach-no, rofl_surname-no]).

question(la_league, 'Did he play in the Spanish Football League?').
question(golden_ball, 'Does he have a golden ball?').
question(winner_champions_league, 'Has he won the Champions League?').
question(current_coach, 'Is he coaching now?').
question(rofl_surname, 'Is he being teased dirty?').

main :-
    retractall(asked(_,_)), findall(A, footballer(A, _), Footballers), identify(Footballers, Result),
    respond(Result),
    clear_memory.

identify([Footballer], Footballer) :- !. 
identify(_, unknown) :-          
    not(can_ask_more), !.

identify(Footballers, Result) :-
    select_question(Footballers, Question), ask(Question, Reply),
    update_footballers(Footballers, Question, Reply, UpdatedFootballers),
    identify(UpdatedFootballers, Result).

select_question(Footballers, Question) :-
    question(Fact, Q),
    not(asked(Fact, _)),
    is_relevant(Fact, Footballers),
    Question = question(Fact, Q),
    !.

is_relevant(Fact, Footballers) :-
    findall(Val, (member(A, Footballers), footballer(A, Traits), member(Fact-Val, Traits)), Vals), list_to_set(Vals, UniqueVals),
    length(UniqueVals, Length),
    Length > 1.

ask(question(Fact, Text), Reply) :-
    (   asked(Fact, Reply) -> true;
		nl, write(Text), write(' (y/n)? '),
        read(Reply),
        assert(asked(Fact, Reply))
    ).
