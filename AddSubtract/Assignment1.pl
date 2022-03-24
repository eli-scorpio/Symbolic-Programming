
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                 Assignment 1                      %%
%%    Author: Eligijus Skersonas   ID: 19335661  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% EXERCISES (COMMENTED) DIVIDED UP BELOW FROM LINE 66 ONWARDS
% Exercise 1 - Line 66
% Exercise 2 - Line 88
% Exercise 3 - Line 116
% Exercise 4 - Line 141
% Exercise 5 - Line 175
% Exercise 6 - Line 213

% CODE WITH ALL EXERCISES COMBINED

numeral(0).
numeral(s(X)) :- numeral(X).
numeral(p(X)) :- numeral(X).
numeral(X+Y) :- numeral(X), numeral(Y).
numeral(-X) :- numeral(X).
numeral(X-Y) :- numeral(X), numeral(Y).

add(0,X,X).                                   % Base Case
add(s(X),p(Y),Z) :- add(X,Y,Z).               % X > 0 && Y < 0 ; (+1) + (-1)
add(p(X),s(Y),Z) :- add(X,Y,Z).               % X < 0 && Y > 0 ; (-1) + (+1)
add(s(X),Y,s(Z)) :- Y \= p(_), add(X,Y,Z). % X > 0 && Y >= 0; (+1) + (+1)
add(p(X),Y,p(Z)) :- Y \= s(_), add(X,Y,Z). % X < 0 && Y <= 0; (-1) + (-1)

add2(X,Y,Z) :-    simplify(X, 0, AdjustedX), % simplify X
            simplify(Y, 0, AdjustedY), % simplify Y
            add(AdjustedX,AdjustedY,Z).% add X and Y

subtract(X,Y,Z) :- simplify(X,0,AdjustedX),% simplify X
               minus(Y,AdjustedY),       % minus Y
               add(AdjustedX,AdjustedY,Z).% add X and Y

minus(0,0).
minus(X,Y) :- X\=0, simplify(X,0,R), invert(R,Y).% simplify X and invert X

% How to use simplify/3 i.e simplify(X,Acc,Y) :
% This predicate is implemented using an accumulator
% When calling simplify for the first time you MUST initialise Acc to 0
% and intialise X to whatever you want to simplify e.g simplify(s(p(0)),0,Y).
simplify(0,Acc,R) :- R = Acc.                    % Base Case R = accumulator
simplify(-X,Acc,R) :- simplify(X,Acc,Y), invert(Y,R).      % simplify & invert
simplify(s(X),Acc,R) :- Acc \= p(_), simplify(X,s(Acc),R).% add s to Acc
simplify(p(X),Acc,R) :- Acc \= s(_), simplify(X,p(Acc),R).% add p to Acc
simplify(s(X),p(Acc),R) :- simplify(X,Acc,R).              % remove p from Acc
simplify(p(X),s(Acc),R) :- simplify(X,Acc,R).              % remove s from Acc
simplify(X+Y,Acc,R) :- simplify(X,Acc,AdjustedX),  % simplify X then
                   simplify(Y,AdjustedX,R).       % simplify Y with Acc
                                               % initialised to AdjustedX
simplify(X-Y,Acc,R) :- simplify(X,Acc,AdjustedX),  % simplify X
                   minus(Y,AdjustedY),           % minus Y
                   add(AdjustedX,AdjustedY,R). % add adjusted X and Y

% simple predicate to invert X e.g invert(s(0),R) gives R = p(0)
invert(0,0).
invert(p(X),s(Y)) :- invert(X,Y).
invert(s(X),p(Y)) :- invert(X,Y).



%%%%%%%%%%%%%%%%
%% Exercise 1 %%
%%%%%%%%%%%%%%%%

%numeral(0).
%numeral(s(X)) :- numeral(X).
%numeral(X+Y) :- numeral(X), numeral(Y).

%add(0,X,X).
%add(s(X),Y,s(Z)) :- add(X,Y,Z).

%simplify(0,0).
%simplify(s(X),s(Y)) :- simplify(X,Y).
%simplify(X+Y,Z) :- simplify(X,FormatX),
%                       simplify(Y,FormatY),
%                       add(FormatX,FormatY,Z).

