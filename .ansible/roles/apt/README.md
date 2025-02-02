# apt

Slightly alter default APT configuration:
- remove unneeded APT configuration files,
- add some configuration (for example disable recommended packages installation),
- configure base repositories as well as extra repositories,
- make sure a few useful packages are installed.

Note that backports are always enabled because only manually installed older packages are upgraded to newer ones from
backports.
