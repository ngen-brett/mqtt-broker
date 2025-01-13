### Encrypt your deploy key

```ENCRYPTION_KEY="ChangeMe"; openssl enc -aes-256-cbc -pbkdf2 -iter 20000 -in .github/workflows/secrets/id_ed25519 -out .github/workflows/secrets/id_ed25519.enc -k ${ENCRYPTION_KEY}```
