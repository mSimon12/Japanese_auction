price(0).

!start.

+!start :   .random(R) & 
            MIN = math.round(100 * R)
            <- 
                -+price(MIN);
                .print("Price starts at ", MIN);
                .send(arena, achieve, register(seller)).


+!speak : price(P) &
          NEW = P + math.round(P * 0.1) 
          <-
            .print("Price is ", P).
            .send(arena, achieve, price(P));
            -+price(NEW);
            .wait(1000);
            !speak.