% Author: Anthony Grieco
% Date: 11/16/2022
% Description: See "puzzle3.pdf" in Directory. Written in Answer Set Prolog (Clingo, Potassco Lab).

% Literals:
% name(N).
% color(C).
% sign(S).
% price(P).

% Each describes the specific properties of each kind of pendant that someone bought:
% beth(price, color, sign).
% lacy(price, color, sign).
% victor(price, color, sign).
% xavier(price, color, sign).

% pendant(person, price, color, sign).
pendant(person, price, color, sign).

person(beth; lacy; victor; xavier).
price(35; 40; 45; 50).
color(blue; orange; red; yellow).
sign(aquarius; libra; scorpio; virgo).

% person1(a, b).

% 1{pendant(W, X, Y, Z)}1 :- person(W), price(X), color(Y), sign(Z).
% 1{pendant(person(W), price(X), color(Y), sign(Z))}1 :- person(W), price(X), color(Y), sign(Z).
1{pendant(W, X, Y, Z): price(X), color(Y), sign(Z)}1 :- person(W).

% property(signName, givenValue, attribute). % For a property of a particular person with an astronomical sign, the pendant they bought has been assigned a specific "attribute" of "givenValue"

% Rules:
rule1 :- libra_redstone_OR_45Dollars_condition.%, libra_redstone_OR_45Dollars_condition2.
% rule2 :- not property(libra, 50, price), not beth(50, _, _).
rule2 :- not pendant(W, 50, Y, libra), 
        not pendant(beth, 50, Y, Z), 
        person(W), color(Y), sign(Z).
% rule3 :- not property(aquarius, red, color).
rule3 :- not pendant(W, X, red, aquarius), 
        person(W), price(X).
% rule4 :- property(scorpio, 50, price), not beth(_, _, scorpio), not beth(_, _, libra).
rule4 :- pendant(W, 50, Y, scorpio), 
        not pendant(beth, X, Y, scorpio), 
        not pendant(beth, X, Y, libra), 
        person(W), price(X), color(Y).
% rule5 :- xavier(P1, _, _), property(Sign1, blue, color), property(Sign1, Sign1_Price, price), P1 < Sign1_Price, not xavier(_, blue, _).
rule5 :- pendant(xavier, Xavier_Price, Y, Z), 
        pendant(W, P1_Price, blue, Z), 
        price(Xavier_Price) < price(P1_Price), 
        not pendant (xavier, X, blue, Z), 
        person(W), price(X), color(Y), sign(Z).%, 
        % price(Xavier_Price), price(Price1).

% rule6 :- property(Sign1, yellow, color), property(Sign1, P1_Price, price), beth(P1_Price + 5, _, _), not beth(_, yellow, _).
rule6 :- pendant(beth, Beth_Price, Y, Z), 
        pendant(W, P1_Price, yellow, Z),
        price(Beth_Price) = price(P1_Price + 5), 
        not pendant(beth, X, yellow, Z), 
        person(W), price(X), color(Y), sign(Z).

% rule7 :- virgo_OR_35DollarsPaid_condition1, virgo_OR_35DollarsPaid_condition2.
% rule7 :- virgo_OR_35DollarsPaid_condition.

% For Rule 1: The Libra either bought a pendant with a red stone or paid $45
libra_redstone_OR_45Dollars_condition :- pendant(W, X, red, libra), not pendant(W, 45, Y, libra), person(W), price(X), color(Y).
libra_redstone_OR_45Dollars_condition :- not pendant(W, X, red, libra), pendant(W, 45, Y, libra), person(W), price(X), color(Y).


% For Rule 7: The "Virgo" or the "person who bought the orange stone" either are "Lacy" or "paid $35"
% virgo_OR_35DollarsPaid_condition1 :- not property(Person, virgo, sign), property(Person, orange, color), property(Person, 35, price), lacy(_, _, virgo), not lacy(35, orange, _), not virgo_OR_35DollarsPaid_condition2.
% virgo_OR_35DollarsPaid_condition2 :- property(Person, virgo, sign), not property(Person, orange, col or), not property(Person, 35, price), lacy(_, orange, _), not lacy(35, _, virgo), not virgo_OR_35DollarsPaid_condition1.

% virgo_OR_35DollarsPaid_condition :- not pendant(Person, X, Y, virgo), 
%                                     pendant(Person, 35, orange, Z), 
%                                     % pendant(lacy, X, Y, virgo), 
%                                     % not pendant(lacy, 35, orange, Z), 

%                                     % Person != lacy,
%                                     % not person1(Person, lacy),
%                                     % not Person = lacy,
%                                     % person(Person),
%                                     % not person(Person) = lacy,
%                                     % not Person = lacy,
                                    
%                                     price(X), color(Y), sign(Z).

        % not property(Person, virgo, sign), property(Person, orange, color), property(Person, 35, price), lacy(_, _, virgo), not lacy(35, orange, _).
% virgo_OR_35DollarsPaid_condition :- pendant(Person, X, Y, virgo),
%                                     not pendant(Person, 35, orange, Z), 
% %                                     not pendant(lacy, X, Y, virgo), 
% %                                     pendant(lacy, 35, orange, Z), 

% %                                     % not Person = lacy,
% %                                     % person(Person), 
% %                                     % not person(Person) = lacy,

%                                     price(X), color(Y), sign(Z).


    % property(Person, virgo, sign), not property(Person, orange, col or), not property(Person, 35, price), lacy(_, orange, _), not lacy(35, _, virgo).



% Constraints: (The Statements defined in each of the Rules above must be true)
:- not rule1.
:- not rule2.
:- not rule3.
:- not rule4.
:- not rule5.
:- not rule6.
% :- not rule7.

% There is only one type of pennant purchased by each person (each with their own unique price, color, and sign)
%%% 1{pendant(W, X, Y, Z): price(X), color(Y), sign(Z)}1 :- person(W).
% :- pendant(W, X, Y, Z), pendant(A, B, C, D), 
% :- person(W), person(X), not W = X.
% :- pendant(A, _, _, _), pendant(B, _, _, _), person(A), person(B), not A = B.
% person(A), person(B), 
% :- pendantName(P1, pendant(A,B,C,D)), pendantName(P2, pendant(W,X,Y,Z)), person(A), price(B), color(C), sign(D), person(W), price(X), color(Y), sign(Z), not P1 = P2, not A = W, not B = X, not C = Y, not D = Z.


#show pendant/4.
% #show beth/3.
% #show lacy/3.
% #show victor/3.
% #show xavier/3.