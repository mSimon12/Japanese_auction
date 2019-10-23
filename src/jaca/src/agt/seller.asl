{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }

!start.

+!start :   .random(R) & 
            MIN = 10 + math.round(100 * R)
            <-  .print("Price starts at ", MIN);
                start(MIN);
                .wait(1000);
                !run.

+!run : price(P) & INC = math.round(P * 0.1) &
        count(C) & C>1
          <- inc(INC);
             .print("Price: ", P);
             .wait(100);
             !run.

+!run : count(C) & C==1
        <- winner(W);
            .print(W, " won.").

+!run.
