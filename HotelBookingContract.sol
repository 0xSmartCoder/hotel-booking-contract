// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Hotel {
    address payable public owner; // Owner of the contract
    uint public rooms; // Total available rooms

    // Mapping to track if an address has already booked a room
    mapping(address => bool) public hasBooked;

    // Event to notify booking
    event RoomBooked(address indexed user, uint amount);

    // Enum for room booking status
    enum Status {
        Available,
        FullyBooked
    }

    Status public currentStatus;

    // Constructor to initialize the contract
    constructor() {
        owner = payable(msg.sender);
        rooms = 5; // Initial number of rooms
        currentStatus = Status.Available; // Rooms are available initially
    }

    // Function to book a room
    function bookRoom() public payable {
        require(currentStatus == Status.Available, "Sorry, all rooms are fully booked"); // Check room status
        require(msg.value >= 2 ether, "Invalid amount, at least 2 ether required"); // Minimum payment
        require(!hasBooked[msg.sender], "You have already booked a room"); // Prevent double booking
        require(rooms > 0, "No rooms available"); // Ensure rooms are available

        // Process the booking
        hasBooked[msg.sender] = true; // Mark the user as having booked a room
        owner.transfer(msg.value); // Transfer payment to the owner
        emit RoomBooked(msg.sender, msg.value); // Emit event for booking
        rooms--; // Decrease the room count

        // Update status if all rooms are booked
        if (rooms == 0) {
            currentStatus = Status.FullyBooked;
        }
    }

    // Function to get the current status as a string (for better readability)
    function getStatus() public view returns (string memory) {
        if (currentStatus == Status.Available) {
            return "Rooms are available";
        } else {
            return "All rooms are fully booked";
        }
    }

    // Function to allow the contract owner to reset the hotel (for reuse)
    function resetHotel(uint newRooms) public {
        require(msg.sender == owner, "Only the owner can reset the hotel");
        require(newRooms > 0, "Room count must be greater than zero");
        
        rooms = newRooms;
        currentStatus = Status.Available;

        // Clear bookings
        for (uint i = 0; i < rooms; i++) {
            delete hasBooked[msg.sender];
        }
    }

    // Function to deposit ethers into the contract
    receive() external payable {}
}
