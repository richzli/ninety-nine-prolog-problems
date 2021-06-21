/* 1.01 (*  ) - Find the last element of a list. */
is_empty([]).
list_last(_, []) :- false.
list_last(X, [X|T]) :- is_empty(T).
list_last(X, [_|T]) :- not(is_empty(T)), my_last(X, T).

/* 1.02 (*  ) - Find the second-to-last element of a list. */
is_length_one([_|T]) :- is_empty(T).
second_to_last(X, [X|T]) :- is_length_one(T).
second_to_last(X, [_|T]) :- not(is_length_one(T)), second_to_last(X, T).

/* 1.03 (*  ) - Find the k-th element of a list. */
element_at(X, [X|_], K) :- K = 1.
element_at(X, [_|T], K) :- K > 1, element_at(X, T, K-1).

/* 1.04 (*  ) - Find the number of elements of a list. */
list_length(1, [_|T]) :- is_empty(T).
list_length(X, [_|T]) :- not(is_empty(T)), list_length(Y, T), X is Y+1.

/* 1.05 (*  ) - Reverse a list. */
concat(B, [], B).
concat([H|T], [H|A], B) :- concat(T, A, B).
list_reverse([H], [H|T]) :- is_empty(T).
list_reverse(X, [H|T]) :- not(is_empty(T)), list_reverse(X1, T), concat(X, X1, [H]).

/* 1.06 (*  ) - Find whether the list is a palindrome. */
palindrome(L) :- list_reverse(L, L).

/* 1.07 (** ) - Flatten a nested list structure. */
list_flatten([], []).
list_flatten([H|R], [H|T]) :- not(is_list(H)), list_flatten(R, T).
list_flatten(X, [H|T]) :- is_list(H), list_flatten(H1, H), list_flatten(T1, T), concat(X, H1, T1).

/* 1.08 (** ) - Eliminate consecutive duplicates of list elements. */
compress(X, [H|T]) :- compress(X1, H, T), concat(X, [H], X1).
compress([], _, []).
compress(X, H, [H|T]) :- compress(X, H, T).
compress(X, A, [H|T]) :- A \= H, compress(X1, H, T), concat(X, [H], X1).