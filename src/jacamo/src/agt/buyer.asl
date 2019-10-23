{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }

money(0).
in(false).

!start.

+!start :   .random(R) & 
            M = math.round(1000 * R)
            <- 
                -+money(M);
                .print("I have: ", M).


+!decide : price(P) & money(M) &
                  P < M & .my_name(N)
                  <-
                    .print("Joining");
                    -+in(true);
                    join(N).

+!decide <-
                .print("I wont join").


+price(P) : in(true) & money(M) &
                  P < M
                  <-
                    .wait(1).

+price(P): in(true) & .my_name(N) <-
                .print("Exiting arena");
                -+in(false);
                exit(N).

+price(P).

+win(W) : .my_name(N) & .term2string(N,Ns) & Ns==W
        <-  .print("I won!").

+win(W).