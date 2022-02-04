// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Types {
    uint public minimum;
    function getMinimum() public {
        minimum = type(uint8).max;
    }
    bool public myBool = true; // state

    // 2 ** 256
    uint public myUint = 42; // uint256

    // 2 ** 8 = 256
    // 0 ---> (256-1)
    uint8 public mySmallUint = 2;

    int public myInt = -42; // int256

    // 2 ** 7 = 128
    // -128 --> (128-1)
    int8 public mySmallInt = -1;


    function demoInt(uint _inputUint) public {
        uint localUint = 42;
    }


    function myFunc(bool _inputBool) public {
        bool localBool = false; // local
    }
}