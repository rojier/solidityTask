// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// 合并两个数组为 有序数组
contract Merge {
    function mergeArr(
        uint[] memory arr1,
        uint[] memory arr2
    ) public pure returns (uint[] memory) {
        uint len1 = arr1.length;
        uint len2 = arr2.length;
        uint[] memory result = new uint[](len1 + len2);
        uint i = 0;
        uint j = 0;
        uint k = 0;
        while (i < len1 && j < len2) {
            if (arr1[i] <= arr2[j]) {
                result[k] = arr1[i];
                i++;
            } else {
                result[k] = arr2[j];
                j++;
            }
            k++;
        }
        while (i < len1) {
            result[k] = arr1[i];
            i++;
            k++;
        }
        while (j < len2) {
            result[k] = arr2[j];
            j++;
            k++;
        }

        return result;
    }
}
