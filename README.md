Description

Limited Time Auction is a smart contract written in Solidity that enables a time-based auction where users can place bids. The highest bidder wins once the auction ends, and the seller receives the highest bid amount automatically.

Features

Automated Closing: The auction automatically ends after a predefined time.
Highest Bid Tracking: Keeps track of the highest bidder and their bid.
Bid Withdrawal: Outbid users can withdraw their funds.
Secure Transactions: Ensures the highest bid is sent to the seller securely.
Deployment Details
Deployed Address: 0x74EBf615acd688d9EaB2f65004654bE441e9C039
Blockchain Network: Edu Chain
Compiler Version: Solidity 0.8.0

Usage

Start Auction: The seller calls startAuction() to initialize the auction.
Place Bid: Participants send ETH via bid() function.
Withdraw Previous Bid: Users can call withdraw() if they are outbid.
Close Auction: Once the time is up, closeAuction() finalizes the auction and transfers funds to the seller.
