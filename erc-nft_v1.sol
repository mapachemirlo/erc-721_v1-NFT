// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;


import "@openzeppelin/contracts/token/ERC721/ERC721.sol";


contract MyNFT is ERC721 {
    uint256 public MAX_TOKEN = 5;
    uint256 public PRICE = 0.01 ether;
    address public CREATOR = 0xdbf9188879a8cEb9200000000000000000;
    uint256 public token_count;


    constructor() ERC721("My NFT", "MNFT") {}


    function _baseURI() internal view virtual override returns (string memory) {
        return "https://url-nft-cloud-bla-bla/main/";
    }


    function mintNFT(address to) public payable
    {
        require(token_count < MAX_TOKEN, "Sold out");
        require(msg.value >= PRICE, "Must pay price");
        _mint(to, token_count);
        token_count  += 1;
    }


    function withdrawAll() public
    {
        (bool success, ) = CREATOR.call{value:address(this).balance}("");
        require(success, "Transfer failed.");
    }

}