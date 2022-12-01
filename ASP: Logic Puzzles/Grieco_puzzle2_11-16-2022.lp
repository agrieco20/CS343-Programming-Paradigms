% Author: Anthony Grieco
% Date: 11/16/2022
% Description: See "puzzle2.pdf" in Directory. Written in Answer Set Prolog (Clingo, Potassco Lab).
% IMPORTANT NOTE: Because ASP cannot process floating point numbers, the "steepTime" values been multiplied by 100 so that everything of that particular type can be represented and manipulated as integers (because ASP cannot handle decimals).

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

% Rules:

% Rule 1:
:- coffeeType(CoffeeValue, kopiLuwak, 80, Temp, STime), coffeeNameValue(CoffeeValue), temperature(Temp), steepTime(STime).

% Rule 2:
rule2 :- coffeeType(CoffeeValue, Name, 100, 215, STime), coffeeNameValue(CoffeeValue), coffeeName(Name), steepTime(STime).
    :- not rule2.

% Rule 3:
rule3 :- coffeeType(F_CoffeeValue, fazenda, F_Price, 200, F_STime), 
        coffeeType(LE_CoffeeValue, laEsmarelda, LE_Price, LE_TEMP, 350), 
        coffeeNameValue(F_CoffeeValue), coffeeNameValue(LE_CoffeeValue), price(F_Price), price(LE_Price), temperature(LE_TEMP), steepTime(F_STime).

rule3 :- coffeeType(F_CoffeeValue, fazenda, F_Price, F_TEMP, 350), 
        coffeeType(LE_CoffeeValue, laEsmarelda, LE_Price, 200, LE_STime), 
        coffeeNameValue(F_CoffeeValue), coffeeNameValue(LE_CoffeeValue), price(F_Price), price(LE_Price), temperature(F_TEMP), steepTime(LE_STime).

    :- not rule3.

    :- coffeeType(CoffeeValue, Name, Price, 200, 350), coffeeNameValue(CoffeeValue), coffeeName(Name), price(Price).

% Rule 4:
rule4 :- coffeeType(CoffeeValue, stHelena, Price, Temp, 45), coffeeNameValue(CoffeeValue), price(Price), temperature(Temp).
    
    :- not rule4.

% Rule 5:
:- coffeeType(CoffeeValue, stHelena, Price, 195, STime), coffeeNameValue(CoffeeValue), price(Price), steepTime(STime).

% Rule 6:
rule6 :- coffeeType(CoffeeValue, Name, 80, Temp, 300), 
        coffeeNameValue(CoffeeValue), coffeeName(Name), temperature(Temp).

rule6 :- coffeeType(CoffeeValue, Name, Price, 200, 300), 
        coffeeNameValue(CoffeeValue), coffeeName(Name), price(Price).

    :- not rule6.

    :- coffeeType(CoffeeValue, Name, 80, 200, STime), coffeeNameValue(CoffeeValue), coffeeName(Name), steepTime(STime).

% Rule 7:
rule7 :- coffeeType(CoffeeValue, fazenda, 50, Temp, STime), 
        coffeeNameValue(CoffeeValue), temperature(Temp), steepTime(STime).

rule7 :- coffeeType(CoffeeValue, Name, 50, 210, STime), 
        coffeeNameValue(CoffeeValue), coffeeName(Name), steepTime(STime).

    :- not rule7.

    :- coffeeType(CoffeeValue, fazenda, Price, 210, STime), coffeeNameValue(CoffeeValue), price(Price), steepTime(STime).

% Rule 8:
rule8 :- coffeeType(C1, Name, C1_Price, C1_Temp, 350),
        coffeeType(C2, blueMountain, C2_Price, C2_Temp, STime),
        C1_Price = C2_Price + 40,
        coffeeNameValue(C1), coffeeNameValue(C2), price(C1_Price), price(C2_Price), temperature(C1_Temp), temperature(C2_Temp), steepTime(STime).
    
    :- not rule8.

    :- coffeeType(CoffeeType, blueMountain, Price, Temp, 350), coffeeNameValue(CoffeeValue), price(Price), temperature(Temp).

% Rule 9:
rule9 :- coffeeType(C1, C1_Name, C1_Price, 205, 100), 
        coffeeType(C2, blueMountain, 60, C2_Temp, C2_STime), 
        coffeeNameValue(C1), coffeeNameValue(C2), coffeeName(C1_Name), price(C1_Price), temperature(C2_Temp), steepTime(C2_STime).

rule9 :- coffeeType(C1, blueMountain, C1_Price, 205, C1_STime), 
        coffeeType(C2, C2_Name, 60, C2_Temp, 100), 
        coffeeNameValue(C1), coffeeNameValue(C2), coffeeName(C2_Name), price(C1_Price), temperature(C2_Temp), steepTime(C1_STime).

    :- not rule9.

    :- coffeeType(CoffeeValue, Name, 60, 205, STime), coffeeNameValue(CoffeeValue), coffeeName(Name), steepTime(STime).
    :- coffeeType(CoffeeValue, blueMountain, Price, Temp, 100), coffeeNameValue(CoffeeValue), price(Price), temperature(Temp).

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