%add2(X,Y,Z) :-    simplify(X,FormatX),
%                simplify(Y,FormatY),
%                add(FormatX,FormatY,Z).


%%%%%%%%%%%%%%%%
%% Exercise 2 %%
%%%%%%%%%%%%%%%%

%numeral(0).
%numeral(s(X)) :- numeral(X).
%numeral(p(X)) :- numeral(X).
%numeral(X+Y) :- numeral(X), numeral(Y).

%add(0,X,X).
%add(s(X),p(Y),Z) :- add(X,Y,Z).
%add(p(X),s(Y),Z) :- add(X,Y,Z).
%add(s(X),Y,s(Z)) :- Y \= p(_), add(X,Y,Z).
%add(p(X),Y,p(Z)) :- Y \= s(_), add(X,Y,Z).

%simplify(0,Acc,Z) :- Z = Acc.
%simplify(s(X),Acc,R) :- Acc \= p(_), simplify(X,s(Acc),R).
%simplify(p(X),Acc,R) :- Acc \= s(_), simplify(X,p(Acc),R).
%simplify(s(X),p(Acc),R) :- simplify(X,Acc,R).
%simplify(p(X),s(Acc),R) :- simplify(X,Acc,R).
%simplify(X+Y,Acc,Z) :- simplify(X,Acc,FormatX),
%                       simplify(Y,FormatX,Z).

%add2(X,Y,Z) :-    simplify(X, 0, AdjustedX),
%                simplify(Y, 0, AdjustedY),
%                add(AdjustedX,AdjustedY,Z).


%%%%%%%%%%%%%%%%
%% Exercise 3 %%
%%%%%%%%%%%%%%%%

%numeral(0).
%numeral(s(X)) :- numeral(X).
%numeral(p(X)) :- numeral(X).
%numeral(X+Y) :- numeral(X), numeral(Y).

%simplify(0,Acc,Z) :- Z = Acc.
%simplify(s(X),Acc,R) :- Acc \= p(_), simplify(X,s(Acc),R).
%simplify(p(X),Acc,R) :- Acc \= s(_), simplify(X,p(Acc),R).
%simplify(s(X),p(Acc),R) :- simplify(X,Acc,R).
%simplify(p(X),s(Acc),R) :- simplify(X,Acc,R).
%simplify(X+Y,Acc,Z) :- simplify(X,Acc,FormatX),
%                       simplify(Y,FormatX,Z).

%invert(0,0).
%invert(p(X),s(Y)) :- invert(X,Y).
%invert(s(X),p(Y)) :- invert(X,Y).

%minus(0,0).
%minus(X,Y) :- simplify(X,0,R), invert(R,Y).


%%%%%%%%%%%%%%%%
%% Exercise 4 %%
%%%%%%%%%%%%%%%%

%numeral(0).
%numeral(s(X)) :- numeral(X).
%numeral(p(X)) :- numeral(X).
%numeral(X+Y) :- numeral(X), numeral(Y).
%numeral(-X) :- numeral(X).

%add(0,X,X).
%add(s(X),p(Y),Z) :- add(X,Y,Z).
%add(p(X),s(Y),Z) :- add(X,Y,Z).
%add(s(X),Y,s(Z)) :- Y \= p(_), add(X,Y,Z).
%add(p(X),Y,p(Z)) :- Y \= s(_), add(X,Y,Z).

%simplify(0,Acc,Z) :- Z = Acc.
%simplify(-X,Acc,R) :- simplify(X,Acc,Y), invert(Y,R).
%simplify(s(X),Acc,R) :- Acc \= p(_), simplify(X,s(Acc),R).
%simplify(p(X),Acc,R) :- Acc \= s(_), simplify(X,p(Acc),R).
%simplify(s(X),p(Acc),R) :- simplify(X,Acc,R).
%simplify(p(X),s(Acc),R) :- simplify(X,Acc,R).
%simplify(X+Y,Acc,Z) :- simplify(X,Acc,FormatX),
%                       simplify(Y,FormatX,Z).

%invert(0,0).
%invert(p(X),s(Y)) :- invert(X,Y).
%invert(s(X),p(Y)) :- invert(X,Y).

