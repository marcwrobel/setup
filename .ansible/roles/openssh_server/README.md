# openssh_server

Install the OpenSSH server.

## Regenerating moduli

You can use this script to regenerate `/etc/ssh/moduli`:

```shell
echo '# Time Type Tests Tries Size Generator Modulus' > moduli
for bits in 4096 6144 7680 8192; do
  ssh-keygen -M generate -O bits="$bits" "moduli-$bits.candidates"
  ssh-keygen -M screen -f "moduli-$bits.candidates" "moduli-$bits"
done
```

## Links

- [OpenSSH](https://www.openssh.com/)
- [Mozilla modern configuration](https://infosec.mozilla.org/guidelines/openssh#modern-openssh-67)
