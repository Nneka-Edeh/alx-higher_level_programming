#!/bin/bash

# Check if the URL argument is provided
if [ -z "$1" ]; then
  echo "Please provide a URL."
  exit 1
fi

# Store the URL in a variable
URL="$1"

# Send the request and store the response in a variable
response=$(curl -sI "$URL")

# Extract the content length from the response headers
content_length=$(echo "$response" | grep -i "Content-Length" | awk '{print $2}' | tr -d '\r')

# If content length is empty, attempt to retrieve the size from the response body
if [ -z "$content_length" ]; then
  content_length=$(curl -s "$URL" | wc -c)
fi

# Check if the content length is still empty
if [ -z "$content_length" ]; then
  echo "Unable to retrieve the content length."
  exit 1
fi

# Display the content length in bytes
echo "$content_length"
