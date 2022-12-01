% Author: Anthony Grieco
% Date: 11/16/2022
% Description: See "puzzle2.pdf" in Directory. Written in Answer Set Prolog (Clingo, Potassco Lab).
% IMPORTANT NOTE: Because ASP cannot process floating point numbers, all values that originally had a piece of data that could potentially be a decimal has been multiplied by 100 so that everything of that particular type can be represented and manipulated as integers.

% Literals:
% coffeeName(c).
% price(p).
% temperature(t).
% steepTime(s).

coffeeName(blueMountain; laEsmarelda; fazenda; stHelena; kopiLuwak).
price(50; 60; 80; 100; 590).
temperature(195; 200; 205; 210; 215).
steepTime(45; 100; 200; 300; 350).

coffeeNameValue(one; two; three; four; five).

% Every type of coffee ("coffeeType") is assigned particular values (coffeeName, price, temperature, and steepTime)
1{coffeeType(CoffeeValue, Name, Price, Temp, STime): coffeeName(Name), price(Price), temperature(Temp), steepTime(STime)}1 :- coffeeNameValue(CoffeeValue).

% There is only one type of coffee each (each with their own unique Name, Price, Temperature, and Steep Time)
:- coffeeType(C1, Name, _, _, _), coffeeType(C2, Name, _, _, _), coffeeNameValue(C1), coffeeNameValue(C2), coffeeName(Name), C1 != C2.
:- coffeeType(C1, _, Price, _, _), coffeeType(C2, _, Price, _, _), coffeeNameValue(C1), coffeeNameValue(C2), price(Price), C1 != C2.
:- coffeeType(C1, _, _, Temp, _), coffeeType(C2, _, _, Temp, _), coffeeNameValue(C1), coffeeNameValue(C2), temperature(Temp), C1 != C2.
:- coffeeType(C1, _, _, _, STime), coffeeType(C2, _, _, _, STime), coffeeNameValue(C1), coffeeNameValue(C2), steepTime(STime), C1 != C2.


% blueMountain(P, T, S), price(P), temperature(T), steepTime(S).
% laEsmarelda(P, T, S), price(P), temperature(T), steepTime(S).
% fazenda(P, T, S), price(P), temperature(T), steepTime(S).
% stHelena(P, T, S), price(P), temperature(T), steepTime(S).
% kopiLuwak(P, T, S), price(P), temperature(T), steepTime(S).

% property(coffeeName, numericValue, attribute). % For a property of a particular type of coffee, that coffee type has been assigned a specific "attribute" of "numericValue"

% Rules:

% Rule 1:
% rule1 :- not kopiLuwak(8000, T, S), temperature(T), steepTime(S).
% rule1 :- not kopiLuwak(8000, _, _).%, temperature(T), steepTime(S).
:- coffeeType(CoffeeValue, kopiLuwak, 80, Temp, STime), coffeeNameValue(CoffeeValue), temperature(Temp), steepTime(STime).

% Rule 2:
rule2 :- coffeeType(CoffeeValue, Name, 100, 215, STime), coffeeNameValue(CoffeeValue), coffeeName(Name), steepTime(STime).
    :- not rule2.
% rule2 :- property(Coffee1, 10000, price), property(Coffee1, 21500, temperature).

% Rule 3:
rule3 :- coffeeType(F_CoffeeValue, fazenda, F_Price, 200, F_STime), 
        coffeeType(LE_CoffeeValue, laEsmarelda, LE_Price, LE_TEMP, 350), 
        coffeeNameValue(F_CoffeeValue), coffeeNameValue(LE_CoffeeValue), price(F_Price), price(LE_Price), temperature(LE_TEMP), steepTime(F_STime).

rule3 :- coffeeType(F_CoffeeValue, fazenda, F_Price, F_TEMP, 350), 
        coffeeType(LE_CoffeeValue, laEsmarelda, LE_Price, 200, LE_STime), 
        coffeeNameValue(F_CoffeeValue), coffeeNameValue(LE_CoffeeValue), price(F_Price), price(LE_Price), temperature(F_TEMP), steepTime(LE_STime).

    :- not rule3.

    :- coffeeType(CoffeeValue, Name, Price, 200, 350), coffeeNameValue(CoffeeValue), coffeeName(Name), price(Price).
% rule3 :- fazenda_OR_esmarelda1, fazenda_OR_esmarelda2.

% Rule 4:
rule4 :- coffeeType(CoffeeValue, stHelena, Price, Temp, 45), coffeeNameValue(CoffeeValue), price(Price), temperature(Temp).
    
    :- not rule4.

