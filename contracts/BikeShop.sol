// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract BikeShop {
    mapping (address => bool) buyers;
    uint public price = 2 ether;
    bool fullyPaid;
    address public owner;
    address public shopAddress;


    event ItemFullyPaid(uint _price, address _shopAddress);

    constructor() {
        owner = msg.sender;
        shopAddress = address(this);
    }

    function getBuyer(address _addr) public view returns(bool) {
        require(owner == msg.sender, "You're not an owner!");

        return buyers[_addr];
    }

    function getBalance() public view returns(uint) {
        return shopAddress.balance;
    }

    function addBuyer(address _addr) public {
        require(owner == msg.sender, "You're not an owner!");

        buyers[_addr] = true;
    }

    receive() external payable {
        require(buyers[msg.sender] && msg.value <= price && !fullyPaid, "Rejected");

        if (shopAddress.balance == price) {
            fullyPaid = true;
            emit ItemFullyPaid(price, shopAddress);
        }
    }

    function withdraw() public {
        require(owner == msg.sender && fullyPaid && shopAddress.balance > 0, "Rejected");
        address payable receiver = payable(msg.sender);
        receiver.transfer(shopAddress.balance);
    }
}