# CLAUDE.md - AI Assistant Guide for Dotfiles Repository

## Repository Overview

This is a **personal dotfiles repository** for macOS system configuration, managing shell environments, terminal emulators, and development tools. The repository follows a modular structure with separate directories for different configuration domains.

**Primary Purpose**: Automate macOS setup and maintain consistent development environment configurations across machines.

**Target Platform**: macOS (with some Linux compatibility for configurations)

## Repository Structure

```
dotfiles/
├── kitty/              # Kitty terminal emulator configuration
│   └── kitty.conf      # Main kitty configuration (90KB+ comprehensive config)
├── setup/              # System setup and installation scripts
│   ├── brew.sh         # Homebrew package installation script
│   └── macos.sh        # macOS system preferences and defaults
├── tmux/               # Tmux terminal multiplexer configuration
│   └── .tmux.conf      # Tmux settings and plugin configuration
├── zsh/                # Zsh shell configuration (modular structure)
│   ├── .zshrc          # Main zsh configuration and plugin loader
│   ├── aliases.sh      # Command aliases and shortcuts
│   ├── exports.sh      # Environment variable exports
│   └── functions.sh    # Custom shell functions
├── .gitignore          # Git ignore patterns (vim swap files, netrwhist)
├── license.txt         # Repository license
└── readme.md           # User-facing setup instructions
```

## Key Files and Their Purposes

### Setup Scripts

#### `setup/brew.sh`
- **Purpose**: Bootstrap Homebrew and install essential development tools
- **Key Packages Installed**:
  - Core utilities: `coreutils`, `findutils`, `grep`
  - Development: `git`, `node`, `npm`, `nvm`, `pyenv`, `neovim`
  - CLI tools: `ripgrep`, `fzf`, `fd`, `bat`, `jq`, `the_silver_searcher`, `wget`
  - Fonts: `font-jetbrains-mono`
- **Important**: Includes FZF key binding installation via `$(brew --prefix)/opt/fzf/install`

#### `setup/macos.sh`
- **Purpose**: Configure macOS system defaults and preferences
- **Key Configurations**:
  - UI/UX: Expand save/print panels, disable app opening warning
  - Input: Disable press-and-hold, fast key repeat (KeyRepeat: 2, InitialKeyRepeat: 15)
  - Security: Require password immediately after sleep
  - Finder: Show all extensions, path bar, list view default
  - Dock: Remove auto-hide delay
  - Activity Monitor: CPU usage visualization, show all processes
- **Post-execution**: Kills affected applications to apply changes

### Zsh Configuration