% rule4 :- stHelena(_, _, 45).

% Rule 5:
:- coffeeType(CoffeeValue, stHelena, Price, 195, STime), coffeeNameValue(CoffeeValue), price(Price), steepTime(STime).
% rule5 :- not stHelena(_, 19500, _).

% Rule 6:
% rule6 :- property(Coffee1, 300, steepTime), steep3MinutesCost(Coffee1), steep3MinutesTemp(Coffee1).
% rule7 :- coffee_50DollarsRule1, coffee_50DollarsRule2.
% rule8 :- property(Coffee1, 350, steepTime), property(Coffee1, BM_Price + 4000, price), blueMountain(BM_Price, _, _).
% rule9 :- coffee_SteepTemp205_OR_50Dollars_Rule1(Coffee1), coffee_SteepTemp205_OR_50Dollars_Rule2(Coffee1).

% % For Rule 3: The Fazenda must be assigned a Steep Temperature of 200 Degrees Farenheit or a Steep Time of 3.5 minutes (with La Esmarelda being assigned the value not given to Fazenda)
% fazenda_OR_esmarelda1 :- fazenda(_, 20000, _), laEsmarelda(_, _, 350), not fazenda_OR_esmarelda2.
% fazenda_OR_esmarelda2 :- fazenda(_, _, 350), laEsmarelda(_, 20000, _), not fazenda_OR_esmarelda1.

% % For Rule 6: The Coffee type that takes 3 Minutes to Steep must either cost $80 or have a Steep Temperature of 200 Degrees Farenheit
% steep3MinutesCost(Coffee1) :- property(Coffee1, 8000, price).%, not steep3MinutesTemp(Coffee1).
% steep3MinutesTemp(Coffee1) :- property(Coffee1, 20000, temperature), not steep3MinutesCost(Coffee1).

% % For Rule 7: The Coffee type that costs $50 is either the Fazenda or requires a Steep Temperature of 210 Degrees Farenheit
% coffee_50DollarsRule1 :- fazenda(5000, _, _), not coffee_50DollarsRule2.
% coffee_50DollarsRule2 :- property(Coffee1, 5000, price), property(Coffee1, 21000, temperature), not coffee_50DollarsRule1.

% % For Rule 9: The Coffee type that either "costs $50" OR has a "Steep Temperature of 205 Degrees Farenheit" has either a "Steep Time of 1 minute" OR is the "Blue Mountain Coffee"
% coffee_SteepTemp205_OR_50Dollars_Rule1(Coffee1) :- property(Coffee1, 20500, temperature), not property(Coffee1, 6000, price), property(Coffee1, 100, steepTime), not blueMountain(_, 20500, 100), blueMountain(6000, _, _), not coffee_SteepTemp205_OR_50Dollars_Rule2(Coffee1).
% coffee_SteepTemp205_OR_50Dollars_Rule2(Coffee1) :- property(Coffee1, 6000, price), not property(Coffee1, 20500, temperature), property(Coffee1, 100, steepTime), not blueMountain(6000, _, 100), blueMountain(_, 20500, _), not coffee_SteepTemp205_OR_50Dollars_Rule1(Coffee1).

% % Constraints: (The Statements defined in each of the Rules above must be true)
% :- not rule1.
% :- not rule2.
% :- not rule3.
% :- not rule4.
% :- not rule5.
% :- not rule6.
% :- not rule7.
% :- not rule8.
% :- not rule9.

% Ensures that each coffeeType can only be assigned to one coffeeValue
coffee1 :- coffeeType(one, blueMountain, Price, Temp, STime) , price(Price), temperature(Temp), steepTime(STime).
coffee2 :- coffeeType(two, laEsmarelda, Price, Temp, STime) , price(Price), temperature(Temp), steepTime(STime).
coffee3 :- coffeeType(three, fazenda, Price, Temp, STime) , price(Price), temperature(Temp), steepTime(STime).
coffee4 :- coffeeType(four, stHelena, Price, Temp, STime) , price(Price), temperature(Temp), steepTime(STime).
coffee5 :- coffeeType(five, kopiLuwak, Price, Temp, STime) , price(Price), temperature(Temp), steepTime(STime).


:- not coffee1.
:- not coffee2.
:- not coffee3.
:- not coffee4.
:- not coffee5.

#show coffeeType/5.
% #show blueMountain/3.
% #show laEsmarelda/3.
% #show fazenda/3.
% #show stHelena/3.
% #show kopiLuwak/3.