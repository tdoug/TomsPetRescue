pragma solidity ^0.4.17;

contract PetAdoption {
    address[16] public PetAdopters;

    function adoptPet(uint petId) public returns (uint) {
        require(petId >= 0 && petId <= 15);

        PetAdopters[petId] = msg.sender;

        return petId;
    }

    function getPetAdopters() public view returns (address[16]) {
        return PetAdopters;
    }
}