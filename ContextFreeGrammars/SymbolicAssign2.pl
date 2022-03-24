%%%%%%%%%%%%%%
% QUESTION 1 %
%%%%%%%%%%%%%%
% DCG
nbd --> member(One), member(Two), member(Three), {notEqual(One,Two,Three)}.
member(Info) --> [h(X,Y,Z)], {lex(X,col), lex(Y,nat), lex(Z,pet), Info=h(X,Y,Z)}.

% LEXICON
%   COLOURS    %   NATIONALITIES   %      PETS        %
lex(red,   col). lex(japanese, nat).  lex(snail,  pet).
lex(green, col). lex(spanish,  nat).  lex(jaguar, pet).
lex(blue,  col). lex(english,  nat).  lex(zebra,  pet).

% Helper Predicates to check for non-equality of members 
% eg. not the same pet, not the same colour, not the same nationality
notEqual(A,B,C) :- notEqual2(A,B),notEqual2(B,C),notEqual2(A,C).
notEqual2(h(Col,Nat,Pet), h(Col2,Nat2,Pet2)) :- Col \= Col2,
  									   			Nat \= Nat2,
  									   			Pet \= Pet2.


%%%%%%%%%%%%%%
% QUESTION 2 %
%%%%%%%%%%%%%%
% Base Case [0,1]
fib --> prev2, prev1, fib2(0,1). % A-B = [0], B-C = [1], C-D = fib2(0,1)
prev2 --> [0].
prev1 --> [1].
fib2(_,_) --> []. % end fibonacci list
fib2(Prev2, Prev1) --> {NewEntry is Prev2+Prev1,  % NewEntry = Prev2+Prev1
                        Prv2 is Prev1,			  % Prv2 = Prev1
                        Prv1 is Prev2+Prev1},     % Prv1 = Prev2+Prev1
    				   [NewEntry], 				  % A-B = Prev2+Prev1
                       fib2(Prv2,Prv1).			  % B-C = fib2(Prv2,Prv1) 


%%%%%%%%%%%%%%
% QUESTION 3 %
%%%%%%%%%%%%%%
%
%%%%%%%%%%%%
%% PART A %%
%%%%%%%%%%%%
% Code Provided
accept(N,String) :- steps(N,q0,String,Q), final(N,Q).
steps(_,Q,[],Q).
steps(N,Q1,[H|T],Q2) :- tran(N,Q1,H,Q), steps(N,Q,T,Q2).

% N must be > 0 for all transitions

% initial state
tran(N,q0,1,q(Nn)) :- N > 0, Nn is N - 1. % 1 -> go to state q(N-1)
tran(N,q0,0,q0) :- N > 0.				  % 0 -> go to q0 no decrement
tran(N,q0,1,q0) :- N > 0.				  % 1 -> go to q0 no decrement
% states
tran(_,q(N),0,q(Nn)) :- N > 0, Nn is N - 1. % 0 -> go to state q(N-1)
tran(_,q(N),1,q(Nn)) :- N > 0, Nn is N - 1. % 1 -> go to state q(N-1)
% final state
final(_,q(0)).

%%%%%%%%%%%%
%% PART B %%
%%%%%%%%%%%%
% Produces the grammar (0+1)*1(0+1)^n-1
% N must be > 0 for all transitions
% initial states
s(N) --> {N > 0, Nn is N-1}, [1], q(Nn).
s(N) --> {N > 0}, [0], s(N).
s(N) --> {N > 0}, [1], s(N).
% states
q(N) --> {N > 0, Nn is N-1}, [0], q(Nn).
q(N) --> {N > 0, Nn is N-1}, [1], q(Nn).
% final state
q(0) --> [].

%%%%%%%%%%%%
%% PART C %%
%%%%%%%%%%%%
% Modified s predicate
% initial
s2(N) --> {N > 0, Nn is N-1}, [1], q2(Nn).
s2(N) --> {N > 0}, [0], s2(N).
s2(N) --> {N > 0}, [1], s2(N).
% states
q2(N) --> {N > 0, Nn is N-1}, [0], q2(Nn).
q2(N) --> {N > 0, Nn is N-1}, [1], q2(Nn).
% final state
q2(0) --> [], {sub}.

% decrement counter
sub :- nb_getval(counter, C), Cc is C-1, nb_setval(counter, Cc).

% set ith word from the language (0+1)*1(0+1)^n-1
ith(I,N,A) :- nb_setval(counter,I), s2(N,A,[]), nb_getval(counter,C), C == 0, !.

% base case
initial(0,_,[]).  
% get initial I words from language (0+1)*1(0+1)^n-1
initial(I,N,[H|T]) :- I > 0, ith(I,N,H), Ii is I-1, initial(Ii,N,T).

