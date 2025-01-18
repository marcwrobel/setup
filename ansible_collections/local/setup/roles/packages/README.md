# packages

Manage packages on a linux distribution.

## Role Variables

Available variables are listed below, along with default values:

    packages__blacklist: []
    packages__list: []

See `defaults/main.yml` for more information.

## Usage

    - hosts: <hosts>
      roles:
        - role: 'local.setup.packages'

## Links

- [pkgs.org](https://pkgs.org)
