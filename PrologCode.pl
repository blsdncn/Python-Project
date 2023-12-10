reverse_list([],[]).
reverse_list([Head|Tail],Reversed) :-
    reverse_list(Tail, RevTail),
    append(RevTail,[Head], Reversed).

main :-
read(Input),
reverse_list(Input,Result),
write(Result).
