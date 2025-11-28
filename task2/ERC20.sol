// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract ERC20 {
    // 根据合约地址获取余额
    function getBalance(address _address) public view returns (uint){
        return _address.balance;
    }
    
}