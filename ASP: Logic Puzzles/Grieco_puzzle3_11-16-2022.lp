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
% pendant(person, price, color, sign).

person(beth; lacy; victor; xavier).
price(35; 40; 45; 50).
color(blue; orange; red; yellow).
sign(aquarius; libra; scorpio; virgo).

pendantNameValue(one; two; three; four).

% 1{pendant(W, X, Y, Z)}1 :- person(W), price(X), color(Y), sign(Z).
% 1{pendant(person(W), price(X), color(Y), sign(Z))}1 :- person(W), price(X), color(Y), sign(Z).

% Every pendant is assigned particular values (person, price, color, and sign)
1{pendant(U, W, X, Y, Z): person(W), price(X), color(Y), sign(Z)}1 :- pendantNameValue(U).

% There is only one type of pendant purchased by each person (each with their own unique price, color, and sign)
:- pendant(P1, Person, _, _, _), pendant(P2, Person, _, _, _), pendantNameValue(P1), pendantNameValue(P2), person(Person), P1 != P2.
:- pendant(P1, _, Price, _, _), pendant(P2, _, Price, _, _), pendantNameValue(P1), pendantNameValue(P2), price(Price), P1 != P2.
:- pendant(P1, _, _, Color, _), pendant(P2, _, _, Color, _), pendantNameValue(P1), pendantNameValue(P2), color(Color), P1 != P2.
:- pendant(P1, _, _, _, Sign), pendant(P2, _, _, _, Sign), pendantNameValue(P1), pendantNameValue(P2), sign(Sign), P1 != P2.

% Rules:

%Rule 1:
rule1 :- pendant(U, W, X, red, Z), pendant(U, W, X, Y, libra), not pendant(U, W, 45, Y, Z), pendantNameValue(U), person(W), price(X), color(Y), sign(Z).
rule1 :- not pendant(U, W, X, red, Z), pendant(U, W, X, Y, libra), pendant(U, W, 45, Y, Z), pendantNameValue(U), person(W), price(X), color(Y), sign(Z).

% rule2 :- not property(libra, 50, price), not beth(50, _, _).
% rule2 :- %%not pendant(U, W, 50, Y, Z), %DOESN'T WORK

%Rule 2:
:- pendant(U, W, 50, Y, libra), pendantNameValue(U), person(W),  color(Y). 
:- pendant(U, beth, 50, Y, Z), pendantNameValue(U), color(Y), sign(Z).
:- pendant(U, beth, X, Y, libra), pendantNameValue(U), price(X), color(Y).

        % :- pendant(_, _, 50, _, libra). 
        % :- pendant(_, beth, 50, _, _).
        % not pendant(_, beth, _, _, libra),
        % not pendant(U,beth,50,Y,libra),
        % pendantNameValue(U), person(W), price(X), color(Y), sign(Z).


% % % rule3 :- not property(aquarius, red, color).
% Rule 3:
:- pendant(U, W, X, red, aquarius), pendantNameValue(U), person(W), price(X).

% % % rule4 :- property(scorpio, 50, price), not beth(_, _, scorpio), not beth(_, _, libra).
% Rule 4:
rule4 :- pendant(U, W, 50, Y, scorpio), pendantNameValue(U), person(W), color(Y).
% :- not pendant(U, W, 50, Y, scorpio), pendantNameValue(U), person(W), color(Y).
:- pendant(U, beth, X, Y, scorpio), pendantNameValue(U), price(X), color(Y).
%         not pendant(U, beth, X, Y, scorpio), 
%         not pendant(U, beth, X, Y, libra), 
%         pendantNameValue(U), person(W), price(X), color(Y).
% % % rule5 :- xavier(P1, _, _), property(Sign1, blue, color), property(Sign1, Sign1_Price, price), P1 < Sign1_Price, not xavier(_, blue, _).
% Rule 5:
rule5 :- pendant(XavierPendant, xavier, Xavier_Price, Y, Xavier_Sign), 
        pendant(Pendant2, W, P1_Price, blue, Pendant2_Sign),
        %% pendant(Pendant2, W, P1_Price, Y, Z),
        
        Xavier_Price < P1_Price,
        %% Xavier_Price = P1_Price - 5,

% % %         % not pendant (U, xavier, 50, blue, Z), 
% % %         % not pendant(U, W, 35, blue, Z), 
        pendantNameValue(XavierPendant), pendantNameValue(Pendant2), person(W), price(Xavier_Price), price(P1_Price), color(Y), sign(Xavier_Sign), sign(Pendant2_Sign).%, XavierPendant != Pendant2.%, 
