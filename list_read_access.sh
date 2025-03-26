#!/bin/bash


# Author: Riya
# Date: 2025-03-21
# Purpose: Automate repository access management that interacts with the GitHub API.
# Version: 1.0


# Function to display usage instructions
usage() {
    echo "Usage: $0 <organization_name> <repository_name>"
    exit 1
}

# Ensure correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    usage
fi

# Assign command-line arguments to variables
ORG_NAME="$1"
REPO_NAME="$2"

# Check if authentication variables are set
if [ -z "$GITHUB_USERNAME" ] || [ -z "$GITHUB_TOKEN" ]; then
    echo "Error: Please set GITHUB_USERNAME and GITHUB_TOKEN environment variables."
    exit 1
fi

# GitHub API endpoint to get repository collaborators
API_URL="https://api.github.com/repos/$ORG_NAME/$REPO_NAME/collaborators"

# Fetch collaborator details
RESPONSE=$(curl -s -u "$GITHUB_USERNAME:$GITHUB_TOKEN" "$API_URL")

# Check for API rate limits or errors
if echo "$RESPONSE" | jq -e '.message' > /dev/null; then
    ERROR_MSG=$(echo "$RESPONSE" | jq -r '.message')
    echo "Error: $ERROR_MSG"
    exit 1
fi

# Parse and display collaborator details
echo "Collaborators for repository: $ORG_NAME/$REPO_NAME"
echo "--------------------------------------"
echo "Username | Role"
echo "--------------------------------------"

echo "$RESPONSE" | jq -r '.[] | "\(.login) | \(.permissions.admin as $admin | if $admin then "Admin" else "Collaborator" end)"'

exit 0
