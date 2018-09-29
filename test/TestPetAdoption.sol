pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/PetAdoption.sol";

contract TestPetAdoption {
    PetAdoption adoption = PetAdoption(DeployedAddresses.PetAdoption());
    
    function testUserCanAdoptPet() public {
        uint returnedId = adoption.adoptPet(8);

        uint expected = 8;

        Assert.equal(returnedId, expected, "A pet adoption with an ID of 8 is recorded.");
    }

    function testGetAdopterAddressByPetId() public {
        address expected = this;
        address adopter = adoption.PetAdopters(8);

        Assert.equal(adopter, expected, "The owner of pet ID 8 should be returned.");
    }

    function testGetAdopterAddressByPetIdInArray() public {
        address expected = this;

        // store this in memory since this doesn't need to live in storage
        address[16] memory adopters = adoption.getPetAdopters();

        Assert.equal(adopters[8], expected, "The owner of pet ID 8 should be returned.");
    }
}