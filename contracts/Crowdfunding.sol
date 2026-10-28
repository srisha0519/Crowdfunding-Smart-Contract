
 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Crowdfunding {
    struct Campaign {
        uint256 id;
        address payable creator;
        string title;
        string description;
        uint256 goal;
        uint256 deadline;
        uint256 amountRaised;
        bool withdrawn;
    }

    uint256 public campaignCount;

    mapping(uint256 => Campaign) public campaigns;
    mapping(uint256 => mapping(address => uint256)) public contributions;
    mapping(uint256 => mapping(address => bool)) public refunded;

    event CampaignCreated(
        uint256 indexed campaignId,
        address indexed creator,
        string title,
        uint256 goal,
        uint256 deadline
    );

    event ContributionReceived(
        uint256 indexed campaignId,
        address indexed contributor,
        uint256 amount
    );

    event FundsWithdrawn(uint256 indexed campaignId, uint256 amount);

    event RefundIssued(
        uint256 indexed campaignId,
        address indexed contributor,
        uint256 amount
    );

    function createCampaign(
        string calldata title,
        string calldata description,
        uint256 goal,
        uint256 durationInMinutes
    ) external returns (uint256) {
        require(bytes(title).length > 0, "Title required");
        require(goal > 0, "Goal must be greater than zero");
        require(durationInMinutes > 0, "Duration must be positive");

        campaignCount++;

        uint256 deadline = block.timestamp + (durationInMinutes * 60);

        campaigns[campaignCount] = Campaign({
            id: campaignCount,
            creator: payable(msg.sender),
            title: title,
            description: description,
            goal: goal,
            deadline: deadline,
            amountRaised: 0,
            withdrawn: false
        });

        emit CampaignCreated(
            campaignCount,
            msg.sender,
            title,
            goal,
            deadline
        );

        return campaignCount;
    }

    function contribute(uint256 campaignId) external payable {
        Campaign storage campaign = campaigns[campaignId];

        require(campaign.id != 0, "Campaign does not exist");
        require(block.timestamp < campaign.deadline, "Campaign has ended");
        require(msg.value > 0, "Contribution must be greater than zero");
        require(!campaign.withdrawn, "Campaign already withdrawn");

        campaign.amountRaised += msg.value;
        contributions[campaignId][msg.sender] += msg.value;

        emit ContributionReceived(campaignId, msg.sender, msg.value);
    }

    function withdrawFunds(uint256 campaignId) external {
        Campaign storage campaign = campaigns[campaignId];

        require(campaign.id != 0, "Campaign does not exist");
        require(msg.sender == campaign.creator, "Only creator can withdraw");
        require(block.timestamp >= campaign.deadline, "Campaign is still active");
        require(campaign.amountRaised >= campaign.goal, "Funding goal not reached");
        require(!campaign.withdrawn, "Funds already withdrawn");

        campaign.withdrawn = true;

        uint256 amount = campaign.amountRaised;
        campaign.creator.transfer(amount);

        emit FundsWithdrawn(campaignId, amount);
    }

    function claimRefund(uint256 campaignId) external {
        Campaign storage campaign = campaigns[campaignId];

        require(campaign.id != 0, "Campaign does not exist");
        require(block.timestamp >= campaign.deadline, "Campaign is still active");
        require(campaign.amountRaised < campaign.goal, "Funding goal was reached");

        uint256 amount = contributions[campaignId][msg.sender];

        require(amount > 0, "No contribution to refund");
        require(!refunded[campaignId][msg.sender], "Already refunded");

        refunded[campaignId][msg.sender] = true;
        contributions[campaignId][msg.sender] = 0;
        campaign.amountRaised -= amount;

        payable(msg.sender).transfer(amount);

        emit RefundIssued(campaignId, msg.sender, amount);
    }

    function getCampaign(uint256 campaignId)
        external
        view
        returns (Campaign memory)
    {
        require(campaigns[campaignId].id != 0, "Campaign does not exist");
        return campaigns[campaignId];
    }
    function getCurrentTimestamp() external view returns (uint256) {
    return block.timestamp;
}
}
