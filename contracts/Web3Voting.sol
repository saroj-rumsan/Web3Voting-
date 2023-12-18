// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
pragma abicoder v2;

contract Web3Voting {
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }
    mapping(uint => Candidate) public candidates;
    uint public candidateCount;
    mapping(address => bool) public voters;

    event VoteEvent(uint indexed _candidateId);

    constructor() {
        addCandidate("Ronaldo");
        addCandidate("Messi");
    }

    function addCandidate(string memory _name) private {
        candidateCount++;
        candidates[candidateCount] = Candidate(candidateCount, _name, 0);
    }

    function vote(uint _candidateId) public {
        require(!voters[msg.sender], "You have already Voted");
        require(
            _candidateId > 0 && _candidateId <= candidateCount,
            "Invalid Candidate ID!!!"
        );
        voters[msg.sender] = true;
        candidates[_candidateId].voteCount++;
        emit VoteEvent(_candidateId);
    }
}
