{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }

+!start :   .random(R) & 
            MIN = 10 + math.round(100 * R)
            <-  .print("Price starts at ", MIN);
                start(MIN).

+!run : price(P) & INC = math.round(P * 0.1) &
        count(C) & C>1
          <- inc(INC);
             .print("Price: ", P);
             .wait(100);
             !run. // A organização verifica se existe o desejo???

+!run : count(C) & C==1
        <-
            .print("Finished").
            //goalAchieved(run). ???


+!run.

+!announce <-  winner(W);
            .print(W, " won.").