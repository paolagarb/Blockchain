pragma solidity ^0.6.4;

contract Voting {
    
  mapping (bytes32 => uint256) public totalVotes;

  bytes32[] public candidates;

  constructor(bytes32[] memory names) public {
    candidates = names;
  }
  function totalVotesFor(bytes32 candidate) view public returns (uint256) {
    require(isValid(candidate));
    return totalVotes[candidate];
  }

  function insertVote(bytes32 candidate) public {
    require(isValid(candidate));
    totalVotes[candidate] += 1;
  }

  function isValid(bytes32 candidate) view public returns (bool) {
    for(uint i = 0; i < candidates.length; i++) {
      if (candidates[i] == candidate) {
        return true;
      }
    }
    return false;
  }
}