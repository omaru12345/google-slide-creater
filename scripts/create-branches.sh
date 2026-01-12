#!/bin/bash

# Script to create dev and stg branches
# This script creates the development and staging branches if they don't exist

set -e

echo "Creating dev and stg branches..."

# Check if we're in a git repository
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "Error: Not in a git repository"
    exit 1
fi

# Fetch latest changes
echo "Fetching latest changes..."
git fetch origin

# Create dev branch
if git ls-remote --heads origin dev | grep dev > /dev/null 2>&1; then
    echo "✓ dev branch already exists"
else
    echo "Creating dev branch..."
    git checkout -b dev
    git push origin dev
    echo "✓ dev branch created successfully"
fi

# Create stg branch
if git ls-remote --heads origin stg | grep stg > /dev/null 2>&1; then
    echo "✓ stg branch already exists"
else
    echo "Creating stg branch..."
    git checkout -b stg
    git push origin stg
    echo "✓ stg branch created successfully"
fi

echo ""
echo "All branches created successfully!"
echo "Available branches:"
git branch -r | grep -E '(dev|stg)' || echo "No dev/stg branches found"
