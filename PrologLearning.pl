
memberof(A,[H|T]) :- A=H; memberof(A,T).

place(A) :- memberof(A,[1,2,3,4,5]).


appending(C, [], C).
appending([B|X],[B|TB],C) :- appending(X,TB,C).

lastof(X,[X]).
lastof(X,[_|T]) :- lastof(X,T).

sizeof( 0, [] ).
sizeof( X, [_|T] ) :- sizeof( Y, T ), X is Y+1.

%-----------------------------------------------------------

reverse([],[]).
reverse([H|T], B) :-
    reverse(T,R), append(R,[H], B).

palindrome(A) :- reverse(A,A).

left(A,B,_) :-  (B = [] ->  A=B).
left(A,B,C) :- C=< 0, A=B.
left(A,[HB|TB],C) :- C > 0, appending(B,TB,[HB]), left(A,B,C-1).


range(A,B,C) :- (B<C ,A = []),A=[HA|_], HA= B, range(A,B+1,C).
range([],B,C) :- B >=C.
range(A,B,C) :- B<C , K is B+1, A=[D|T], appending(D,[],B), range(T,K,C).



modzero([],_,[]).
modzero(A,B,[HC|HT]) :- (   0 is mod(B,HC) ->  
                        modzero(D,B,HT), A=[HC|D]
                        ; 
                        modzero(D,B,HT), A= D).

factors(A,B) :- range(H,2,B), modzero(A,B,H).
                                              

prime(X) :- X >1, factors(A,X), sizeof(0,A). 




visit(B,C,D,E,F) :-
place(B), B\=2, B\=3, B\=4,
place(C), C is 4,
place(D), D < 3,
place(F), F \= 3,
place(E), E is F+2,
list_to_set([B,C,D,E,F],Z), Z=[B,C,D,E,F].
