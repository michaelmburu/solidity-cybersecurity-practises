// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <=0.9.0;

contract Victim {
    function isItAContract(address a) public view returns (bool) {
        //If there bytes of code greater than zerothan it is a contract
        uint32 size;
        assembly {
            //extcodesize returns the size of the code
            size := extcodesize(a)
        }

        return (size > 0);
    }
}

//Attacker 
contract Attacker {
    bool public trickedYou;
    Victim victim;

    //If you call the address from a constructor there are no byte codes
    constructor(address _address) {
        victim = Victim(_address);
        trickedYou = !victim.isItAContract(_address);
    }

    function isAttackerAContract() public view returns(bool) {
        return trickedYou;
    }
}
