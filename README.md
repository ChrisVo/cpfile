# cpfile

🍎 **macOS Only** - A simple command-line tool for macOS that copies files to the clipboard, allowing you to paste them into applications like Finder, email clients, and more.

> ⚠️ **Platform Requirement**: This tool only works on macOS (Mac computers) as it uses Apple's AppleScript technology. It will not work on Windows or Linux.

## Features

- 🚀 **Simple**: Just `cpfile filename` and it's copied to your clipboard
- 📁 **File-aware**: Copies actual files (not just paths) so you can paste into Finder
- ✅ **Robust**: Includes error handling and helpful messages
- 🍺 **Homebrew-ready**: Easy installation via Homebrew

## Installation

### Via Homebrew (Recommended)

```bash
# This will be available once the formula is submitted to Homebrew
brew install cpfile
```

### Manual Installation

```bash
git clone https://github.com/your-username/cpfile.git
cd cpfile
sudo make install
```

This will install `cpfile` to `/usr/local/bin/` (requires sudo for system directory access). You can customize the installation prefix:

```bash
sudo make install PREFIX=/opt/local
```

## Usage

### Basic Usage

```bash
# Copy a file to clipboard
cpfile image.png

# Copy with absolute path
cpfile /path/to/document.pdf

# Copy from home directory
cpfile ~/Desktop/file.txt
```

### Options

```bash
# Show help
cpfile --help

# Show version
cpfile --version
```

### Examples

```bash
# Copy an image and paste it into an email
cpfile screenshot.png
# Now Cmd+V in your email client will attach the image

# Copy a document and paste it into Finder
cpfile report.pdf
# Now Cmd+V in Finder will copy the file there

# Copy multiple files (run multiple times)
cpfile file1.txt
cpfile file2.txt
# The last file copied will be in the clipboard
```

## How It Works

`cpfile` uses macOS's built-in AppleScript functionality to copy files to the clipboard as file URLs. This means:

- ✅ **Works with Finder**: Paste files directly into Finder windows
- ✅ **Works with email**: Attach files by pasting in email clients
- ✅ **Works with messaging**: Share files in Messages, Slack, etc.
- ✅ **Works with cloud storage**: Paste files into Dropbox, Google Drive, etc.

The underlying AppleScript command used is:

```applescript
set the clipboard to (POSIX file "/absolute/path/to/file")
```

## Requirements

- 🍎 **macOS only**: This tool uses macOS-specific AppleScript functionality
  - ❌ **Does NOT work on Windows**
  - ❌ **Does NOT work on Linux**
  - ✅ **Works on macOS 10.6+ (Snow Leopard and newer)**
- **Bash**: Uses bash scripting (available on all macOS systems)
- **realpath**: Uses the `realpath` command (available on macOS 12+, or install via Homebrew)

## Development

### Testing

```bash
# Test if cpfile is properly installed
make test

# Manual testing
./cpfile --help
./cpfile --version
./cpfile test-file.txt  # (create a test file first)
```

### Uninstalling

```bash
sudo make uninstall
```

## Creating a Homebrew Formula

To submit this to Homebrew, you'll need to:

1. **Create a GitHub release** with a tarball
2. **Calculate the SHA256** of the tarball
3. **Create a formula** like this:

```ruby
class Cpfile < Formula
  desc "Copy files to clipboard on macOS (macOS only)"
  homepage "https://github.com/your-username/cpfile"
  url "https://github.com/your-username/cpfile/archive/v1.0.0.tar.gz"
  sha256 "your-sha256-hash-here"
  license "MIT"

  depends_on :macos

  def install
    bin.install "cpfile"
  end

  test do
    system "#{bin}/cpfile", "--version"
  end
end
```

4. **Submit to homebrew-core** or create your own tap

## License

MIT License - feel free to use, modify, and distribute.

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test on macOS
5. Submit a pull request

## Troubleshooting

### "command not found: realpath"

If you're on an older macOS version:

```bash
brew install coreutils
```

### "Permission denied" during installation

The installation requires administrator privileges to write to `/usr/local/bin/`:

```bash
sudo make install
```

### "Permission denied" when running

Make sure the script is executable:

```bash
chmod +x cpfile
```

### "Failed to copy file to clipboard"

- Ensure the file exists and is readable
- Check that you're running on macOS
- Try with a different file type

## Similar Tools

- `pbcopy` - Copies text to clipboard (built into macOS)
- `osascript` - The underlying AppleScript runner (built into macOS)

`cpfile` fills the gap for copying actual files (not just text) to the clipboard.

## Platform Compatibility

- ✅ **macOS**: Fully supported (macOS 10.6+)
- ❌ **Windows**: Not supported (uses macOS-specific AppleScript)
- ❌ **Linux**: Not supported (uses macOS-specific AppleScript)

If you need similar functionality on other platforms, consider:

- **Windows**: Use PowerShell with `Set-Clipboard -Path "file.txt"`
- **Linux**: Use `xclip` or platform-specific clipboard tools
