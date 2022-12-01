% Author: Anthony Grieco
% Date: 11/16/2022
% Description: See "puzzle3.pdf" in Directory. Written in Answer Set Prolog (Clingo, Potassco Lab).

person(beth; lacy; victor; xavier).
price(35; 40; 45; 50).
color(blue; orange; red; yellow).
sign(aquarius; libra; scorpio; virgo).

pendantNameValue(one; two; three; four).

% Every pendant is assigned particular values (person, price, color, and sign)
1{pendant(U, Person, Price, Color, Sign): person(Person), price(Price), color(Color), sign(Sign)}1 :- pendantNameValue(U).

% There is only one type of pendant purchased by each person (each with their own unique price, color, and sign)
:- pendant(P1, Person, _, _, _), pendant(P2, Person, _, _, _), pendantNameValue(P1), pendantNameValue(P2), person(Person), P1 != P2.
:- pendant(P1, _, Price, _, _), pendant(P2, _, Price, _, _), pendantNameValue(P1), pendantNameValue(P2), price(Price), P1 != P2.
:- pendant(P1, _, _, Color, _), pendant(P2, _, _, Color, _), pendantNameValue(P1), pendantNameValue(P2), color(Color), P1 != P2.
:- pendant(P1, _, _, _, Sign), pendant(P2, _, _, _, Sign), pendantNameValue(P1), pendantNameValue(P2), sign(Sign), P1 != P2.

% Rules:

% Rule 1:
rule1 :- pendant(U, Person, Price, red, Sign), pendant(U, Person, Price, Color, libra), not pendant(U, Person, 45, Color, Sign), pendantNameValue(U), person(Person), price(Price), color(Color), sign(Sign).
rule1 :- not pendant(U, Person, Price, red, Sign), pendant(U, Person, Price, Color, libra), pendant(U, Person, 45, Color, Sign), pendantNameValue(U), person(Person), price(Price), color(Color), sign(Sign).

% Rule 2:
:- pendant(U, Person, 50, Color, libra), pendantNameValue(U), person(Person),  color(Color). 
:- pendant(U, beth, 50, Color, Sign), pendantNameValue(U), color(Color), sign(Sign).
:- pendant(U, beth, Price, Color, libra), pendantNameValue(U), price(Price), color(Color).

% Rule 3:
:- pendant(U, Person, Price, red, aquarius), pendantNameValue(U), person(Person), price(Price).

% Rule 4:
rule4 :- pendant(U, Person, 50, Color, scorpio), pendantNameValue(U), person(Person), color(Color).
        
        :- pendant(U, beth, Price, Color, scorpio), pendantNameValue(U), price(Price), color(Color).

% Rule 5:
rule5 :- pendant(XavierPendant, xavier, Xavier_Price, Color, Xavier_Sign), 
        pendant(Pendant2, Person, P1_Price, blue, Pendant2_Sign),
        
        Xavier_Price < P1_Price,

        pendantNameValue(XavierPendant), pendantNameValue(Pendant2), person(Person), price(Xavier_Price), price(P1_Price), color(Color), sign(Xavier_Sign), sign(Pendant2_Sign).%, XavierPendant != Pendant2.%, 

        :- pendant (U, xavier, 50, Color, Sign), pendantNameValue(U), color(Color), sign(Sign).
        :- pendant (U, xavier, Price, blue, Sign), pendantNameValue(U), price(Price), sign(Sign).
        :- pendant(U, Person, 35, blue, Sign), pendantNameValue(U), person(Person), sign(Sign).

% Rule 6:
rule6 :- pendant(BethPendant, beth, Beth_Price, Color, Beth_Sign), 
        pendant(Pendant2, Person, P2_Price, yellow, P2_Sign),
        Beth_Price = P2_Price + 5, %%%price(Beth_Price) = price(P1_Price) + 5, 
        pendantNameValue(BethPendant), pendantNameValue(Pendant2), person(Person), price(Beth_Price), price(P2_Price), color(Color), sign(Beth_Sign), sign(P2_Sign).

        :- pendant(PendantValue, beth, Price, yellow, Sign), pendantNameValue(PendantValue), price(Price), sign(Sign).

% Rule 7:
rule7 :- pendant(VirgoPerson, lacy, Price, Color, virgo), %virgo_OR_35DollarsPaid_condition.
        pendant(OrangeStonePerson, Person, 35, orange, Sign),
        pendantNameValue(VirgoPerson), pendantNameValue(OrangeStonePerson), person(Person), price(Price), color(Color), sign(Sign).

rule7 :- pendant(VirgoPerson, Person, 35, Color, virgo), %virgo_OR_35DollarsPaid_condition.
        pendant(OrangeStonePerson, lacy, Price, orange, Sign),
        pendantNameValue(VirgoPerson), pendantNameValue(OrangeStonePerson), person(Person), price(Price), color(Color), sign(Sign).

        :- pendant(PendantValue, Person, Price, orange, virgo), pendantNameValue(PendantValue), person(Person), price(Price).
        :- pendant(PendantValue, lacy, 35, Color, Sign), pendantNameValue(PendantValue), color(Color), sign(Sign).

% Ensures that each pendant can only be bought by one person
pendant1 :- pendant(one, beth, Price, Color, Sign) , price(Price), color(Color), sign(Sign).
pendant2 :- pendant(two, lacy, Price, Color, Sign) , price(Price), color(Color), sign(Sign).
pendant3 :- pendant(three, victor, Price, Color, Sign) , price(Price), color(Color), sign(Sign).
pendant4 :- pendant(four, xavier, Price, Color, Sign) , price(Price), color(Color), sign(Sign).

:- not pendant1.
:- not pendant2.
:- not pendant3.
:- not pendant4.

% Constraints: (The Statements defined in each of the Rules above must be true)
:- not rule1.
:- not rule4.
:- not rule5.
:- not rule6.
:- not rule7.

#show pendant/5.