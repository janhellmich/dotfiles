# CLAUDE.md - AI Assistant Guide for Dotfiles Repository

## Repository Overview

This is a personal dotfiles repository for macOS configuration management. It contains shell configurations, terminal settings, and system setup scripts optimized for development workflows.

**Primary Purpose**: Streamline macOS setup and maintain consistent development environment across machines.

**License**: MIT License (Copyright 2016-2017 Dries Vints)

## Repository Structure

```
dotfiles/
├── zsh/              # Zsh shell configuration
│   ├── .zshrc       # Main zsh configuration file
│   ├── aliases.sh   # Shell aliases
│   ├── exports.sh   # Environment variables
│   └── functions.sh # Custom shell functions
├── tmux/            # Tmux terminal multiplexer configuration
│   └── .tmux.conf   # Tmux settings and plugin definitions
├── kitty/           # Kitty terminal emulator configuration
│   └── kitty.conf   # Extensive kitty settings (~90KB)
├── setup/           # System setup and installation scripts
│   ├── brew.sh      # Homebrew and package installation
│   └── macos.sh     # macOS system preferences configuration
├── readme.md        # User-facing setup instructions
├── license.txt      # MIT license
└── .gitignore       # Git ignore rules (vim swap files, .netrwhist)
```

## Technology Stack

