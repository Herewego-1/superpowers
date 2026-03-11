---
name: plugin-management
description: Use when user runs /plugin, /plugin install, /plugin marketplace add, /plugin update, or /plugin list to manage Claude Code plugins from marketplaces
---

## Overview

Manage Claude Code plugins from registered marketplaces. Supports installing, updating, listing, and adding new marketplaces.

## Commands

### `/plugin marketplace add <source>`

Register a new plugin marketplace.

- `<source>` can be a full git URL or `owner/repo` shorthand (expands to `https://github.com/<owner>/<repo>.git`)
- Fetch the remote `marketplace.json` from the source
- Add it to the local marketplace registry at `~/.claude/marketplaces.json`

**Process:**
1. Resolve the source URL
2. Fetch `marketplace.json` from the repo (via `git clone --depth 1` to a temp dir or raw URL)
3. Append marketplace entry to `~/.claude/marketplaces.json`
4. Confirm: "Marketplace '<name>' added. Run `/plugin install` to see available plugins."

### `/plugin install [name]`

Install a plugin from registered marketplaces.

**If no name given:**
1. Load all registered marketplaces
2. Display a numbered list of all available plugins with descriptions
3. Ask user to choose
4. Install selected plugin

**If name given:**
1. Find the plugin in registered marketplaces
2. Clone/copy plugin files to `~/.claude/plugins/<name>/`
3. Load skills from the plugin into the active session
4. Confirm: "Plugin '<name>' installed. Restart Claude Code to activate."

**Installation location:** `~/.claude/plugins/<name>/`

### `/plugin update`

Update all installed plugins to latest versions.

1. For each installed plugin, find its source
2. Pull latest changes
3. Report what was updated

### `/plugin list`

List all available plugins across registered marketplaces.

Display: name, description, marketplace source, install status.

## Error Handling

- Invalid marketplace URL → "Could not fetch marketplace.json from <source>. Check the URL and try again."
- Plugin not found → "Plugin '<name>' not found. Run `/plugin list` to see available plugins."
- Network failure → "Network error. Check your connection and retry."