%         %%% price(Xavier_Price), price(Price1).

        :- pendant (U, xavier, 50, Y, Z), pendantNameValue(U), color(Y), sign(Z).
        :- pendant (U, xavier, X, blue, Z), pendantNameValue(U), price(X), sign(Z).
        :- pendant(U, W, 35, blue, Z), pendantNameValue(U), person(W), sign(Z).

% % rule6 :- property(Sign1, yellow, color), property(Sign1, P1_Price, price), beth(P1_Price + 5, _, _), not beth(_, yellow, _).
% Rule 6:
rule6 :- pendant(BethPendant, beth, Beth_Price, Y, Beth_Sign), 
        pendant(Pendant2, W, P2_Price, yellow, P2_Sign),
        Beth_Price = P2_Price + 5, %%%price(Beth_Price) = price(P1_Price) + 5, 
        % not pendant(U, beth, X, yellow, Z), 
        pendantNameValue(BethPendant), pendantNameValue(Pendant2), person(W), price(Beth_Price), price(P2_Price), color(Y), sign(Beth_Sign), sign(P2_Sign).

        :- pendant(PendantValue, beth, Price, yellow, Sign), pendantNameValue(PendantValue), price(Price), sign(Sign).
%         :- pendant(U, beth, X, yellow, Z).
% rule7 :- virgo_OR_35DollarsPaid_condition1, virgo_OR_35DollarsPaid_condition2.
% Rule 7:
rule7 :- pendant(VirgoPerson, lacy, Price, Color, virgo), %virgo_OR_35DollarsPaid_condition.
        pendant(OrangeStonePerson, Person, 35, orange, Sign),
        pendantNameValue(VirgoPerson), pendantNameValue(OrangeStonePerson), person(Person), price(Price), color(Color), sign(Sign).

rule7 :- pendant(VirgoPerson, Person, 35, Color, virgo), %virgo_OR_35DollarsPaid_condition.
        pendant(OrangeStonePerson, lacy, Price, orange, Sign),
        pendantNameValue(VirgoPerson), pendantNameValue(OrangeStonePerson), person(Person), price(Price), color(Color), sign(Sign).

        :- pendant(PendantValue, Person, Price, orange, virgo), pendantNameValue(PendantValue), person(Person), price(Price).
        :- pendant(PendantValue, lacy, 35, Color, Sign), pendantNameValue(PendantValue), color(Color), sign(Sign).

% For Rule 1: The Libra either bought a pendant with a red stone or paid $45
% libra_redstone_OR_45Dollars_condition :- pendant(U, W, X, red, Z), 
%                                         pendant(U, W, X, Y, libra), 
%                                         not pendant(U, W, 45, Y, Z), 
%                                         pendantNameValue(U), person(W), price(X), color(Y), sign(Z).

% libra_redstone_OR_45Dollars_condition :- not pendant(U, W, X, red, Z), 
%                                         pendant(U, W, X, Y, libra), 
%                                         pendant(U, W, 45, Y, Z), 
%                                         pendantNameValue(U), person(W), price(X), color(Y), sign(Z).


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

%         % not property(Person, virgo, sign), property(Person, orange, color), property(Person, 35, price), lacy(_, _, virgo), not lacy(35, orange, _).
% virgo_OR_35DollarsPaid_condition :- pendant(Person, X, Y, virgo),
%                                     not pendant(Person, 35, orange, Z), 
% %                                     not pendant(lacy, X, Y, virgo), 
% %                                     pendant(lacy, 35, orange, Z), 

% %                                     % not Person = lacy,
% %                                     % person(Person), 
% %                                     % not person(Person) = lacy,

%                                     price(X), color(Y), sign(Z).


% %     property(Person, virgo, sign), not property(Person, orange, col or), not property(Person, 35, price), lacy(_, orange, _), not lacy(35, _, virgo).



% Constraints: (The Statements defined in each of the Rules above must be true)
:- not rule1. %WORKS
:- not rule4. %WORKS
:- not rule5. %WORKS
:- not rule6. %WORKS
:- not rule7. %WORKS

% There is only one type of pendant purchased by each person (each with their own unique price, color, and sign)
%%% 1{pendant(W, X, Y, Z): price(X), color(Y), sign(Z)}1 :- person(W).
% :- pendant(W, X, Y, Z), pendant(A, B, C, D), 
% :- person(W), person(X), not W = X.
% :- pendant(A, _, _, _), pendant(B, _, _, _), person(A), person(B), not A = B.
% person(A), person(B), 


% pendantNameValue(one; two; three; four).

% pendantName(PV, pendant(W, X, Y, Z)) :- pendantNameValue(PV), person(W), price(X), color(Y), sign(Z).

