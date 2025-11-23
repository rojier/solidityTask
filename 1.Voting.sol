// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    //储存票数
    mapping(address => uint) public votes;
    //投票
    function addVotes(address _address, uint _vote) public {
        require(_vote > 0, "vote must > 0");
        votes[_address] += _vote;
    }
    //获取票数
    function getVotes(address _address) public view returns (uint) {
        return votes[_address];
    }
    //重置票数
    function resetVotes(address _address) public {
        votes[_address] = 0;
    }
}
