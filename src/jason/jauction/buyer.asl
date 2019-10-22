money(0).

!start.

+!start :   .random(R) & 
            M = math.round(1000 * R)
            <- 
                -+money(M);
                .print("I have: ", M);
                .send(arena, achieve, register(buyer)).


+!startPrice(P) : money(M) &
                  P < M 
                  <-
                    .print("Joining");
                    .send(arena, achieve, join).

+!startPrice(P) <-
                .print("I wont join").


+!price(P) : money(M) &
                  P < M
                  <-
                    .wait(1).

+!price(P) <-
                .print("Exiting arena");
                .send(arena, achieve, exit).

+!win <-
        .print("I won!").
