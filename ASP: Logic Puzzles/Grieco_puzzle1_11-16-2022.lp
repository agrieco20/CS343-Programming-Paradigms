% Author: Anthony Grieco
% Date: 11/16/2022
% Description: See "puzzle1.pdf" in Directory. Written in Answer Set Prolog (Clingo, Potassco Lab). 
% IMPORTANT NOTE: Because ASP cannot process floating point numbers, the "processor" and "screen" values been multiplied by 10 so that everything of that particular type can be represented and manipulated as integers (because ASP cannot handle decimals).

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

% andrews(o1). % Used to describes the properties of Andrew's Computer
% property(computerName, numericValue, attribute). % For a property of a particular computer, that computer has been assigned a specific "attribute" of "numericValue"

screen(130; 150; 156; 215; 270).
processor(20; 23; 25; 27; 31).
hardDisk(250; 320; 500; 750; 1024).
price(699; 999; 1149; 1349; 1649).

computerName(one; two; three; four; five).

% Every type of computer ("computerType") is assigned particular values (screen, processor, hardDisk and price) that describe it
1{computerType(ComputerName, Screen, Processor, HardDisk, Price): screen(Screen), processor(Processor), hardDisk(HardDisk), price(Price)}1 :- computerName(ComputerName).

% There is only one type of coffee each (each with their own unique Name, Price, Temperature, and Steep Time)
:- computerType(C1, Screen, _, _, _), computerType(C2, Screen, _, _, _), computerName(C1), computerName(C2), screen(Screen), C1 != C2.
:- computerType(C1, _, Processor, _, _), computerType(C2, _, Processor, _, _), computerName(C1), computerName(C2), processor(Processor), C1 != C2.
:- computerType(C1, _, _, HardDisk, _), computerType(C2, _, _, HardDisk, _), computerName(C1), computerName(C2), hardDisk(HardDisk), C1 != C2.
:- computerType(C1, _, _, _, Price), computerType(C2, _, _, _, Price), computerName(C1), computerName(C2), price(Price), C1 != C2.


% Rules:

% Rule 1:
rule1 :- computerType(C1, C1_Screen, C1_Processor, C1_HardDisk, C1_Price),
        computerType(C2, C2_Screen, C2_Processor, C2_HardDisk, C2_Price),
        computerType(C3, 215, C3_Processor, C3_HardDisk, C3_Price),
        
        C2_Price = C1_Price + 300,
        C1_Price != 1649,
        C2_Price != 699, 
        C2_Price != 1149,
        C2_Price != 1349, 

        C2_Processor = C3_Processor + 4,
        C3_Processor != 31,
        C2_Processor != 20,
        C2_Processor != 23,
        C2_Processor != 25,

        computerName(C1), computerName(C2), computerName(C3), screen(C1_Screen), screen(C2_Screen), processor(C1_Processor), processor(C2_Processor), processor(C3_Processor), hardDisk(C1_HardDisk), hardDisk(C2_HardDisk), hardDisk(C3_HardDisk), price(C1_Price), price(C2_Price), price(C3_Price).
        % computerName(C2), computerName(C3), screen(C2_Screen), processor(C2_Processor), processor(C3_Processor), hardDisk(C2_HardDisk), hardDisk(C3_HardDisk), price(C2_Price), price(C3_Price).

    :- not rule1.

%%% % TEST
%%% rule1 :- computerType(C1, 130, Processor, HardDisk, Price), processor(Processor), hardDisk(HardDisk), price(Price).
%%%     :- not rule1.

    % :- andrews

% rule1 :- andrews(O1), property(O3, 215, screen), property(O3, P3, processor), property(O2, P3 + 4, processor), property(O1, Price1, price), property(O2, Price1 + 3000, price) . %% , computer(o1), computer(o2), computer(o3), priceType(price1), processorType(p3).