%add2(X,Y,Z) :-    simplify(X, 0, AdjustedX),
%                simplify(Y, 0, AdjustedY),
%                add(AdjustedX,AdjustedY,Z).


%%%%%%%%%%%%%%%%
%% Exercise 5 %%
%%%%%%%%%%%%%%%%


%numeral(0).
%numeral(s(X)) :- numeral(X).
%numeral(p(X)) :- numeral(X).
%numeral(X+Y) :- numeral(X), numeral(Y).
%numeral(-X) :- numeral(X).

%add(0,X,X).
%add(s(X),p(Y),Z) :- add(X,Y,Z).
%add(p(X),s(Y),Z) :- add(X,Y,Z).
%add(s(X),Y,s(Z)) :- Y \= p(_), add(X,Y,Z).
%add(p(X),Y,p(Z)) :- Y \= s(_), add(X,Y,Z).

%subtract(X,Y,Z) :- simplify(X,0,AdjustedX),
%                   minus(Y,AdjustedY),
%                   add(AdjustedX,AdjustedY,Z).

%minus(0,0).
%minus(X,Y) :- simplify(X,0,R), invert(R,Y).

%simplify(0,Acc,Z) :- Z = Acc.
%simplify(-X,Acc,R) :- simplify(X,Acc,Y), invert(Y,R).
%simplify(s(X),Acc,R) :- Acc \= p(_), simplify(X,s(Acc),R).
%simplify(p(X),Acc,R) :- Acc \= s(_), simplify(X,p(Acc),R).
%simplify(s(X),p(Acc),R) :- simplify(X,Acc,R).
%simplify(p(X),s(Acc),R) :- simplify(X,Acc,R).
%simplify(X+Y,Acc,Z) :- simplify(X,Acc,FormatX),
%                       simplify(Y,FormatX,Z).

%invert(0,0).
%invert(p(X),s(Y)) :- invert(X,Y).
%invert(s(X),p(Y)) :- invert(X,Y).


%%%%%%%%%%%%%%%%
%% Exercise 6 %%
%%%%%%%%%%%%%%%%


%numeral(0).
%numeral(s(X)) :- numeral(X).
%numeral(p(X)) :- numeral(X).
%numeral(X+Y) :- numeral(X), numeral(Y).
%numeral(-X) :- numeral(X).
%numeral(X-Y) :- numeral(X), numeral(Y).

%add(0,X,X).
%add(s(X),p(Y),Z) :- add(X,Y,Z).
%add(p(X),s(Y),Z) :- add(X,Y,Z).
%add(s(X),Y,s(Z)) :- Y \= p(_), add(X,Y,Z).
%add(p(X),Y,p(Z)) :- Y \= s(_), add(X,Y,Z).

%add2(X,Y,Z) :-    simplify(X, 0, AdjustedX),
%                simplify(Y, 0, AdjustedY),
%                add(AdjustedX,AdjustedY,Z).

%subtract(X,Y,Z) :- simplify(X,0,AdjustedX),
%                   minus(Y,AdjustedY),
%                   add(AdjustedX,AdjustedY,Z).

%minus(0,0).
%minus(X,Y) :- simplify(X,0,R), invert(R,Y).

%simplify(0,Acc,R) :- R = Acc.
%simplify(-X,Acc,R) :- simplify(X,Acc,Y), invert(Y,R).
%simplify(s(X),Acc,R) :- Acc \= p(_), simplify(X,s(Acc),R).
%simplify(p(X),Acc,R) :- Acc \= s(_), simplify(X,p(Acc),R).
%simplify(s(X),p(Acc),R) :- simplify(X,Acc,R).
%simplify(p(X),s(Acc),R) :- simplify(X,Acc,R).
%simplify(X+Y,Acc,R) :- simplify(X,Acc,AdjustedX),
%                       simplify(Y,AdjustedX,R).
%simplify(X-Y,Acc,R) :- simplify(X,Acc,AdjustedX),
%                       minus(Y,AdjustedY),
%                       add(AdjustedX,AdjustedY,R).

%invert(0,0).
%invert(p(X),s(Y)) :- invert(X,Y).
%invert(s(X),p(Y)) :- invert(X,Y).
