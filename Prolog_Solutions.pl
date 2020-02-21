% 1. last element in a list.
last([H|T]) :- length(T,X),X=:=0,write(H).
last([H|T]) :- last(T).

% 2. 2nd last element in the list.
slast([H|T]) :- length(T,X),X=:=1,write(H).
slast([H|T]) :- slast(T).

% 3. Kth element in the list.
kth([H|T],K) :- K=:=1,write(H).
kth([H|T],K) :- K1 is K-1,kth(T,K1).

% 4. Number of elements in list.
count([],0).
count([H|T],C) :- count(T,C1),C is C1+1.

% 5. Reverse a list.
rever(X,L) :- reverse(X, L).

% 6. check if the list is palindrome.
ispal(L) :- reverse(L,X),X==L. 

% 7. Flatten a nested list structure.
my_flatten([],X) :- write(X).
my_flatten([H|T],X) :- \+(is_list(H)),append(X,[H],X1),my_flatten(T,X1).
my_flatten([H|T],X) :- is_list(H),append(X,H,X1),my_flatten(T,X1).

% 8. Remove duplicate elements.
unique([],C).
unique([A|_],C) :- C\=A.
compress([],[]).
compress([H|T],X) :- unique(T,H),append([H],X1,X),compress(T,X1).
compress([H|T],X) :- \+(unique(T,H)),append([],X1,X),compress(T,X1).

% 9. Pack consecutive duplicates of list elements into sublists.
subl(A,[],Y,R) :- append([],[A],Y),append([],[],R).
subl(A,[B|C],Y,R) :- A=B,subl(B,C,Y1,R),append([A],Y1,Y).
subl(A,[B|C],Y,R) :- A\=B,append([A],[],Y),append([],[B|C],R).
pack([],[]).
pack([H|T],X) :- subl(H,T,Y,R),pack(R,X1),append([Y],X1,X).

% 10. Run-length encoding of a list.
frequency(A,[],Y,R) :- Y=1,append([],[],R).
frequency(A,[B|C],Y,R) :- A=B,frequency(B,C,Y1,R),Y is Y1+1.
frequency(A,[B|C],Y,R) :- A\=B,Y=1,append([],[B|C],R).
encode([],[]).
encode([H|T],X) :- frequency(H,T,Y,R),encode(R,X1),append([[Y,H]],X1,X).


% 15. Duplicate elements of a list.
dupli([],[]).
dupli([H|T],X) :- append([H,H],X1,X),dupli(T,X1).

% 16. Duplicate elements of a list given number of times.
add(_,0,[]).
add(H,K,X) :- append([H],X1,X),K1 is K-1,add(H,K1,X1).
dupli([],_,X):-write(X).
dupli([H|T],K,X) :- add(H,K,X1),append(X,X1,Y),dupli(T,K,Y).


% 22. list containing all integers in a given range.
range(X,X,[X]).
range(X,Y,[X|L]) :- X=\=Y,X1 is X+1,range(X1,Y,L).





%//============================================================================================================================================//
%//=============================================================== Assignment 1 ================================================================//

% A1.find the sum of all even numbers in a list.
even(X) :- 0 is mod(X,2).
odd(X) :- 1 is mod(X,2). 
eSum([],0).
eSum([H|T],N) :- even(H),eSum(T,N1),N is N1+H.
eSum([H|T],N) :- odd(H),eSum(T,N1),N is N1.

% A2. count the number of occurences of number.
cnt(_,[],0).
cnt(C,[H|T],N) :- C=:=H,cnt(C,T,N1),N is N1+1.
cnt(C,[H|T],N) :- C=\=H,cnt(C,T,N1),N is N1.

% A3. reverse a number.
rev(N) :- N>0,C is mod(N,10),write(C),rev(N//10).
rev(N) :- N=:=0,nl.

%//============================================================================================================================================//
%//============================================================================================================================================//








%//=============================================================== Practice-Exam 1. ===============================================================//
%//============================================================================================================================================//

% 1. crdnlty(M, N) which means N is the number of distinct elements in multiset M.
unique(H,[]).
unique(H,[A|B]) :- H=\=A,unique(H,B).
crdnlty([],0).
crdnlty([H|T],N) :- unique(H,T),crdnlty(T,N1),N is N1+1.
crdnlty([H|T],N) :- \+(unique(H,T)),crdnlty(T,N1),N is N1.

% 2. crdnltyHigh(M, K, N) means there are N distinct elements in multiset M that occur K or more times.
count([],X,0).
count([X|T],X,Y):- count(T,X,Z), Y is 1+Z.
count([X1|T],X,Z):- X1\=X,count(T,X,Z).
crdnltyHigh([],K,0).
crdnltyHigh([H|T],K,N) :- count([H|T],H,A),A=:=K,crdnltyHigh(T,K,N1),N is N1+1.
crdnltyHigh([H|T],K,N) :- count([H|T],H,A),A=\=K,crdnltyHigh(T,K,N1),N is N1.



%//============================================================================================================================================//
%//============================================================================================================================================//
