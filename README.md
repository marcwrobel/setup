Material for setting up my environment after it was installed.

## Getting Started

First clone this repository and install [`asdf`](https://asdf-vm.com/guide/getting-started.html).

Then install the plugins and the versions specified in the `.tool-versions` file:
```bash
asdf plugin-add uv
asdf install
```

You can then run the playbook with (it will use a localhost-only inventory by default):

```bash
uvx --from 'ansible>=11' ansible-playbook --ask-become-pass setup.yml
```

You can validate code with:

```bash
uvx --from 'ansible-lint>=24.12' ansible-lint --strict --fix=all
```

You can get tools version with:

```bash
uvx --from 'ansible>=11' ansible --version
uvx --from 'ansible-lint>=24.12' ansible-lint --nocolor --version
```
