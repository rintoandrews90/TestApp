#!/bin/bash

echo "Starting decryption..."
export PATH="/usr/local/bin:/opt/homebrew/bin:$PATH"
GPG_BIN=$(which gpg)

echo "Using gpg at: $GPG_BIN"

if [ -z "$GPG_BIN" ]; then
  echo "gpg not found in PATH"
  exit 1
fi

# Debug sandbox environment
echo "Current user: $(whoami)"
echo "Current directory: $(pwd)"
echo "PROJECT_DIR: ${PROJECT_DIR}"
echo "SRCROOT: ${SRCROOT}"
echo "BUILD_DIR: ${BUILD_DIR}"

echo "Decrypting: $FILE_NAME"
"$GPG_BIN" --batch --yes --pinentry-mode loopback --passphrase "abcde" -o "${PROJECT_DIR}/Study/Resources/apikey.plist" -d "${PROJECT_DIR}/Study/Resources/apikey.plist.gpg"

if [ $? -eq 0 ]; then
    echo "✅ Decryption succeeded."
    echo "Output: $(pwd)/apikey.plist"
else
    echo "❌ Decryption failed."
    exit 1
fi

