// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BinarySearch {
    /**
     * @dev 在有序数组中二分查找目标值（升序）
     * @param arr 有序数组（升序）
     * @param target 目标值
     * @return 目标值的索引，如果未找到返回 type(uint).max
     */
    function binarySearch(uint[] memory arr, uint target) 
        public 
        pure 
        returns (uint) 
    {
        uint left = 0;
        uint right = arr.length;
        
        while (left < right) {
            uint mid = left + (right - left) / 2;
            
            if (arr[mid] == target) {
                return mid;
            } else if (arr[mid] < target) {
                left = mid + 1;
            } else {
                right = mid;
            }
        }
        
        return type(uint).max; // 未找到
    }
}