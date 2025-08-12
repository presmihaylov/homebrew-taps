#!/bin/bash

set -e

# Check if version is provided as argument
if [ -z "$1" ]; then
    echo "Usage: $0 <version>"
    echo "Example: $0 0.0.3"
    exit 1
fi

VERSION="$1"
FORMULA_FILE="Formula/ccagent.rb"

echo "Updating ccagent Homebrew formula to version $VERSION..."

# Check if gh CLI is available
if ! command -v gh &> /dev/null; then
    echo "Error: GitHub CLI (gh) is required but not installed."
    exit 1
fi

# Function to get SHA256 for a release asset
get_asset_sha256() {
    local asset_name="$1"
    echo "Getting SHA256 for $asset_name..." >&2  # Send debug to stderr
    
    # Try to get SHA256 from the .sha256 file first
    local sha256=$(gh release download "v$VERSION" --repo presmihaylov/ccagent --pattern "$asset_name.sha256" --output - 2>/dev/null | cut -d' ' -f1 || true)
    
    if [ -z "$sha256" ]; then
        echo "Warning: Could not get SHA256 file for $asset_name, calculating from binary..." >&2
        # Fallback: download the binary and calculate SHA256
        local temp_file=$(mktemp)
        gh release download "v$VERSION" --repo presmihaylov/ccagent --pattern "$asset_name" --output "$temp_file" >&2
        sha256=$(shasum -a 256 "$temp_file" | cut -d' ' -f1)
        rm "$temp_file"
    fi
    
    echo "$sha256"  # Only output the SHA256 to stdout
}

# Get SHA256 hashes for all platforms
echo "Fetching SHA256 hashes..."
DARWIN_ARM64_SHA=$(get_asset_sha256 "ccagent-v$VERSION-darwin-arm64")
DARWIN_X86_64_SHA=$(get_asset_sha256 "ccagent-v$VERSION-darwin-x86_64")
LINUX_ARM64_SHA=$(get_asset_sha256 "ccagent-v$VERSION-linux-arm64")
LINUX_X86_64_SHA=$(get_asset_sha256 "ccagent-v$VERSION-linux-x86_64")

echo "Updating formula with SHA256 hashes..."

# Create a temporary file with the updated formula
cat > "$FORMULA_FILE.tmp" << EOF
class Ccagent < Formula
  desc "CLI agent for Claude Code integration with Socket.IO backend"
  homepage "https://github.com/presmihaylov/ccagent"
  license "MIT"
  version "$VERSION"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/presmihaylov/ccagent/releases/download/v#{version}/ccagent-v#{version}-darwin-arm64"
      sha256 "$DARWIN_ARM64_SHA"
    else
      url "https://github.com/presmihaylov/ccagent/releases/download/v#{version}/ccagent-v#{version}-darwin-x86_64"
      sha256 "$DARWIN_X86_64_SHA"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/presmihaylov/ccagent/releases/download/v#{version}/ccagent-v#{version}-linux-arm64"
      sha256 "$LINUX_ARM64_SHA"
    else
      url "https://github.com/presmihaylov/ccagent/releases/download/v#{version}/ccagent-v#{version}-linux-x86_64"
      sha256 "$LINUX_X86_64_SHA"
    end
  end

  def install
    # The downloaded file will have the full name, rename to just 'ccagent'
    downloaded_file = Dir["ccagent-*"].first
    bin.install downloaded_file => "ccagent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ccagent --version")
  end
end
EOF

# Replace the original file
mv "$FORMULA_FILE.tmp" "$FORMULA_FILE"

echo "✅ ccagent Homebrew formula updated to version $VERSION!"
echo ""
echo "SHA256 hashes:"
echo "  macOS ARM64:  $DARWIN_ARM64_SHA"
echo "  macOS x86_64: $DARWIN_X86_64_SHA" 
echo "  Linux ARM64:  $LINUX_ARM64_SHA"
echo "  Linux x86_64: $LINUX_X86_64_SHA"
echo ""
echo "Next steps:"
echo "1. Test the formula: brew install --build-from-source presmihaylov/taps/ccagent"
echo "2. Commit and push: git add . && git commit -m 'Update ccagent to v$VERSION' && git push"
echo ""
echo "Users can install with:"
echo "  brew tap presmihaylov/taps"
echo "  brew install ccagent"
echo "  OR"
echo "  brew install presmihaylov/taps/ccagent"