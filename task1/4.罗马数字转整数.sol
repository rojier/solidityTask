contract RomanToInteger {
    // 罗马数字到整数的映射
   // 罗马数字到整数的映射
    function getValue(bytes1 romanChar) private pure returns (uint16) {
        if (romanChar == 'I') return 1;
        if (romanChar == 'V') return 5;
        if (romanChar == 'X') return 10;
        if (romanChar == 'L') return 50;
        if (romanChar == 'C') return 100;
        if (romanChar == 'D') return 500;
        if (romanChar == 'M') return 1000;
        revert("Invalid Roman numeral");
    }
    
    /**
     * @dev 将罗马数字转换为整数
     * @param roman 罗马数字字符串
     * @return 对应的整数值
     */
    function romanToInt(string memory roman) public pure returns (uint16) {
        bytes memory romanBytes = bytes(roman);
        uint16 total = 0;
        uint256 length = romanBytes.length;
        
        for (uint256 i = 0; i < length; i++) {
            uint16 current = getValue(romanBytes[i]);
            
            // 如果当前字符不是最后一个，且当前字符小于下一个字符，则减去当前值
            if (i < length - 1) {
                uint16 next = getValue(romanBytes[i + 1]);
                if (current < next) {
                    total -= current;
                    continue;
                }
            }
            
            total += current;
        }
        
        return total;
    }
}