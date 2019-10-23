price(0).
done(false).

!start.

+!start :   .random(R) & 
            MIN = math.round(100 * R)
            <- 
                -+price(MIN);
                .print("Price starts at ", MIN);
                .send(arena, achieve, register(seller)).


+!speak : price(P) &
          NEW = P + math.round(P * 0.1)  &
          done(false)
          <-
            .print("Price is ", P);
            .send(arena, achieve, price(P));
            -+price(NEW);
            .wait(1000);
            !speak.

+!speak <-
            .wait(1).

+!finished <-
            -+done(true);
            .print("Done").