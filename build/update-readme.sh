#!/bin/bash

# Define the array of items
my_array=("binance" "okx")

# Define the marker string
marker="### XYZ"

# Define the README file path
readme_file="$GITHUB_WORKSPACE/README.md"

# Function to generate the list items
generate_list_items() {
  local array=("${!1}") #take array as argument
  local repo_prefix="https://github.com/my/"

  for item in "${array[@]}"; do
    echo "- [$item](${repo_prefix}${item})"
  done
}

# Check if the README file exists
if [ ! -f "$readme_file" ]; then
  echo "Error: README.md not found."
  exit 1
fi

# Read the README file and remove everything after the marker
content=$(sed "/$marker/q" "$readme_file")

# Append the marker and the new list items
new_content="$content\n$marker\n$(generate_list_items my_array)\n"

# Write the new content to the README file
echo "$new_content" > "$readme_file"

echo "README.md updated successfully."