% Rule 2:
% rule2 :- computerType(C1, C1_Screen, C1_Processor, C1_HardDisk, C1_Price), %ANDREWS
%         C1_Screen != 270,
%         computerType(C2, C2_Screen, 20, C2_HardDisk, C2_Price),
%         computerType(C3, C3_Screen, C3_Processor, 250, C3_Price),
%         computerType(C4, C4_Screen, C4_Processor, C4_HardDisk, 1149),
%         computerType(C5, C5_Screen, C5_Processor, C5_HardDisk, C5_Price),
%         C5_Screen != 150,

%         C5_HardDisk > C1_HardDisk,

%         computerType(C6, C6_Screen, 27, C6_HardDisk, C6_Price),

%         C5_HardDisk < C6_HardDisk,

%         computerName(C1;C2;C3;C4;C5;C6), screen(C1_Screen; C2_Screen; C3_Screen; C4_Screen; C5_Screen; C6_Screen), processor(C1_Processor; C3_Processor; C4_Processor; C5_Processor), hardDisk(C1_HardDisk; C2_HardDisk; C4_HardDisk; C5_HardDisk; C6_HardDisk), price(C1_Price; C2_Price; C3_Price; C5_Price; C6_Price).

%     :- not rule2.

        

% rule2 :- andrews(O1), not property(O1, 270, screen), property(O2, 20, processor), property(O3, 2500, hardDisk), property(O4, 11490, price), not property(O5, 150, screen), property(O1, HD1, hardDisk), property(O5, HD5, hardDisk), not property(O5, HD1, hardDisk), HD5 > HD1, not property(O5, 27, processor), property(COMP1, 27, processor), property(COMP1, HD_COMP1, hardDisk), HD5 < HD_COMP1.
% rule3 :- property(O1, 3200, hardDisk), processorRule1(O1), processorRule2(O1), property(O2, 150, screen), property(O2, P2, processor), property(COMP1, 9990, price), property(COMP1, COMP_P1, processor), property(COMP2, 13490, processor), property(COMP2, COMP_P2, processor), P2 > COMP_P1, P2 < COMP_P2.
% rule4 :- property(O1, 270, screen), not property(O1, 3200, hardDisk), property(O2, 5000, hardDisk), property(O2, P2, processor), property(O2, S2, screen), property(O3, P3, processor), property(O3, S3, screen), P2 > P3, S2 > S3, property(O3, 6990, price), not property(O3, 3200, hardDisk).

% For Rule 3: "O1" must be assigned either the 2.0 MHz or the 2.3 MHz Processor (Only one of them may be assigned to O1)
% processorRule1(O1) :- property(O1, 20, processor), not processorRule2(O1).
% processorRule2(O1) :- property(O1, 23, processor), not processorRule1(O1).
%%% % processorRule1 :- not processorRule2.
%%% % processorRule2 :- not processorRule1.

% Constraints: (The Statements defined in each of the Rules above must be true)
% :- not rule1.
% :- not rule2.
% :- not rule3.
% :- not rule4.

% #show andrews/1.
% #show andrews.

% Ensures that each coffeeType can only be assigned to one coffeeValue
computer1 :- computerType(one, 130, Processor, HardDisk, Price), processor(Processor), hardDisk(HardDisk), price(Price).
computer2 :- computerType(two, 150, Processor, HardDisk, Price), processor(Processor), hardDisk(HardDisk), price(Price).
computer3 :- computerType(three, 156, Processor, HardDisk, Price), processor(Processor), hardDisk(HardDisk), price(Price).
computer4 :- computerType(four, 215, Processor, HardDisk, Price), processor(Processor), hardDisk(HardDisk), price(Price).
computer5 :- computerType(five, 270, Processor, HardDisk, Price), processor(Processor), hardDisk(HardDisk), price(Price).

:- not computer1.
:- not computer2.
:- not computer3.
:- not computer4.
:- not computer5.

#show computerType/5.
% #show andrews/5