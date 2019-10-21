money(0).

!start.

+!start :   .random(R) & 
            M = math.round(1000 * R)
            <- 
                -+money(M);
                .print("I have: ", M);
                .send(arena, achieve, register(buyer)).