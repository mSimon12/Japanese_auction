
/* BELIEFS */
interestForProduct(true).

/* DESIRES */
!buy.

/* PLANS */

+!buy : interestForProduct(true) &
        maxPrice(M) & price(V) & 
        V > M & seller(S) & .my_name(N)
    <-  -interestForProduct(true);
        +interestForProduct(false);
        .print("Giving up from buying!");
        .send(S, achieve, goOut(N));
        -price(V).

+!buy <- .print("Waiting in the auction room.").


// Receives from buyer a new price
+!newPrice(NV)[source(S)] : interestForProduct(true) & price(OV) 
        <-  -price(OV);
            +price(NV);
            .print(S, " inform a new price: ", NV);
            !buy.


+!newPrice(V) : interestForProduct(true) 
            <- +price(V);
                .print(S, " inform a new price: ", V).

+!newPrice(V).

+winAudict <- .print("I win audict for product.").