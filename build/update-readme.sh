#!/bin/bash

my_array=("binance" "okx")
marker="### XYZ"
readme_file="$GITHUB_WORKSPACE/README.md"

generate_list_items() {
  local array=("${!1}")
  local repo_prefix="https://github.com/my/"

  for item in "${array[@]}"; do
    echo "- [$item](${repo_prefix}${item})"
  done
}

# Generate the list items and store them in a variable
list_items=$(generate_list_items my_array)

awk -v marker="$marker" -v list_items="$list_items" '
  $0 == marker {
    found = 1;
    print marker; # Print the marker
    print list_items; # Print the list items
    next;
  }
  !found { print }
' "$readme_file" > "$readme_file.tmp" && mv "$readme_file.tmp" "$readme_file"

echo "README.md updated successfully."