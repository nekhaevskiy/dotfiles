#!/usr/bin/env bash
# Import OneDark theme into Terminal.app and set as default + startup profile

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
THEME="$SCRIPT_DIR/OneDark.terminal"

# Drive Terminal directly via AppleScript rather than `defaults write`:
# Terminal caches its prefs in memory and flushes them on quit, which
# clobbers any direct plist edits made while it's running.
osascript <<EOF
tell application "Terminal"
    open POSIX file "$THEME"
    delay 1
    set default settings to settings set "OneDark"
    set startup settings to settings set "OneDark"
    -- Set via AppleScript: a hand-rolled NSFont blob in the .terminal
    -- file gets silently dropped on import, so let Terminal encode it.
    set font name of settings set "OneDark" to "JetBrainsMonoNF-Regular"
    set font size of settings set "OneDark" to 15
end tell
EOF

echo "OneDark theme imported and set as default + startup profile."
echo "Restart Terminal.app to apply to new windows."
