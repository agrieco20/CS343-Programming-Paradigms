% Author: Anthony Grieco
% Date: 11/16/2022
% Description: See "puzzle1.pdf" in Directory. Written in Answer Set Prolog (Clingo, Potassco Lab). 
% IMPORTANT NOTE: Because ASP cannot process floating point numbers, all values have been multiplied by 10 so that everything can be represented and manipulated as integers.

% Literals:
% screenSize(SS).
% processor(P).
% hardDisk(HD).
% price(M).
% computer(o1).
% computer(o2).
% computer(o3).
% computer(O4).
% computer(O5).
% computer(COMP1).
% priceType(price1).
% processorType(p3).

andrews(o1). % Used to describes the properties of Andrew's Computer
property(computerName, numericValue, attribute). % For a property of a particular computer, that computer has been assigned a specific "attribute" of "numericValue"

% Rules:
rule1 :- andrews(O1), property(O3, 215, screen), property(O3, P3, processor), property(O2, P3 + 4, processor), property(O1, Price1, price), property(O2, Price1 + 3000, price) . %% , computer(o1), computer(o2), computer(o3), priceType(price1), processorType(p3).
rule2 :- andrews(O1), not property(O1, 270, screen), property(O2, 20, processor), property(O3, 2500, hardDisk), property(O4, 11490, price), not property(O5, 150, screen), property(O1, HD1, hardDisk), property(O5, HD5, hardDisk), not property(O5, HD1, hardDisk), HD5 > HD1, not property(O5, 27, processor), property(COMP1, 27, processor), property(COMP1, HD_COMP1, hardDisk), HD5 < HD_COMP1.
rule3 :- property(O1, 3200, hardDisk), processorRule1(O1), processorRule2(O1), property(O2, 150, screen), property(O2, P2, processor), property(COMP1, 9990, price), property(COMP1, COMP_P1, processor), property(COMP2, 13490, processor), property(COMP2, COMP_P2, processor), P2 > COMP_P1, P2 < COMP_P2.
rule4 :- property(O1, 270, screen), not property(O1, 3200, hardDisk), property(O2, 5000, hardDisk), property(O2, P2, processor), property(O2, S2, screen), property(O3, P3, processor), property(O3, S3, screen), P2 > P3, S2 > S3, property(O3, 6990, price), not property(O3, 3200, hardDisk).

% For Rule 3: "O1" must be assigned either the 2.0 MHz or the 2.3 MHz Processor (Only one of them may be assigned to O1)
processorRule1(O1) :- property(O1, 20, processor), not processorRule2(O1).
processorRule2(O1) :- property(O1, 23, processor), not processorRule1(O1).
% processorRule1 :- not processorRule2.
% processorRule2 :- not processorRule1.

% Constraints: (The Statements defined in each of the Rules above must be true)
:- not rule1.
:- not rule2.
:- not rule3.
:- not rule4.

#show andrews/1.
% #show andrews.