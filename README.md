# Guide to deploy a full HashiStack cluster with network

## Please see the documentation for the [hashistack-aws](https://github.com/hashicorp-modules/hashistack-aws) repository.

### Limitations from the hashistack-aws repo
- Vault is not configured to use TLS, please provide a set of certificates. It is strongly discouraged to use Vault without TLS.
- Vault is not initialized as the key shards need to be distributed to key holders, and it is suggested to encrypt them with GPG. Please refer to the [Vault documentation](https://www.vaultproject.io/docs/internals/architecture.html).
- Nomad is not configured to use Vault as it requires a Vault Token. Please refer to the [Nomad documentation](https://www.nomadproject.io/docs/vault-integration/) for information on how to configure the integration.
