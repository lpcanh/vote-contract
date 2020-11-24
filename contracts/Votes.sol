// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;
pragma experimental ABIEncoderV2;
contract VoteManager {
    struct Vote {
        string ipfsHash;
        string fingering;
    }

    Vote[] public votes;

    function vote(string memory ipfsHash, string memory fingering) public returns (uint voteId) {
        Vote memory _vote = Vote(ipfsHash, fingering);
        votes.push(_vote);
        voteId = votes.length - 1;
    }

    function getVotes(uint _start, uint _count) public view returns (string[] memory ipfsHashs, string[] memory fingerings) {
        uint maxIters = _count;
        if ((_start + _count) > votes.length) {
            maxIters = votes.length - _start;
        }
        ipfsHashs = new string[](maxIters);
        fingerings = new string[](maxIters);

        for (uint i = 0; i < maxIters; i++) {
            uint voteId = _start + i;
            Vote memory v = votes[voteId];
            ipfsHashs[i] = v.ipfsHash;
            fingerings[i] = v.fingering;
        }
    }
}
