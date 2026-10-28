# Crowdfunding Smart Contract

## Overview

The Crowdfunding Smart Contract is a decentralized fundraising application developed using Solidity. It enables campaign creators to set funding goals and deadlines while allowing contributors to send Ether (ETH) to support campaigns.

The smart contract manages contributions, checks whether funding goals have been reached, allows eligible creators to withdraw funds, and provides refunds when a campaign ends without meeting its goal.

## Features

- Create campaigns with a title, description, funding goal, and duration.
- Accept ETH contributions from multiple accounts.
- Track campaign details and total contributions.
- Allow campaign creators to withdraw funds after the deadline if the funding goal is reached.
- Allow eligible contributors to claim refunds if the campaign fails to reach its funding goal.
- Prevent unauthorized withdrawals by restricting them to the campaign creator.
- Emit blockchain events for campaign creation, contributions, withdrawals, and refunds.

## Technologies Used

- Solidity
- Ethereum smart contracts
- Remix IDE
- Remix VM — local blockchain simulation

## Smart Contract Functions

- `createCampaign()` — Creates a new crowdfunding campaign.
- `contribute()` — Accepts ETH contributions for an active campaign.
- `withdrawFunds()` — Allows the campaign creator to withdraw funds after the deadline if the goal has been reached.
- `claimRefund()` — Allows eligible contributors to recover their contributions if the campaign fails to reach its goal.
- `getCampaign()` — Returns the details of a specified campaign.

## Testing and Results

The contract was compiled, deployed, and tested using Remix VM.

The following operations were verified:

1. Created a campaign named **Student Project Fund**.
2. Set the funding goal to 1 ETH.
3. Received two contributions of 0.5 ETH each from separate accounts.
4. Reached the total funding goal of 1 ETH.
5. Successfully withdrew the funds after the campaign deadline.
6. Verified that the `FundsWithdrawn` event was emitted.
7. Confirmed that the campaign's `withdrawn` status became `true`.

## How to Run

1. Open [Remix IDE](https://remix.ethereum.org/).
2. Create a Solidity file named `Crowdfunding.sol`.
3. Paste the smart contract source code into the file.
4. Compile it using a compatible Solidity compiler version satisfying `^0.8.20`.
5. Open **Deploy & Run Transactions**.
6. Select **Remix VM** as the deployment environment.
7. Deploy the contract.
8. Call `createCampaign()` with a title, description, funding goal in Wei, and duration in minutes.
9. Use different test accounts to contribute ETH by setting the transaction value in Wei.
10. After the deadline, call `withdrawFunds()` if the goal was reached, or `claimRefund()` if it was not.
11. Use `getCampaign()` to inspect the campaign status.

## Learning Outcomes

- Understanding decentralized applications and blockchain fundamentals.
- Developing smart contracts using Solidity.
- Working with Ether transactions and multiple accounts.
- Implementing funding goals, deadlines, and refund conditions.
- Testing contract behavior using Remix VM.

## Deployment Status

This project was tested on Remix VM, a local simulated blockchain. It has not been deployed to the Ethereum mainnet.

## Author

**Srisha Reddie**

## Disclaimer

This project is intended for educational purposes. It has not been audited for security and should not be used to manage real funds without appropriate review and testing.
