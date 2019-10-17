
/* BELIEFS */
//price(0)
nParticipants(0).

/* DESIRES */

!start.

/* PLANS */

//Verify all possible buyers and start auction----------------------
+!start : .my_name(N) & .all_names(L) 
        <- .broadcast(tell, seller(N));
            !listInsert(L,0);
            !sell.

// Insert as participant all buyer agents -------------------------- 
+!listInsert(L, C) : .length(L,X) & C<X 
                <- !insertP(L, C).

+!listInsert(L, C).

//Ignore insertion of himself
+!insertP(L, C) :   .nth(C,L,N) & 
                    .my_name(B) & N == B 
                <- !listInsert(L, C+1).

// add participant
+!insertP(L,C) :   .nth(C,L,N) & nParticipants(X)
                <-  +participant(N);
                    -nParticipants(X);
                    +nParticipants(X+1);
                    !listInsert(L, C+1).


// Plan for selling the product ------------------------------------
+!sell : price(V) & nParticipants(X) & X>1 
        <-  .broadcast(achieve, newPrice(V));
            .print("Current price: ", V);
            .wait(200);
            -price(V);
            +price(V + 0.5);
            !sell.

+!sell : nParticipants(1) & participant(N) & price(V)
        <-  .print("Only one participant: ",N);
            .print(N, " bought the product for R$",V);
            .send(N, tell, winAudict).


//Buyer inform that gave up from the auction ------------------------
+!goOut(N)[source(N)] : nParticipants(X)
        <-  -nParticipants(X);
            +nParticipants(X-1);
            -participant(N).
