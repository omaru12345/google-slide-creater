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

# Ensure we're on the main branch
echo "Switching to main branch..."
git checkout main || git checkout -b main origin/main || { echo "Error: Could not checkout main branch"; exit 1; }
git pull origin main || echo "Note: Could not pull latest main"

# Create dev branch
if git ls-remote --heads origin dev | grep dev > /dev/null 2>&1; then
    echo "✓ dev branch already exists"
else
    echo "Creating dev branch from main..."
    git checkout -b dev
    git push origin dev
    echo "✓ dev branch created successfully"
    git checkout main
fi

# Create stg branch
if git ls-remote --heads origin stg | grep stg > /dev/null 2>&1; then
    echo "✓ stg branch already exists"
else
    echo "Creating stg branch from main..."
    git checkout -b stg
    git push origin stg
    echo "✓ stg branch created successfully"
    git checkout main
fi

echo ""
echo "All branches created successfully!"
echo "Available branches:"
git branch -r | grep -E '(dev|stg)' || echo "No dev/stg branches found"
