\# Crowdfunding Smart Contract



A decentralized crowdfunding application developed using Solidity and tested on the Remix Ethereum IDE. The contract allows campaign creators to receive contributions and withdraw funds when the funding goal is reached and the campaign deadline has passed.



\## Features



\- Create crowdfunding campaigns with a title, description, funding goal, and duration.

\- Accept ETH contributions from multiple accounts.

\- Track campaign goals and total contributions.

\- Allow campaign creators to withdraw funds when the goal is reached and the deadline has passed.

\- Allow contributors to claim refunds when a campaign ends without reaching its goal.

\- Emit events for campaign creation, contributions, withdrawals, and refunds.



\## Technologies Used



\- Solidity

\- Ethereum smart contracts

\- Remix IDE

\- Remix VM (local simulated blockchain)



\## How to Run



1\. Open \[Remix IDE](https://remix.ethereum.org/).

2\. Create a file named `Crowdfunding.sol`.

3\. Copy the Solidity contract code into the file.

4\. Select a compatible Solidity compiler version (`0.8.20` or later within the `^0.8.20` range).

5\. Compile the contract.

6\. Under \*\*Deploy \& Run Transactions\*\*, select \*\*Remix VM\*\*.

7\. Deploy the contract.

8\. Call `createCampaign` with a title, description, goal in Wei, and duration in minutes.

9\. Use different accounts to contribute ETH by setting the transaction value in Wei.

10\. After the campaign deadline, test `withdrawFunds` if the goal was reached, or `claimRefund` if it was not.



\## Test Results



The contract was tested on Remix VM.



\- Campaign created successfully.

\- Two separate accounts contributed 0.5 ETH each.

\- Total contributions reached the 1 ETH funding goal.

\- The campaign creator successfully withdrew the funds after the deadline.

\- The `FundsWithdrawn` event was emitted.

\- The campaign's `withdrawn` status changed to `true`.



\## Important Note



This project was tested on Remix VM, a local simulated blockchain. It has not been deployed to the Ethereum mainnet.



\## Author



Srisha Reddie

