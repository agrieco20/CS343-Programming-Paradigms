% Author: Anthony Grieco
% Date: 11/16/2022
% Description: See "puzzle2.pdf" in Directory. Written in Answer Set Prolog (Clingo, Potassco Lab).
% IMPORTANT NOTE: Because ASP cannot process floating point numbers, all values have been multiplied by 100 so that everything can be represented and manipulated as integers.

% Literals:
% coffeeName(c).
% price(p).
% temperature(t).
% steepTime(s).

% Each describes the specific properties of each kind of coffee
blueMountain(price, temperature, steepTime).
laEsmarelda(price, temperature, steepTime).
fazenda(price, temperature, steepTime).
stHelena(price, temperature, steepTime).
kopiLuwak(price, temperature, steepTime).

% blueMountain(P, T, S), price(P), temperature(T), steepTime(S).
% laEsmarelda(P, T, S), price(P), temperature(T), steepTime(S).
% fazenda(P, T, S), price(P), temperature(T), steepTime(S).
% stHelena(P, T, S), price(P), temperature(T), steepTime(S).
% kopiLuwak(P, T, S), price(P), temperature(T), steepTime(S).

property(coffeeName, numericValue, attribute). % For a property of a particular type of coffee, that coffee type has been assigned a specific "attribute" of "numericValue"

% Rules:
% rule1 :- not kopiLuwak(8000, T, S), temperature(T), steepTime(S).
rule1 :- not kopiLuwak(8000, _, _).%, temperature(T), steepTime(S).
rule2 :- property(Coffee1, 10000, price), property(Coffee1, 21500, temperature).
rule3 :- fazenda_OR_esmarelda1, fazenda_OR_esmarelda2.
rule4 :- stHelena(_, _, 45).
rule5 :- not stHelena(_, 19500, _).
rule6 :- property(Coffee1, 300, steepTime), steep3MinutesCost(Coffee1), steep3MinutesTemp(Coffee1).
rule7 :- coffee_50DollarsRule1, coffee_50DollarsRule2.
rule8 :- property(Coffee1, 350, steepTime), property(Coffee1, BM_Price + 4000, price), blueMountain(BM_Price, _, _).
rule9 :- coffee_SteepTemp205_OR_50Dollars_Rule1(Coffee1), coffee_SteepTemp205_OR_50Dollars_Rule2(Coffee1).

% For Rule 3: The Fazenda must be assigned a Steep Temperature of 200 Degrees Farenheit or a Steep Time of 3.5 minutes (with La Esmarelda being assigned the value not given to Fazenda)
fazenda_OR_esmarelda1 :- fazenda(_, 20000, _), laEsmarelda(_, _, 350), not fazenda_OR_esmarelda2.
fazenda_OR_esmarelda2 :- fazenda(_, _, 350), laEsmarelda(_, 20000, _), not fazenda_OR_esmarelda1.

% For Rule 6: The Coffee type that takes 3 Minutes to Steep must either cost $80 or have a Steep Temperature of 200 Degrees Farenheit
steep3MinutesCost(Coffee1) :- property(Coffee1, 8000, price).%, not steep3MinutesTemp(Coffee1).
steep3MinutesTemp(Coffee1) :- property(Coffee1, 20000, temperature), not steep3MinutesCost(Coffee1).

% For Rule 7: The Coffee type that costs $50 is either the Fazenda or requires a Steep Temperature of 210 Degrees Farenheit
coffee_50DollarsRule1 :- fazenda(5000, _, _), not coffee_50DollarsRule2.
coffee_50DollarsRule2 :- property(Coffee1, 5000, price), property(Coffee1, 21000, temperature), not coffee_50DollarsRule1.

% For Rule 9: The Coffee type that either "costs $50" OR has a "Steep Temperature of 205 Degrees Farenheit" has either a "Steep Time of 1 minute" OR is the "Blue Mountain Coffee"
coffee_SteepTemp205_OR_50Dollars_Rule1(Coffee1) :- property(Coffee1, 20500, temperature), not property(Coffee1, 5000, price), property(Coffee1, 100, steepTime), not blueMountain(_, 20500, 100), blueMountain(5000, _, _), not coffee_SteepTemp205_OR_50Dollars_Rule2(Coffee1).
coffee_SteepTemp205_OR_50Dollars_Rule2(Coffee1) :- property(Coffee1, 5000, price), not property(Coffee1, 20500, temperature), property(Coffee1, 100, steepTime), not blueMountain(5000, _, 100), blueMountain(_, 20500, _), not coffee_SteepTemp205_OR_50Dollars_Rule1(Coffee1).

% Constraints: (The Statements defined in each of the Rules above must be true)
:- not rule1.
:- not rule2.
:- not rule3.
:- not rule4.
:- not rule5.
:- not rule6.
:- not rule7.
:- not rule8.
:- not rule9.


#show blueMountain/3.
#show laEsmarelda/3.
#show fazenda/3.
#show stHelena/3.
#show kopiLuwak/3.