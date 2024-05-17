pragma solidity ^0.5.0;

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

    event VoteCast(address indexed voter, string organization, string usn, string name);

    constructor() public {
        voteCount = 0; // Initialize vote count to 0
    }

    function vote(string memory organization, string memory usn, string memory name) public {
        require(!voters[msg.sender], "You have already voted.");
        voters[msg.sender] = true;
        votes[voteCount] = Vote(msg.sender, organization, usn, name);
        voteCount++;
        emit VoteCast(msg.sender, organization, usn, name);
    }

    function getVote(uint256 index) public view returns (address, string memory, string memory, string memory) {
        require(index < voteCount, "Invalid vote index.");
        Vote memory v = votes[index];
        return (v.voter, v.organization, v.usn, v.name);
    }
}
