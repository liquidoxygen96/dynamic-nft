//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

//import ERC1155 contract from OpenZeppelin
import "@openzeppelin/contracts/token/ERC1155";

//accessability: onlyOwner == address [0]
import "@openzeppelin/contracts/access/ownable.sol";

contract nftContract is ERC1155 {

    //unique item id
    uint256 public constant artwork = 0;
    uint256 public constant image = 1;

    constructor () ERC1155(""){
        _mint(msg.sender, artwork, 1, "");
        _mint(msg.sender, image, 2, "");
    }

    function mint(address to, uint256 id, uint256 amount) public onlyOwner {
        _mint(to, id, amount, "");
    }

    function burn(address to, uint256 id, uint256 amount) public {
        require(msg.sender == to);
        _burn(to, id, amount);
    }

}


