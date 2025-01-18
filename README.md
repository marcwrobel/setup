Material for setting up a laptop after it was installed.

## Getting Started

First clone this repository and install [`asdf`](https://asdf-vm.com/guide/getting-started.html).

Then install the plugins and the versions specified in the `.tool-versions` file:
```bash
asdf plugin-add uv
asdf install
```

You can then run the playbook with:

```bash
uvx --from ansible ansible-playbook --ask-become-pass --inventory localhost, setup.yml
```

You can validate code with:

```bash
uvx --from ansible-lint ansible-lint --strict --fix=all .
```
