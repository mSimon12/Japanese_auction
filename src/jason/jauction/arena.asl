seller(none).
buyers([]).

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
                        buyers(B) <-
                            .send(B, achieve, price(P)).