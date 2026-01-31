# Copilot Instructions for Setup Repository

## Project Overview
This is a local-only Ansible playbook for setting up a user's environment on a Debian-based system. It configures system settings, packages, and dotfiles through a collection of modular Ansible roles.

## High-Level Architecture

### Main Structure
- **`setup.yml`** - Entry point; defines the main play that includes all roles with their tags
- **`.ansible/roles/`** - Contains 13+ reusable roles, each responsible for a specific aspect (apt packages, SSH, git config, user limits, system settings, etc.)
- **`dotfiles/`** - Configuration files managed by the playbook (e.g., .bashrc, .vimrc, .ssh/config)
- **`.ansible/hosts`** - Inventory file (localhost only)

### Key Architectural Patterns
- **Tag-based execution**: Each role has a tag (e.g., `apt`, `git`, `ssh`, `limits`) allowing selective playbook runs
- **Role composition**: Roles are composed via `setup.yml` and can pass variables for customization
- **Handlers**: Used for service restarts and configuration reloads (see `handlers/main.yml` in roles)
- **Defaults vs Variables**: Roles use `defaults/main.yml` for defaults; `setup.yml` passes overrides via `vars:`

### Important Build/Dependency Management
- Uses **`uv`** (Python package manager) for dependency isolation and tool execution
- **`.tool-versions`** specifies uv version (0.9.26) - managed by asdf
- Ansible and ansible-lint are installed on-demand via `uvx` to avoid system-wide Python pollution

## Build, Test, and Lint Commands

### Prerequisites
1. Install [`asdf`](https://asdf-vm.com/guide/getting-started.html)
2. Add and install plugins: `asdf plugin add uv && asdf install`

### Running the Playbook
- **Check mode (dry-run)**: `uvx --from 'ansible>=12' ansible-playbook --ask-become-pass setup.yml --check`
- **Apply changes**: `uvx --from 'ansible>=12' ansible-playbook --ask-become-pass setup.yml`
- **Run specific roles**: `uvx --from 'ansible>=12' ansible-playbook --ask-become-pass setup.yml --tags <tag> --check`
  - Example: `--tags apt,git` runs only apt and git configuration

### Linting
- **Lint all files (strict mode, auto-fix)**: `uvx ansible-lint --strict --fix=all`
- **Lint with no color output**: `uvx ansible-lint --nocolor --strict`
- **CI runs**: `uvx ansible-lint --strict` (check mode in CI/CD)

### Checking Tool Versions
- `uvx --from 'ansible' ansible --version`
- `uvx ansible-lint --nocolor --version`

## Key Conventions

### Ansible Best Practices
- Tasks have **descriptive names** describing what they do, not how (e.g., "Ensure Vim is installed", not "apt install vim")
- Use **check mode extensively** to validate changes before applying
- **Comments in code** explain *why* something is done (e.g., "For IDEs like IntelliJ IDEA, see https://...")

### YAML Formatting
- Use 2-space indentation
- Prefer explicit task names over shorthand
- Use YAML block format for multi-line commands (e.g., `|` for scripts)
- Always include a leading `---` in playbook and role files

### Role Structure
Each role follows a standard Ansible layout:
```
.ansible/roles/ROLENAME/
├── defaults/main.yml       # Default variables (lowest precedence)
├── handlers/main.yml       # Handler definitions for service restarts
├── tasks/main.yml          # Main task list
├── templates/              # Jinja2 templates for configuration files
├── files/                  # Static files to copy
└── README.md              # Role documentation
```

### Linting Exclusions
Some roles are excluded from ansible-lint because they use community collections not available during CI:
- `.ansible/roles/gnome/tasks/main.yml` - Uses `community.general.dconf`
- `.ansible/roles/user/tasks/main.yml` - Uses `ansible.posix.synchronize`
- `.ansible/roles/vim/tasks/main.yml` - Uses `community.general.alternatives`

See `.ansible-lint` for exclusion list.

### Ansible Configuration
- **`ansible.cfg`** sets:
  - Inventory: `.ansible/hosts`
  - Roles path: `.ansible/roles`
  - Python interpreter: `auto_silent` (respects uv's managed Python)
  - Always show diffs: `[diff] always = true`

## CI/CD Pipeline
- **Trigger**: On push to `main`, pull requests to `main`, and weekly schedule
- **Single job**: Runs `ansible-lint --strict` to catch syntax/style issues
- Uses `.python-version` (not shown but used by GitHub Actions) for Python setup
- Runs linting via uv with version 0.5.21

## Common Development Patterns

### When Making Changes
1. Modify role tasks or add new roles
2. Run `uvx ansible-lint --strict --fix=all` to auto-fix style issues
3. Run `uvx --from 'ansible>=12' ansible-playbook --ask-become-pass setup.yml --check` to verify
4. Test specific roles with `--tags <role-name>`
5. Push and verify CI passes

### When Debugging
- Use `--tags <tag> --check` to isolate specific roles
- Check role-specific README files in `.ansible/roles/*/README.md`
- Ansible displays diffs automatically (configured in `ansible.cfg`)

### When Adding External Packages/Dependencies
- Update role tasks in `.ansible/roles/packages/` or create a new role
- Ensure they pass linting before committing
- Document in role README if behavior is non-obvious

## MCP Server Configuration

### GitHub Integration
GitHub MCP server is enabled for this repository (`marcwrobel/setup`). Available operations:
- List/search issues and pull requests
- View workflow runs and artifacts
- Get commit details and diffs
- Query code across the repository

Useful for tracking playbook improvements, linking to CI runs, and understanding recent changes to roles.
