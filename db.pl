persons(0, []) :- !.
persons(N, [(_Girl,_Sport,_TP,_Game,_Hotel)|T]) :- N1 is N-1, persons(N1,T).
person(1, [H|_], H) :- !.
person(N, [_|T], R) :- N1 is N-1, person(N1, T, R).

% A chilena pratica Triathlon 
hint1([(chilena,triathlon,_, _, _)|_]).
hint1([_|T]) :- hint1(T).

% A espanhola esta hospedada na Urca 
hint2([(espanhola,_,_,_,urca)|_]).
hint2([_|T]) :- hint2(T).

% A belga quer assistir natacao 
hint3([(belga,_,_,natacao,_)|_]).
hint3([_|T]) :- hint3(T).

% A italiana quer conhecer o maracana
hint4([(italiana,_,maracana,_,_)|_]).
hint4([_|T]) :- hint4(T).

% A argentina tem 20 anos 
hint5(Persons) :- person(1, Persons, (argentina,_,_,_,_)).

% A turista que pretende assistir Vôlei de Praia nos Jogos Olímpicos está hospedada em um hotel em Botafogo.
hint6([(_,_,_,volei,botafogo)|_]).
hint6([_|T]) :- hint6(T).

% A turista que gosta de praticar corrida gostaria de conhecer o Pão de Açúcar
hint7([(_,corrida,pao,_,_)|_]).
hint7([_|T]) :- hint7(T).

% A turista que pratica handebol deseja assistir às competições de Hipismo.
hint8([(_,handebol,_,hipismo,_)|_]).
hint8([_|T]) :- hint6(T).

% A turista de 22 anos gostaria de conhecer a praia de Ipanema.
hint9(Persons) :- person(3, Persons, (_,_,_,ipanema,_)).

% A turista hospedada na Barra da Tijuca tem um ano de diferença em relação à turista que pretende assistir às competições de Hipismo.
hint10([(_,_,_,_,tijuca),(_,_,_,hipismo,_)|_]).
hint10([(_,_,_,hipismo,_),(_,_,_,_,tijuca)|_]).
hint10([_|T]) :- hint10(T).

% A argentina tem um ano de diferença em relação à turista que gosta de jogar futebol.
hint11([(argentina,_,_,_,_),(_,futebol,_,_,_)|_]).
hint11([(_,futebol,_,_,_),(argentina,_,_,_,_)|_]).
hint11([_|T]) :- hint11(T).

% A turista que deseja assistir às competições de Saltos Ornamentais deseja conhecer a Praia do Pepê.
hint12([(_,_,pepe,salto,_)|_]).
hint12([_|T]) :- hint12(T).

% Uma das turistas está hospedada em Copacabana.
hint13([(_,_,_,_,copacabana)|_]).
hint13([_|T]) :- hint13(T).

% Quem deseja assistir às competições de Atletismo tem um ano de diferença em relação a quem pretende conhecer a praia de Copacabana.
hint14([(_,_,_,atletismo,_),(_,_,copacabana,_,_)|_]).
hint14([(_,_,copacabana,_,_),(_,_,_,atletismo,_)|_]).
hint14([_|T]) :- hint14(T).

% Quem irá assistir Atletismo nos Jogos Olímpicos tem um ano de diferença em relação a quem está hospedada em Ipanema.
hint15([(_,_,_,atletismo,_),(_,_,_,_,ipanema)|_]).
hint15([(_,_,_,_,ipanema),(_,_,_,atletismo,_)|_]).
hint15([_|T]) :- hint15(T).

% A turista que pratica tênis é mais de um ano mais velha do que a que possui corrida como esporte pessoal.
%?????????????
hint16(Persons) :- person(X, Persons, (_,tenis,_,_,_)),
person(Y, Persons, (_,corrida,_,_,_)),
(X-Y)>1.

% Solução 
solution(Persons) :-
  persons(5, Persons),
  hint1(Persons),
  hint2(Persons),
  hint3(Persons),
  hint4(Persons),
  hint5(Persons),
  hint6(Persons),
  hint7(Persons),
  hint8(Persons),
  hint9(Persons),
  hint10(Persons),
  hint11(Persons),
  hint12(Persons),
  hint13(Persons),
  hint14(Persons),
  hint15(Persons),
  hint16(Persons).