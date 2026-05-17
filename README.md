A local-only Ansible playbook for setting up current user's environment on a Debian-based system.

## Getting Started

First clone this repository and install [`mise`](https://mise.en.dev/getting-started.html) on the environment you want to set up.

Then, run the playbook (check mode) with:

```bash
mise exec uv -- uvx --from 'ansible>=12' ansible-playbook --ask-become-pass setup.yml --check
```

## Running parts of the playbook

You can run specific parts of the playbook (check mode) with:

```bash
mise exec uv -- uvx --from 'ansible>=12' ansible-playbook --ask-become-pass setup.yml --tags <tag>  --check
```

## Linting

Code linting is done with `ansible-lint`, and is automatically run by the CI pipeline. You can run it locally with:

```bash
mise exec uv -- uvx ansible-lint --strict --fix=all
```

## Tools versions

You can get tool versions with:

```bash
mise exec uv -- uvx --from 'ansible' ansible --version
mise exec uv -- uvx ansible-lint --nocolor --version
```
