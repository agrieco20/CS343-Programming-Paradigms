% Author: Anthony Grieco
% Date: 11/16/2022
% Description: See "puzzle3.pdf" in Directory. Written in Answer Set Prolog (Clingo, Potassco Lab).

% Literals:
% name(N).
% color(C).
% sign(S).
% price(P).

% Each describes the specific properties of each kind of pendant the following people bought
beth(price, color, sign).
lacy(price, color, sign).
victor(price, color, sign).
xavier(price, color, sign).

property(signName, givenValue, attribute). % For a property of a particular person with an astronomical sign, the pendant they bought has been assigned a specific "attribute" of "givenValue"

% Rules:
% Constraints: (The Statements defined in each of the Rules above must be true)
rule1 :- libra_redstone_OR_45Dollars_condition1, libra_redstone_OR_45Dollars_condition2.
rule2 :- not property(libra, 50, price), not beth(50, _, _).
rule3 :- not property(aquarius, red, color).
rule4 :- property(scorpio, 50, price), not beth(_, _, scorpio), not beth(_, _, libra).
rule5 :- xavier(P1, _, _), property(Sign1, blue, color), property(Sign1, Sign1_Price, price), P1 < Sign1_Price, not xavier(_, blue, _).
rule6 :- property(Sign1, yellow, color), property(Sign1, P1_Price, price), beth(P1_Price + 5, _, _), not beth(_, yellow, _).
rule7 :- virgo_OR_35DollarsPaid_condition1, virgo_OR_35DollarsPaid_condition2.

% For Rule 1: The Libra either bought a pendant with a red stone or paid $45
libra_redstone_OR_45Dollars_condition1 :- property(libra, red, color), not property(libra, 45, price), not libra_redstone_OR_45Dollars_condition2.
libra_redstone_OR_45Dollars_condition2 :- not property(libra, red, color), property(libra, 45, price), not libra_redstone_OR_45Dollars_condition1.

% For Rule 7: The "Virgo" or the "person who bought the orange stone" either are "Lacy" or "paid $35"
virgo_OR_35DollarsPaid_condition1 :- not property(Person, virgo, sign), property(Person, orange, color), property(Person, 35, price), lacy(_, _, virgo), not lacy(35, orange, _), not virgo_OR_35DollarsPaid_condition2.
virgo_OR_35DollarsPaid_condition2 :- property(Person, virgo, sign), not property(Person, orange, color), not property(Person, 35, price), lacy(_, orange, _), not lacy(35, _, virgo), not virgo_OR_35DollarsPaid_condition1.

% Constraints: (The Statements defined in each of the Rules above must be true)
:- not rule1.
:- not rule2.
:- not rule3.
:- not rule4.
:- not rule5.
:- not rule6.
:- not rule7.


#show beth/3.
#show lacy/3.
#show victor/3.
#show xavier/3.