% 1{pendantName(PV, pendant(W, X, Y, Z))}1 :- pendantNameValue(PV), person(W), price(X), color(Y), sign(Z).


% :- pendantName(P1, pendant(W,X,Y,Z)), pendantName(P2, pendant(W,X,Y,Z)), pendantNameValue(P1), pendantNameValue(P2), person(W), price(X), color(Y), sign(Z), not P1 = P2.
% 1{pendantName(A, pendant(W, X, Y, Z)): pendantNameValue(A)}1 :- person(W), price(X), color(Y), sign(Z).

% :- pendantName(P1, pendant(A,_,_,_)), pendantName(P2, pendant(B,_,_,_)), person(A), person(B), P1 = P2, A = B.
% :- pendant(A, _, _, _), pendant(B, _, _, _), person(A), person(B),  A = B.
% :- pendant(A,B,C,D), pendant(W,X,Y,Z), person(A), price(B), color(C), sign(D), person(W), price(X), color(Y), sign(Z), not A = W, not B = X, not C = Y, not D = Z. % Works but does something weird and not what it should be doing

% :- pendant(A,_,_,_), pendant(W,_,_,_), person(A), person(W), not A = W.
% :- pendant(_,B,_,_), pendant(_,X,_,_), price(B), price(X), not B = X.
% :- pendant(_,_,C,_), pendant(_,_,Y,_), color(C), color(Y), not C = Y.
% :- pendant(_,_,_,D), pendant(_,_,_,Z), sign(D), sign(Z), not D = Z.

% :- pendantName(P1, pendant(W,X,Y,Z)), pendantName(P2, pendant(W,X,Y,Z)), person(W), price(X), color(Y), sign(Z), not P1 = P2.


% % 1{pendantPerson(PN, Person): person(Person)}1 :- pendantNameValue(PN).
% :- pendantNameValue(P1), pendantNameValue(P2), person(Person), pendantPerson(P1, Person), pendantPerson(P2, Person), not P1 = P2.

% % 1{pendantPrice(PN, Price): person(Price)}1 :- pendantNameValue(PN).
% :- pendantNameValue(P1), pendantNameValue(P2), person(Price), pendantPrice(P1, Price), pendantPrice(P2, Price), not P1 = P2.

% % 1{pendantColor(PN, Color): person(Color)}1 :- pendantNameValue(PN).
% :- pendantNameValue(P1), pendantNameValue(P2), person(Color), pendantColor(P1, Color), pendantColor(P2, Color), not P1 = P2.

% % 1{pendantSign(PN, Sign): person(Sign)}1 :- pendantNameValue(PN).
% :- pendantNameValue(P1), pendantNameValue(P2), person(Sign), pendantSign(P1, Sign), pendantSign(P2, Sign), not P1 = P2.

% :- pendant(P1, Person, _, _, _), pendant(P2, Person, _, _, _), pendantNameValue(P1), pendantNameValue(P2), person(Person), P1 != P2.

% :- pendant(P1, _, Price, _, _), pendant(P2, _, Price, _, _), pendantNameValue(P1), pendantNameValue(P2), price(Price), P1 != P2.

% :- pendant(P1, _, _, Color, _), pendant(P2, _, _, Color, _), pendantNameValue(P1), pendantNameValue(P2), color(Color), P1 != P2.

% :- pendant(P1, _, _, _, Sign), pendant(P2, _, _, _, Sign), pendantNameValue(P1), pendantNameValue(P2), sign(Sign), P1 != P2.


% :- pendantName(P1, pendant(W,_,_,_)), pendantName(P2, pendant(W,_,_,_)), person(W), not P1 = P2.
% :- pendantName(P1, pendant(_,X,_,_)), pendantName(P2, pendant(_,X,_,_)), price(X), not P1 = P2.
% :- pendantName(P1, pendant(_,_,Y,_)), pendantName(P2, pendant(_,_,Y,_)), color(Y), not P1 = P2.
% :- pendantName(P1, pendant(_,_,_,Z)), pendantName(P2, pendant(_,_,_,Z)), sign(Z), not P1 = P2.

% :- pendant(A,_,_,_), pendant(W,_,_,_), person(A), person(W), not A = W.
% :- pendant(_,B,_,_), pendant(_,X,_,_), price(B), price(X), not B = X.
% :- pendant(_,_,C,_), pendant(_,_,Y,_), color(C), color(Y), not C = Y.
% :- pendant(_,_,_,D), pendant(_,_,_,Z), sign(D), sign(Z), not D = Z.


#show pendant/5.
% #show pendantNameValue/1.
% #show beth/3.
% #show lacy/3.
% #show victor/3.
% #show xavier/3.