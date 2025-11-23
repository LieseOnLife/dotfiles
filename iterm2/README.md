# iTerm2 Settings

This directory contains your iTerm2 preferences that are automatically synced.

## How It Works

iTerm2 is configured to:
- Load preferences from this folder on startup
- Save changes to this folder when iTerm2 quits
- Keep settings in sync with your dotfiles repo

## Files

After you restart iTerm2, you'll see preference files appear here automatically:
- `com.googlecode.iterm2.plist` - Main preferences file
- Dynamic profiles (if configured)
- Color schemes
- Key mappings

## Setup on New Machine

The `setup.sh` script automatically configures iTerm2 to use this folder.
Just restart iTerm2 after running setup and your settings will load!
