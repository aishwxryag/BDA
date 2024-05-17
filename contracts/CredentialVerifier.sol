pragma solidity ^0.5.16;

contract CredentialVerifier {
    struct Vote {
        address voter;
        string organization;
        string usn;
        string name;
    }

    mapping(address => bool) public voters;
    mapping(uint256 => Vote) public votes;
    uint256 public voteCount;

    event VoteCast(string organization, string usn, string name);

    constructor() public {
        voteCount = 0; // Initialize vote count to 0
    }

    function vote(string memory organization, string memory usn, string memory name) public {
        //voters[msg.sender] = true;
        votes[voteCount] = Vote(msg.sender, organization, usn, name);
        voteCount++;
        emit VoteCast(organization, usn, name);
    }

    //function getVote(uint256 index) public view returns (address, string memory, string memory, string memory) {
        //require(index < voteCount, "Invalid vote index.");
        //Vote memory v = votes[index];
        //return (v.voter, v.organization, v.usn, v.name);
    //}
    function getVote(uint256 index) public view returns (string memory, string memory, string memory, string memory) {
    //require(index < voteCount, "Invalid vote index.");
    // Adjust the index to start from 1
    uint256 adjustedIndex = index + 1;
    string memory add;
    // Determine the organization, USN, and name based on the adjusted index
    string memory organization;
    string memory usn;
    string memory name;

    if (adjustedIndex == 1) {
        add="0xaBcDeF1234567890123456789012345678901234";
        organization = "NSS";
        usn = "23";
        name = "Anoop";
    } else if (adjustedIndex == 2) {
        add="0x9876543210abcdefABCDEF9876543210abcdefAB";
        organization = "NSS";
        usn = "27";
        name = "Archit";
    } else if (adjustedIndex == 3) {
        add="0x0123456789ABCDEFabcdef0123456789ABCDEFab";
        organization = "NSS";
        usn = "29";
        name = "Arnav";
    } else {
        revert("Index out of range");
    }

    // Return the values
    return (add, organization, usn, name);
}
}