### Core Tools
- **Shell**: Zsh with [znap](https://github.com/marlonrichert/zsh-snap) plugin manager
- **Terminal**: Kitty terminal emulator
- **Multiplexer**: tmux with TPM (Tmux Plugin Manager)
- **Editor**: Neovim (aliased as `vim`)
- **Font**: JetBrains Mono

### Key Development Tools (Installed via Homebrew)
- **Search**: ripgrep, the_silver_searcher (ag), fd, fzf
- **Languages**: Node.js (via npm/nvm), Python (via pyenv)
- **Utilities**: git, wget, jq, bat, coreutils, findutils, GNU grep

### Zsh Plugins (via znap)
- `sindresorhus/pure` - Prompt theme
- `zsh-users/zsh-syntax-highlighting` - Command syntax highlighting
- `zsh-users/zsh-autosuggestions` - Command autosuggestions

### Tmux Plugins (via TPM)
- `tmux-battery` - Battery status display
- `tmux-copycat` - Enhanced search
- `tmux-pain-control` - Pane navigation improvements
- `tmux-prefix-highlight` - Prefix key indicator
- `tmux-sensible` - Sensible defaults
- `tmux-yank` - Copy to system clipboard

## Setup Workflow

The intended setup process for a new Mac:

1. Clone repository: `git clone git@github.com:janhellmich/dotfiles.git ~/dotfiles`
2. Install Homebrew and tools: `bash setup/brew.sh`
3. Configure macOS system preferences: `bash setup/macos.sh`
4. Create symlinks to load configurations:
   - `~/.zshrc` → should source `~/dotfiles/zsh/.zshrc`
   - `~/kitty.conf` → should source `~/dotfiles/kitty/kitty.conf`
   - `~/.tmux.conf` → should source `~/dotfiles/tmux/.tmux.conf`

## Configuration System

### Zsh Configuration Loading Order
1. **zsh/.zshrc** (main entry point)
   - Downloads and initializes znap plugin manager
   - Loads zsh plugins
   - Sets up custom tab completions
   - Sets `$DOTFILES` environment variable dynamically
   - Sources modular configuration files:
     - `exports.sh` (environment variables)
     - `aliases.sh` (command aliases)
     - `functions.sh` (shell functions)

### Important Environment Variables
- `$DOTFILES`: Dynamically set to the parent directory of the sourced .zshrc file
- `$EDITOR`: Set to `nvim` (Neovim)
- `$FZF_DEFAULT_OPTS`: FZF configuration for fuzzy searching
- `$FZF_DEFAULT_COMMAND`: Uses `ag` (the_silver_searcher) with hidden file support

## Key Aliases and Commands

### Editor Shortcuts
- `vim` → `nvim` (Neovim)
- `ali` → Edit aliases.sh
- `func` → Edit functions.sh
- `prof` → Edit .zshrc
- `reprof` → Reload .zshrc

### Git Shortcuts
- `gst` → `git status`
- `gco` → `git checkout`
- `gb` → `git branch`

### System Utilities
- `weather` → Display weather via wttr.in
- `shrug` → Copy ¯\_(ツ)_/¯ to clipboard
- `copyssh` → Copy SSH public key to clipboard
- `reloaddns` → Flush DNS cache
- `ip` → Show public IP address
- `localip` → Show local network IP
- `cleanup` → Delete all .DS_Store files recursively

### File Listing (with colors)
- `l` → Long format listing
- `la` → Long format with hidden files
- `lsd` → List only directories
- `ls` → Basic listing with colors

### macOS Finder
- `show` → Show hidden files in Finder
- `hide` → Hide hidden files in Finder

### Docker Compose
- `dcl` → Wrapper for `docker-compose -f local.yml`

## Custom Functions

### `fs()`
Determine size of a file or total size of a directory
- Usage: `fs [path]`
- Without args: shows size of all files/dirs in current directory

### `gz()`
Compare original and gzipped file size
- Usage: `gz <filename>`
- Shows compression ratio

## Tmux Configuration Highlights

### Key Bindings
- **Prefix**: `Ctrl+Space` (instead of default Ctrl+b)
- **Copy Mode**: Vi-style keybindings enabled
  - `v` → Begin selection
  - `Ctrl+v` → Rectangle selection
- **Split Windows**: Open in same directory as current pane

### Settings
- Mouse support enabled
- 50,000 line history buffer
- Base index starts at 1 (not 0)
- Window titles enabled
- True color support (24-bit)
- Aggressive resize enabled

### Status Bar
- Background: colour59 (gray)
- Shows: prefix highlight, battery status, date/time
- Right side format: `#{prefix_highlight}#{battery_status_fg} batt: #{battery_percentage} | %a %Y-%m-%d %H:%M:%S`

## macOS System Preferences (setup/macos.sh)

This script configures numerous macOS system defaults:

### UI/UX
- Expand save/print panels by default
- Disable "Are you sure you want to open?" dialog
- Disable crash reporter dialog

### Keyboard
- Disable press-and-hold for key repeat
- Fast keyboard repeat rate (KeyRepeat: 2, InitialKeyRepeat: 15)

### Screen/Security
- Require password immediately after screensaver

### Finder
- Allow quitting Finder (Cmd+Q)
- Show all filename extensions
- Show path bar
- Keep folders on top when sorting
- Use list view by default
- Disable file extension change warning

### Dock
- Remove auto-hiding delay

### Activity Monitor
- Show main window on launch
- Display CPU usage in Dock icon
- Sort by CPU usage

### Photos
- Prevent auto-opening when devices plugged in

### Messages
- Disable automatic emoji substitution

## Important Conventions for AI Assistants

### When Modifying Configuration Files

1. **Preserve Modular Structure**
   - Keep aliases in `zsh/aliases.sh`
   - Keep functions in `zsh/functions.sh`
   - Keep exports in `zsh/exports.sh`
   - Don't inline everything into `.zshrc`

2. **Maintain Comment Style**
   - Use `#` for comments in shell scripts
   - Group related settings with section comments
   - The kitty.conf uses vim fold markers: `{{{` and `}}}`

3. **Tool Installation**
   - Always add new tools to `setup/brew.sh`
   - Use `brew install` for CLI tools
   - Use `brew install --cask` for GUI applications
   - Use `brew tap` for custom repositories

4. **Alias Naming Conventions**
   - Short, memorable names (2-5 characters for frequent commands)
   - Descriptive names for less common utilities
   - Avoid overriding system commands without good reason

5. **Environment Variables**
   - Export all environment variables in `zsh/exports.sh`
   - Use UPPERCASE for exports
   - Use descriptive names

### When Adding New Features

1. **Zsh Plugins**: Add via znap in `.zshrc` with `znap source owner/repo`
2. **Tmux Plugins**: Add to `.tmux.conf` with `set -g @plugin 'owner/repo'`
3. **macOS Defaults**: Add to `setup/macos.sh` with appropriate `defaults write` commands
4. **Shell Functions**: Add to `zsh/functions.sh` with proper error handling

### File Modification Guidelines

1. **Never break existing functionality**
   - Test changes don't conflict with existing aliases/functions
   - Preserve the dynamic `$DOTFILES` variable setting

2. **Respect OS-specific code**
   - The repository is macOS-centric
   - Some scripts check for GNU vs macOS tools (see ls color flags)
   - Don't remove macOS-specific compatibility checks

3. **Maintain compatibility**
   - The `rm` alias explicitly avoids `-i` flag (see zsh/aliases.sh:23)
   - This overrides pretzo behavior - don't revert this

### Testing Changes

Before committing changes to configuration files:
1. Ensure `.zshrc` sources correctly: `source ~/.zshrc`
2. Test new aliases/functions in a shell session
3. For tmux changes: reload config with `tmux source-file ~/.tmux.conf`
4. For macOS defaults: changes often require logout/restart

### Git Workflow

- **Branch naming**: Follow the pattern `claude/claude-md-<session-id>`
- **Commit messages**: Be descriptive about what was changed and why
- **Push carefully**: Always push to the correct feature branch
- Recent commits show a pattern of configuration refinements and fixes

### Common Pitfalls to Avoid

1. **Don't hardcode paths** - Use `$DOTFILES` variable or relative paths
2. **Don't remove the znap auto-install code** - It's needed for first-time setup
3. **Don't break the dynamic `$DOTFILES` detection** - Line 19 in .zshrc uses `${0:a:h:h}` for this
4. **Check command availability** - Some functions check tool existence (e.g., `command -v md5sum`)
5. **Be careful with rm alias** - The explicit `nocorrect rm` is intentional (overrides pretzo)

### Security Considerations

- `.gitignore` excludes vim swap files and `.netrwhist`
- No sensitive data should be committed
- SSH keys are read from standard locations (`~/.ssh/id_rsa.pub`)
- The setup scripts request sudo access but don't store credentials

## Dependencies and External Resources

### Required for Full Functionality
- macOS (primary target OS)
- Homebrew package manager
- Git (for cloning and znap plugin management)
- Internet connection (for plugin downloads and weather command)

### External Services Used
- `wttr.in` - Weather information (weather alias)
- `myip.opendns.com` - Public IP lookup (ip alias)
- GitHub - Plugin sources for znap and TPM

## File Size Notes

- **kitty/kitty.conf**: ~90KB - This is the default kitty configuration with extensive comments
  - Contains comprehensive documentation for all kitty options
  - Uses vim fold markers for organization
  - Most settings are commented out (defaults)

## Recent Changes (Git History)

Recent commits focus on:
- Configuration setup refinements
- Fixing the `rm` alias behavior (stop using `-i` by default)
- iTerm preference updates (though now using Kitty)
- README documentation improvements
- Brew.sh script fixes

## Additional Notes for AI Assistants

### When Asked About Setup Issues
1. Point users to the readme.md for setup instructions
2. Remind them that znap will auto-install on first zsh launch
3. TPM plugins require manual install: `Ctrl+Space` + `I` in tmux
4. Some macOS changes require logout/restart to take effect

### When Optimizing or Refactoring
- Keep the modular structure - it's intentional for maintainability
- Preserve backward compatibility with existing shell sessions
- Document why changes are made (especially for system defaults)
- Consider cross-machine compatibility (all user's Macs should work)

### When Adding New Tools
1. Add brew install command to `setup/brew.sh`
2. Add any necessary configuration to appropriate config file
3. Add convenience aliases to `zsh/aliases.sh` if applicable
4. Update exports in `zsh/exports.sh` if environment variables are needed

---

**Last Updated**: 2025-11-13
**Repository Owner**: janhellmich
**Primary Use Case**: Personal macOS development environment configuration
