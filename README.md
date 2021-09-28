# oystercard

In order to use public transport
As a customer
I want money on my card

In order to keep using public transport
As a customer
I want to add money to my card

In order to protect my money
As a customer
I don't want to put too much money on my card

In order to pay for my journey
As a customer
I need my fare deducted from my card

In order to get through the barriers
As a customer
I need to touch in and out

In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey

In order to pay for my journey
As a customer
I need to pay for my journey when it's complete

In order to pay for my journey
As a customer
I need to know where I've travelled from

In order to know where I have been
As a customer
I want to see to all my previous trips

In order to know how far I have travelled
As a customer
I want to know what zone a station is in

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

In order to be charged the correct amount
As a customer
I need to have the correct fare calculated

nouns       |       verbs
costummer           use
card                want

In order to use public transport
As a customer
I want money on my card

### Logic

oyster
   - money init
   - add money
      - condition to much money - default max value

journey
   - history init
   - touch in
      - minimum amount for a single journey if I touch in
      - history << destination or failed to touch in
   - touch out
      - history << destination or failed to touch out
      - fare deduction(calculation) or penalty
   - history of jurney
       history >> return destination places

station
   - places and zones { places: 1, place2: 3 }

money 
   in             
   add
      not too much

journey
   history
      previous trips 
         touch in(card) 
            failure(penalty)
            minimum ammount
         touch out(card)
            failure(penalty)
            fare calculation(card)

station 
   zones
