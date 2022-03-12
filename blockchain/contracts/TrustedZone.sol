// SPDX-License-Identifier: MIT

pragma solidity ^0.8.12;

abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}

abstract contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor() {
        _setOwner(_msgSender());
    }

    function owner() public view virtual returns (address) {
        return _owner;
    }

    modifier onlyOwner() {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    function renounceOwnership() public virtual onlyOwner {
        _setOwner(address(0));
    }

    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _setOwner(newOwner);
    }

    function _setOwner(address newOwner) private {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}

contract TrustedZone is Ownable {

    uint256 public organisationCount;

    struct Organisation {
        string name;
        address[] admins;
        address[] operators;
        bool active;
    }

    struct Info {
        string content;
        address[] editors;
        bool active;
    }

    mapping(uint256 => Organisation) private organisation;
    mapping(uint256 => mapping(uint256 => Info)) private info;

    modifier isAdmin(uint256 orgNumber) {
        require(organisation[orgNumber].active == true,
            "TrustedZone: not admin"
        );
        _;
    }

    event AddedOrganisation(address indexed sender, uint256 orgCount, string desc);
    event DisableOrganisation(address indexed sender, uint256 orgCount);

    function addOrganisation(string memory desc) external onlyOwner {
        organisationCount++;

        Organisation storage newOrganisation = organisation[organisationCount];
        newOrganisation.active = true;
        newOrganisation.name = desc;

        emit AddedOrganisation(_msgSender(), organisationCount, desc);
    }

    function disableOrganisation(uint256 orgNumber) external onlyOwner {
        organisation[orgNumber].active = false;
        emit DisableOrganisation(_msgSender(), orgNumber);
    }

    function addAdmin(uint256 orgNumber, address newAdmin) external onlyOwner {

    }

    function writeInfo(uint256 orgNumber, uint256 index, string memory newContent) external {
        Info storage newInfo = info[orgNumber][index];
        newInfo.active = true;
        newInfo.content = newContent;
    }

    function readInfo(uint256 orgNumber, uint256 index) external view returns(string memory){
        return info[orgNumber][index].content;
    }
}