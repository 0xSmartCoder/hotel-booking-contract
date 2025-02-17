 🏨 Hotel Booking Smart Contract

A Solidity smart contract for booking hotel rooms using Ethereum. Users can book a room by paying at least 2 ETH, and the contract tracks room availability.

 🚀 Features
 Book a Room – Users can book a room if available.
 Payment System – Requires a minimum 2 ETH payment.
 Room Availability Check – Tracks how many rooms are left.
 Fully Booked Status – If all rooms are booked, no more bookings allowed.
 Reset Function – Owner can reset and reopen bookings.



 🛠️ Tech Stack
 Solidity (v0.8.26) – Smart contract logic.
 Ethereum – Blockchain network for deployment.
 MetaMask – For interacting with the contract.



 📜 Smart Contract Explanation

 📌 Variables
 `owner` – The owner of the contract.
 `rooms` – Total number of available rooms.
 `hasBooked` – Mapping to track if a user has booked a room.
 `currentStatus` – Enum to check whether rooms are available or fully booked.

 📌 Functions
 `bookRoom()` – Allows users to book a room by sending at least 2 ETH.
 `getStatus()` – Returns whether rooms are available or fully booked.
 `resetHotel(newRooms)` – Allows owner to reset the hotel for new bookings.



 📦 Deployment & Usage
 1️⃣ Deploy the Smart Contract
Deploy the contract on an Ethereum testnet like Goerli, Sepolia, or Holesky using Remix.

 2️⃣ Interact with the Contract
1. Call `bookRoom()` with 2 ETH or more to book a room.
2. Check room status using `getStatus()`.
3. Owner can reset rooms using `resetHotel(newRooms)`.



 ❗ Important Notes
 Each user can book only one room.
 If all rooms are booked, further bookings are not allowed.
 The owner receives the booking amount directly.



 📜 License
This project is opensource under the MIT License.

🚀 Developed by [0xSmartCoder](https://github.com/0xSmartCoder)
