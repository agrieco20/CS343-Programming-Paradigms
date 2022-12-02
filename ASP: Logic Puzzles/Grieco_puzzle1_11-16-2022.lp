% Author: Anthony Grieco
% Date: 11/16/2022
% Description: See "puzzle1.pdf" in Directory. Written in Answer Set Prolog (Clingo, Potassco Lab). 
% IMPORTANT NOTE: Because ASP cannot process floating point numbers, the "processor" and "screen" values been multiplied by 10 so that everything of that particular type can be represented and manipulated as integers (because ASP cannot handle decimals).

screen(130; 150; 156; 215; 270).
processor(20; 23; 25; 27; 31).
hardDisk(250; 320; 500; 750; 1024).
price(699; 999; 1149; 1349; 1649).

computerName(one; two; three; four; five).

% andrews(ComputerName, Screen, Processor, HardDisk, Price), computerName(ComputerName), screen(Screen), processor(Processor), hardDisk(HardDisk), price(Price).

% 1{andrews(ComputerName, Screen, Processor, HardDisk, Price): screen(Screen), processor(Processor), hardDisk(HardDisk), price(Price)}1 :- computerName(ComputerName).

% Every type of computer ("computerType") is assigned particular values (screen, processor, hardDisk and price) that describe it
1{computerType(ComputerName, Screen, Processor, HardDisk, Price): screen(Screen), processor(Processor), hardDisk(HardDisk), price(Price)}1 :- computerName(ComputerName).

% There is only one type of coffee each (each with their own unique Name, Price, Temperature, and Steep Time)
:- computerType(C1, Screen, _, _, _), computerType(C2, Screen, _, _, _), computerName(C1), computerName(C2), screen(Screen), C1 != C2.
:- computerType(C1, _, Processor, _, _), computerType(C2, _, Processor, _, _), computerName(C1), computerName(C2), processor(Processor), C1 != C2.
:- computerType(C1, _, _, HardDisk, _), computerType(C2, _, _, HardDisk, _), computerName(C1), computerName(C2), hardDisk(HardDisk), C1 != C2.
:- computerType(C1, _, _, _, Price), computerType(C2, _, _, _, Price), computerName(C1), computerName(C2), price(Price), C1 != C2.

% Rules:

% Rule 1:
rule1 :- computerType(C1, _, _, _, C1_Price), %ANDREWS
        computerType(C2, _, C2_Processor, _, C2_Price),
        computerType(C3, 215, C3_Processor, _, _),
        
        C2_Price = C1_Price + 300,
        C2_Processor = C3_Processor + 4,

        % andrews(C1, _, _, _, C1_Price), % Defines which is Andrews Computer

        computerName(C1), computerName(C2), computerName(C3), processor(C2_Processor), processor(C3_Processor), price(C1_Price), price(C2_Price).

    :- not rule1.

% % Rule 2:
% rule2 :- computerType(_, C1_Screen, C1_Processor, C1_HardDisk, C1_Price), %ANDREWS
%         not C1_Screen = 270,

%         %%%% Next 3 lines cause miniconda to bug out
%         % computerType(C2, _, 20, _, _),
%         % computerType(C3, _, _, 250, _),
%         % computerType(C4, _, _, _, 1149),

%         % %%%%---------
%         %Work around for the above 3 lines of code causing the program to lag out (likely too many variables):
%         C1_Processor != 20,
%         C5_Processor != 20,

%         C1_HardDisk != 250,
%         C5_HardDisk != 250, 
%         C6_HardDisk != 250,
        
%         C1_Price != 1149,
%         C5_Price != 1149,
%         C6_Price != 1149,
%         % %%%%---------

%         computerType(_, C5_Screen, C5_Processor, C5_HardDisk, C5_Price),
%         not C5_Screen = 150,

%         C5_HardDisk > C1_HardDisk,

%         computerType(_, _, 27, C6_HardDisk, C6_Price),

%         C5_HardDisk < C6_HardDisk,

%         % computerName(C1;C2;C3;C4;C5;C6), screen(C1_Screen; C5_Screen), processor(C1_Processor; C5_Processor), hardDisk(C1_HardDisk; C5_HardDisk; C6_HardDisk).
%         % computerName(C1;C5;C6), screen(C1_Screen; C5_Screen), processor(C1_Processor; C5_Processor), hardDisk(C1_HardDisk; C5_HardDisk; C6_HardDisk).%, price(C1_Price).%price(C1_Price; C5_Price; C6_Price).
%         screen(C1_Screen; C5_Screen), processor(C1_Processor;C5_Processor), hardDisk(C1_HardDisk; C5_HardDisk; C6_HardDisk), price(C1_Price; C5_Price; C6_Price).


%     :- not rule2.
    
%     % %Work around for the above 3 lines of code causing the program to lag out (likely too many variables):
%     :- computerType(ComputerName, _, 20, 250, _), computerName(ComputerName).
%     % :- computerType(ComputerName, _, 20, _, 1149), computerName(ComputerName).
%     :- computerType(ComputerName, _, _, 250, 1149), computerName(ComputerName).
%     % rule2_2 :- computerType(ComputerName, _, 20, 250, _), computerName(ComputerName).
%     % rule2_3 :- computerType(ComputerName, _, 20, _, 1149), computerName(ComputerName).
%     % rule2_4 :- computerType(ComputerName, _, _, 250, 1149), computerName(ComputerName).
%     % :- not rule2_2.
%     % :- not rule2_3.
%     % :- not rule2_4.

% % rule2_2 :- computerType(C2, _, 20, _, _),
% %         computerType(C3, _, _, 250, _),
% %         computerType(C4, _, _, _, 1149),
% %         computerName(C2;C3;C4).
% %     :- not rule2_2.

% Rule 3:
rule3_1 :- computerType(ComputerName, Screen, 20, 320, Price),
        computerName(ComputerName), screen(Screen), price(Price).

rule3_1 :- computerType(ComputerName, Screen, 23, 320, Price),
        computerName(ComputerName), screen(Screen), price(Price).
    
    :- not rule3_1.

rule3_2 :- computerType(C1, 150, C1_Processor, _, _),
    computerType(C2, _, C2_Processor, _, 999),
    computerType(C3, _, C3_Processor, _, 1349),
    
    C1_Processor > C2_Processor,
    C1_Processor < C3_Processor,

    computerName(C1; C2; C3), processor(C1_Processor; C2_Processor; C3_Processor).

    :- not rule3_2.

% Rule 4:
:- computerType(ComputerName, 270, _, 320, _).

rule4 :- computerType(C1, C1_Screen, C1_Processor, 500, _),
    computerType(C2, C2_Screen, C2_Processor, _, 699),

    C1_Screen > C2_Screen,
    C1_Processor > C2_Processor,

    computerName(C1; C2), screen(C1_Screen; C2_Screen), processor(C1_Processor; C2_Processor).

    :- not rule4.

:- computerType(ComputerName, 320, _, _, 699).

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
% #show andrews/5.