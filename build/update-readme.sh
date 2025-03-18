#!/bin/bash

# Define the array of items
my_array=("binance" "okx")

# Define the marker string
marker="### XYZ"

# Define the README file path
readme_file="$GITHUB_WORKSPACE/README.md"

# Function to generate the list items and return the string
generate_list_items() {
  local array=("${!1}")
  local repo_prefix="https://github.com/my/"
  local list_string=""

  for item in "${array[@]}"; do
    list_string+="- [$item](${repo_prefix}${item})\n"
  done

  echo "$list_string"
}

# Check if the README file exists
if [ ! -f "$readme_file" ]; then
  echo "Error: README.md not found."
  exit 1
fi

# Read the README file and remove everything after the marker
content=$(sed "/$marker/q" "$readme_file")

# Generate the list items
list_items=$(generate_list_items my_array)

# Append the marker and the new list items
new_content="$content\n$marker\n$list_items"

# Write the new content to the README file
echo "$new_content" > "$readme_file"

echo "README.md updated successfully."