#### `zsh/.zshrc`
- **Plugin Manager**: Uses [zsh-snap](https://github.com/marlonrichert/zsh-snap) (`~/Repos/znap/`)
- **Plugins**:
  - Prompt: `sindresorhus/pure`
  - Syntax highlighting: `zsh-users/zsh-syntax-highlighting`
  - Autosuggestions: `zsh-users/zsh-autosuggestions`
- **Dynamic Loading**: Sets `$DOTFILES` variable and sources modular config files
- **Tab Completion**: Custom completions in `~/.zsh/completion`

#### `zsh/aliases.sh`
- **Editor**: `vim` aliased to `nvim` (Neovim)
- **Git Shortcuts**: `gst` (status), `gco` (checkout), `gb` (branch)
- **Important Convention**: `rm` alias removes the `-i` flag (no interactive prompts)
- **Color Support**: Detects GNU vs BSD `ls` and sets appropriate color flags
- **Utilities**: `weather` (wttr.in), `ip` (public IP), `cleanup` (remove .DS_Store)

#### `zsh/exports.sh`
- **Editor**: `$EDITOR=nvim`
- **FZF Configuration**:
  - Default options: `--height 40% --border`
  - Default command: Uses `ag` with hidden files, ignoring `.git`

#### `zsh/functions.sh`
- **`dcl()`**: Docker Compose wrapper for `local.yml`
- **`fs()`**: Calculate file/directory sizes (handles GNU vs BSD `du`)
- **`gz()`**: Compare original vs gzipped file sizes

### Tmux Configuration

#### `tmux/.tmux.conf`
- **Plugin Manager**: TPM (Tmux Plugin Manager) at `~/.tmux/plugins/tpm/`
- **Plugins**:
  - `tmux-battery`, `tmux-copycat`, `tmux-pain-control`
  - `tmux-prefix-highlight`, `tmux-sensible`, `tmux-yank`
- **Key Settings**:
  - Prefix: `C-space` (Ctrl+Space)
  - Mouse support enabled
  - Vim mode for copy mode (`vi` keys)
  - Base index: 1 (not 0)
  - History limit: 50,000 lines
  - True color support: `xterm-256color:Tc`
- **Splits**: Open in same path as current pane

### Kitty Configuration

#### `kitty/kitty.conf`
- Large comprehensive configuration file (90KB+)
- Likely contains extensive customizations for:
  - Font configuration
  - Color schemes
  - Keyboard shortcuts
  - Window management

## Development Workflows

### Initial macOS Setup (Fresh Install)

1. **Clone Repository**:
   ```bash
   git clone git@github.com:janhellmich/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. **Install Homebrew & Tools**:
   ```bash
   bash setup/brew.sh
   ```

3. **Configure macOS Defaults**:
   ```bash
   bash setup/macos.sh
   ```
   - Requires administrator password
   - Will kill affected applications
   - Some changes require logout/restart

4. **Link Configuration Files**:
   - Create `~/.zshrc` that sources `~/dotfiles/zsh/.zshrc`
   - Create `~/.config/kitty/kitty.conf` that sources `~/dotfiles/kitty/kitty.conf`
   - Create `~/.tmux.conf` that sources `~/dotfiles/tmux/.tmux.conf`

### Making Changes

**When modifying configurations:**
- Edit files in the `~/dotfiles` directory
- Changes to zsh configs require reload: `reprof` alias or `. ~/.zshrc`
- Changes to tmux require: `<prefix>` + `I` to reload plugins, or restart tmux
- Changes to kitty: Reload kitty configuration via menu or restart

**Git Workflow:**
- Recent commits show small, focused changes ("Small fixes", "Stop using rm -i by default")
- Commit messages are concise and descriptive
- No specific branching strategy evident (likely direct commits to main/master)

## Key Conventions for AI Assistants

### File Editing Guidelines

1. **Preserve Modularity**: Keep zsh configurations separated in their respective files
   - Aliases go in `aliases.sh`
   - Environment variables go in `exports.sh`
   - Functions go in `functions.sh`

2. **Respect Platform Detection**: Many aliases detect GNU vs BSD tools
   - Don't remove platform detection logic
   - Test changes work on macOS

3. **Maintain Source Order**: In `.zshrc`, plugins load before custom configs

4. **Comment Style**: Use shell-style `#` comments

### Common Modification Patterns

**Adding a new alias:**
```bash
# Add to zsh/aliases.sh
alias newcmd="actual command here"
```

**Adding environment variable:**
```bash
# Add to zsh/exports.sh
export NEW_VAR=value
```

**Adding a function:**
```bash
# Add to zsh/functions.sh
function newfunc() {
    # function body
}
```

**Installing new Homebrew package:**
```bash
# Add to setup/brew.sh in appropriate section
brew install package-name
```

**Adding new macOS default:**
```bash
# Add to setup/macos.sh in appropriate section with comment
# Description of setting
defaults write domain.name SettingName -type value
```

### Important Notes

- **No Interactive `rm`**: The `rm` alias explicitly removes the `-i` flag (line 23 in aliases.sh)
  - This is intentional per commit ba0ce2c "Stop using rm -i by default"
  - Don't add `-i` flags back

- **Neovim as Default**: All `vim` commands redirect to `nvim`
  - Assume Neovim-specific features are available
  - Configuration lives elsewhere (not in this repo)

- **Plugin Dependencies**:
  - zsh-snap auto-installs on first run if missing
  - TPM needs manual installation for tmux plugins
  - FZF needs brew installation + setup script

- **Path Handling**: `$DOTFILES` variable dynamically set in `.zshrc`
  - Used for relative sourcing of config files
  - Don't hardcode paths to dotfiles directory

## Tools and Dependencies

### Required for Full Functionality

- **Homebrew**: Package manager for macOS
- **Git**: Version control
- **Zsh**: Shell (macOS default since Catalina)
- **Neovim**: Text editor
- **Kitty**: Terminal emulator
- **Tmux**: Terminal multiplexer

### Optional but Configured

- **Node.js/npm**: JavaScript runtime
- **nvm**: Node version manager
- **pyenv**: Python version manager
- **fzf**: Fuzzy finder
- **ripgrep**: Fast grep alternative
- **fd**: Fast find alternative
- **bat**: Cat clone with syntax highlighting
- **jq**: JSON processor
- **the_silver_searcher (ag)**: Code searching tool

## Configuration Philosophy

This repository follows these principles:

1. **Modular Organization**: Separate concerns into logical directories
2. **Platform Awareness**: Detect and adapt to GNU vs BSD tools
3. **Minimal Dependencies**: Core setup requires only Homebrew
4. **Progressive Enhancement**: Base functionality works; plugins add features
5. **Explicit Over Magic**: Clear aliases and functions over complex abstractions
6. **Fast Keyboard Access**: Fast key repeat, minimal delays, Vim-style keybindings

## Recent Changes (Commit History)

- `301653a`: New config setup
- `59bd104`: Small fixes
- `ba0ce2c`: Stop using rm -i by default (intentional `rm` behavior change)
- `54d2f18`: Some iterm preference changes
- `5a86638`: Some readme fixes

## Git Repository Information

- **Current Branch**: `claude/claude-md-mi4yzua9qjk7h2hb-01RthgQQZaPZ2tVnpTmKttLc`
- **Status**: Clean working directory
- **Remote**: `git@github.com:janhellmich/dotfiles.git`

## Questions to Ask Before Making Changes

1. **Does this change affect platform detection?** (GNU vs BSD)
2. **Should this be an alias, export, or function?** (maintain modularity)
3. **Will this work on a fresh macOS install?** (test setup order)
4. **Does this require new Homebrew packages?** (update brew.sh)
5. **Is this configuration universal or personal preference?** (dotfiles balance)

## AI Assistant Recommendations

- **Always preserve existing conventions** unless explicitly asked to change them
- **Test changes don't break the setup flow** (brew.sh → macos.sh → configs)
- **Maintain the modular structure** of zsh configurations
- **Document significant changes** in commit messages
- **Ask before removing functionality** that might have historical reasons (like rm -i removal)
- **Consider macOS-specific behavior** when suggesting changes
