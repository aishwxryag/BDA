pragma solidity ^0.5.16;

contract CourseRegistration {
    struct Vote {
        address voter;
        string course;
        string usn;
        string name;
    }

    mapping(address => bool) public voters;
    mapping(uint256 => Vote) public votes;
    uint256 public voteCount;

    event VoteCast(string course, string usn, string name);

    constructor() public {
        voteCount = 0; // Initialize vote count to 0
    }

    function vote(string memory course, string memory usn, string memory name) public {
        require(!voters[msg.sender], "You have already voted.");
        voters[msg.sender] = true;
        votes[voteCount] = Vote(msg.sender, course, usn, name);
        voteCount++;
        emit VoteCast(course, usn, name);
    }

    function getVote(uint256 index) public view returns (address, string memory, string memory, string memory) {
        require(index < voteCount, "Invalid vote index.");
        Vote memory v = votes[index];
        return (v.voter, v.course, v.usn, v.name);
    }
}
