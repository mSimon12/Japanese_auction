seller(none).
buyers([]).
started(false).
in([]).
finished(false).

!start.

@l0[atomic]
+!register(seller)[source(N)] <- 
    -+seller(N);
    .print(N, " is registed as a seller").

@l1[atomic]
+!register(buyer)[source(N)] : buyers(B) <- 
    .concat(B, [N], NB);
    -+buyers(NB);
    .print(N, " is registed as a buyer").

+!start <- 
    .print("Preparing to start");
    .wait(1000);
    .print("Starting...");
    !go.

+!go : seller(S) <-
    .send(S, achieve, speak).

+!price(P)[source(S)] : seller(S) &
                        buyers(B) &
                        started(false) 
                        <-
        -+started(true);
        .send(B, achieve, startPrice(P)).

@l2[atomic]
+!join[source(N)] : in(I) <- 
    .concat(I, [N], IB);
    -+in(IB);
    .print(N, " has joined").

+!price(P)[source(S)] : seller(S) &
                        in(B) &
                        started(true) 
                        <-
        .send(B, achieve, price(P)).

@l3[atomic]
+!exit[source(N)] : in(I) <- 
    .delete(N, I, IB);
    -+in(IB);
    .print(N, " has exited");
    .length(IB, LI);
    !checkEnd(LI).

+!checkEnd(L) : L > 1 &
                finished(false)
            <-  
                .wait(1).

+!checkEnd(L) : seller(S) &
                in([W])  &
                finished(false)
                <-  
                    .send(S, achieve, finished);
                    .send(W, achieve, win);
                    .print(W, " is the winner!");
                    -+finished(true).

+!checkEnd(L) <-
                .wait(1).