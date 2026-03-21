#!/bin/bash

# Get all the pages that need to update their last_modified_at field
# Adjust the file types based on your project (e.g., .md for Markdown or .html for HTML files)
pages=$(git ls-files "*.html" | grep -Ev '(^_includes/|^_plugins/|^_layouts/|^_docs/deque_of_unique/|^\.\/)')

# Loop through each file to update its last_modified_at field
for file in $pages; do
  # Check if there are any uncommitted changes for this file
  if ! git diff --quiet HEAD -- "$file"; then
    echo "Uncommitted changes detected for $file; skipping update."
    continue  # Skip updating if there are uncommitted changes
  fi

  # Get the last Git commit timestamp for the current file
  last_modified=$(git log -1 --format="%ad" --date=iso "$file")

  # Check if the file has a YAML front matter
  if grep -q "^---" "$file"; then
    # If the file has front matter, update or add the last_modified_at field
    if grep -q "^last_modified_at:" "$file"; then
      # Update the existing last_modified_at field
      sed -i.bak -E "s/^(last_modified_at:).*/\1 \"$last_modified\"/" "$file"
    else
      # Add the last_modified_at field to the end of the front matter
      awk -v lm="$last_modified" '/^---$/{print; if (c++ == 0) print "last_modified_at: \"" lm "\""; next} 1' "$file" > temp_file && mv temp_file "$file"
    fi
  else
    # If the file does not have a front matter, add one with the last_modified_at field
    echo -e "---\nlast_modified_at: \"$last_modified\"\n---\n$(cat "$file")" > "$file"
  fi

  # Log the updated file and its timestamp
  echo "Updated last_modified_at for $file to $last_modified"
done

# Remove backup files created during sed operation
find . -name "*.bak" -delete
