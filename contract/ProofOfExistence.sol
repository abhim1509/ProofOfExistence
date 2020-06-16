// ----------------------------------------------------------------------------
// Proof of existence contract
// ----------------------------------------------------------------------------

pragma solidity ^0.6.4;

contract ProofOfExistence {

    mapping(bytes32 => bool) private proofs;
    
    //This function is used to store proof. 
    function storeProof(bytes32 proof) public{
        proofs[proof] = true;
    }
    
    //This function is used to notarize document.
    function notarize(string memory document) public {
        bytes32 hashedProof = hash(document);
        storeProof(hashedProof);
    }
    
    //This function is used hash the document.
    function hash(string memory document) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(document));
    }

    //This function is used to verify the document.
    function checkDocument(string memory document) public view returns(bool){
        bytes32 hashedDocument = hash(document);
        return hasProof(hashedDocument);
    }
    
    This function is used to check for existing proof.
    function hasProof(bytes32 hashedDoc) private view returns (bool){
        return proofs[hashedDoc];
    }
}
