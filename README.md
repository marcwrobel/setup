A local Ansible playbook for setting up my environment.

## Getting Started

First clone this repository and install [`asdf`](https://asdf-vm.com/guide/getting-started.html) on the environment you want to set up.

Then install the plugins and the versions specified in the `.tool-versions` file:
```bash
asdf plugin-add uv
asdf install
```

Finally run the playbook with:

```bash
uvx --from 'ansible>=11' ansible-playbook --ask-become-pass setup.yml
```

## Running parts of the playbook

You can run specific parts of the playbook with:

```bash
uvx --from 'ansible>=11' ansible-playbook --ask-become-pass setup.yml --tags <tag>
```

## Linting

Code linting is done with `ansible-lint`, and is automatically run by the CI pipeline. You can run it locally with:

```bash
uvx ansible-lint --strict --fix=all
```

## Tools versions

You can get tools version with:

```bash
uvx --from 'ansible' ansible --version
uvx ansible-lint --nocolor --version
```
