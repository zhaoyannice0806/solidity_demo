// SPDX-License-Identifier: MIT
pragma solidity > 0.8.0;

contract Loop {
    function loop() public pure  {
        for(uint8 i = 0; i < 10; i++){
            if ( i == 3){
                continue ;
            }
            if (i == 5){
                break;
            }
        }

        uint256 j = 0;
        while (j < 10) {
            j ++;
        }
    }
}