% 1. last element in a list.
my_last(H,[H|[]]).
my_last(X,[H|T]) :- my_last(X,T).

% 2. 2nd last element in the list.
slast(H,[H|T]) :- length(T,Y),Y=:=1.
slast(X,[H|T]) :- slast(X,T).

% 3. Kth element in the list.
element_at(H,[H|T],K) :- K=:=1.
element_at(X,[H|T],K) :- K1 is K-1,element_at(X,T,K1).

% 4. Number of elements in list.
count([],0).
count([H|T],C) :- count(T,C1),C is C1+1.

% 5. Reverse a list.
rever([],[]).
rever(X,[H|T]) :- rever(X1,T),append(X1,[H],X).

% 6. check if the list is palindrome.
ispal(L) :- rever(X,L),X==L. 

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

% 11.  Modified run-length encoding.
freq(A,[],Y,R) :- Y=1,append([],[],R).
freq(A,[B|C],Y,R) :- A=B,freq(B,C,Y1,R),Y is Y1+1.
freq(A,[B|C],Y,R) :- A\=B,Y=1,append([],[B|C],R).
encode_modified([],[]).
encode_modified([H|T],X) :- freq(H,T,Y,R),encode_modified(R,X1),Y\=1,append([[Y,H]],X1,X).
encode_modified([H|T],X) :- freq(H,T,Y,R),encode_modified(R,X1),Y=1,append([H],X1,X).

% 12. Decode a run-length encoded list.
unwrap([0|_],[]). 
unwrap([A|B],X) :- A\=0,A1 is A-1,unwrap([A1|B],X1),append(B,X1,X).
decode([],[]).
decode([H|T],X) :- is_list(H),unwrap(H,Y),decode(T,X1),append(Y,X1,X).
decode([H|T],X) :- \+(is_list(H)),decode(T,X1),append([H],X1,X).

% 13. Same as 11.

% 14. Duplicate elements of a list.
dupli([],[]).
dupli([H|T],X) :- append([H,H],X1,X),dupli(T,X1).

% 15. Duplicate elements of a list given number of times.
add(_,1,[]).
add(H,K,X) :- append([H],X1,X),K1 is K-1,add(H,K1,X1).
dupli([],_,X):-write(X).
dupli([H|T],K,X) :- add(H,K,X1),append(X,X1,Y),dupli(T,K,Y).

% 16. Drop every N'th element from a list.
drop([H|T],0,[H]).
drop([H|T],N,X) :- N1 is N-1,N1\=0,drop(T,N1,X1),append([H],X1,X).
drop([H|T],N,X) :- N1 is N-1,N1=0,drop(T,N1,X1),append([],X1,X).

% 17. Split a list into two parts; the length of the first part is given.
split([H|T],0,[],[H|T]).
split([H|T],N,L1,L2) :- N\=0,N1 is N-1,split(T,N1,L,L2),append([H],L,L1). 

% 18. Extract a slice from a list.
slice(_,1,0,[]).
slice([H|T],I,K,L) :- I\=1,I1 is I-1,K1 is K-1,slice(T,I1,K1,L).
slice([H|T],1,K,L) :- K\=0,K1 is K-1,slice(T,I1,K1,L1),append([H],L1,L).

% 19. Rotate a list N places to the left.
apnd([A|B],0,[],[A|B]).
apnd([A|B],C,L,R) :- C1 is C-1,apnd(B,C1,L1,R),append([A],L1,L).
rotate([H|T],N,X) :- N<0,length(T,Y),N1 is 1+N+Y,rotate([H|T],N1,X).
rotate([H|T],N,X) :- N>=0,apnd([H|T],N,L,R),append(R,L,X).

% 20. Remove the k'th element from a list.
remove_at(H,[H|T],1,T).
remove_at(X,[H|T],N,R) :- N1 is N-1,remove_at(X,T,N1,R1),append([H],R1,R).

% 21. Insert an element at a given position into a list.
insert_at(X,T,1,[X|T]).
insert_at(X,[H|T],N,L) :- N1 is N-1,insert_at(X,T,N1,L1),append([H],L1,L).


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



%//============================================================================================================================================//
%//================================================================= Assignment 2 =============================================================//


% 1. splt(N, List, Left, Right)  - splits a list of length >= N into two parts Left and Right at position N.
splt(1, [A|R], [A], R).
splt(N, [A|R], [A|L1], L2) :- N > 1, N1 is N - 1, splt(N1, R, L1, L2).

% 2. number_codes which  splits a number- 479- into a list of integers- one for each digit- starting from 48 for 0, 49 for 1 and so on..
number_codes(0,[]).
number_codes(N,X) :- N\=0,number_codes(N\\10,X1),T1 is mod(N,10)+48,append([T1],X1,X).




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
