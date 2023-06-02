// SPDX-License-Identifier: GPL-3.0

pragma solidity =0.6.12;

// a library for performing overflow-safe math, courtesy of DappHub (https://github.com/dapphub/ds-math)

library SafeMathUniswap {
    function add(uint x, uint y) internal pure returns (uint z) {
        require((z = x + y) >= x, 'ds-math-add-overflow');
    }

    function sub(uint x, uint y) internal pure returns (uint z) {
        require((z = x - y) <= x, 'ds-math-sub-underflow');
    }

    function mul(uint x, uint y) internal pure returns (uint z) {
        require(y == 0 || (z = x * y) / y == x, 'ds-math-mul-overflow');
    }

    function mulSafeMath(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        require(c / a == b, 'SafeMath: mul overflow');
        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // Verificar se b é diferente de zero para evitar divisão por zero
        require(b > 0, 'SafeMath: div by zero');
        uint256 c = a / b;
        // Verificar se a divisão não resultou em overflow
        require(a == b * c + (a % b), 'SafeMath: div by the rest');
        return c;
    }

    function subSafeMath(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, 'SafeMath: subtraction overflow');
        return a - b;
    }
}
