// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InvDataVerifier {
   
    mapping(string => bytes32) private dataHashes;

    event DataStored(string indexed id);

    function storeData(string calldata id, bytes32 hash) external {
        require(dataHashes[id] == 0, "ID already exists");
        dataHashes[id] = hash;
        emit DataStored(id);
    }

    function match_inv_data(string calldata id, bytes32 hash) external view returns (bool) {
        bytes32 storedHash = dataHashes[id];
        require(storedHash != 0, "ID does not exist");
        return storedHash == hash;
    }
}
