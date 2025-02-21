pragma solidity ^0.8.0;

contract LimitedTimeAuction {
    address payable public seller;
    uint public endTime;
    address public highestBidder;
    uint public highestBid;
    bool public ended;

    mapping(address => uint) public pendingReturns;

    // Set auction duration to 1 hour (3600 seconds) from contract creation
    uint private constant AUCTION_DURATION = 3600;

    // Auction starts when contract is deployed
    function startAuction() public {
        require(seller == address(0), "Auction already started");
        seller = payable(msg.sender);
        endTime = block.timestamp + AUCTION_DURATION;
    }

    function bid() public payable {
        require(block.timestamp < endTime, "Auction already ended");
        require(msg.value > highestBid, "There is already a higher bid");

        if (highestBid != 0) {
            pendingReturns[highestBidder] += highestBid;
        }

        highestBidder = msg.sender;
        highestBid = msg.value;
    }

    function withdraw() public returns (bool) {
        uint amount = pendingReturns[msg.sender];
        require(amount > 0, "No funds to withdraw");
        pendingReturns[msg.sender] = 0;
        
        if (!payable(msg.sender).send(amount)) {
            pendingReturns[msg.sender] = amount;
            return false;
        }
        return true;
    }

    function closeAuction() public {
        require(block.timestamp >= endTime, "Auction not yet ended");
        require(!ended, "Auction already closed");
        ended = true;
        seller.transfer(highestBid);
    }
}

