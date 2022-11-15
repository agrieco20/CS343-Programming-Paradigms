% Author: Anthony Grieco
% Date: 11/14/2022
% Description: This Answer Set Prolog (ASP -> Clingo, Potassco Lab) program computes the satisfiability of a boolean expression given in conjunctive normal form (literals are "OR"ed together and then the clauses those literals are "AND"ed together)

% Literals:
literal(X) :- pclause(_, X).
literal(X) :- nclause(_, X).
clause(C) :- pclause(C, _).
clause(C) :- nclause(C, _).

value(true; false).

% Rules:
1{assign(L, V): value(V)}1 :- literal(L).

satisfied(C) :- pclause(C,L), assign(L, true), clause(C), literal(L).
satisfied(C) :- nclause(C,L), assign(L, false), clause(C), literal(L).

% Constraints:
:- not satisfied(C), clause(C).