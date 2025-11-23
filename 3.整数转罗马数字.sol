// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IntegerToRoman {
    // 罗马数字值和对应的符号
    uint16[] private values;
    string[] private symbols;
    
    constructor() {
        // 按值从大到小排列
        values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];
        symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"];
    }
    
    /**
     * @dev 将整数转换为罗马数字
     * @param num 要转换的整数 (1-3999)
     * @return 罗马数字字符串
     */
    function intToRoman(uint16 num) public view returns (string memory) {
        require(num > 0 && num <= 3999, "Number out of range (1-3999)");
        
        bytes memory result;
        
        for (uint16 i = 0; i < values.length; i++) {
            while (num >= values[i]) {
                bytes memory symbolBytes = bytes(symbols[i]);
                // 将符号添加到结果中
                for (uint j = 0; j < symbolBytes.length; j++) {
                    result = abi.encodePacked(result, symbolBytes[j]);
                }
                num -= values[i];
            }
        }
        
        return string(result);
    }
}