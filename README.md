# Guide to deploy a full HashiStack cluster with network

## Please see the documentation for the [hashistack-aws](https://github.com/hashicorp-modules/hashistack-aws) repository.

## Usage


### Limitations noted in the the [hashistack-aws](https://github.com/hashicorp-modules/hashistack-aws) repository
- **This repository is currently being tested.**
- Vault is not configured to use TLS.
- Vault is not initialized. Please refer to the [Vault documentation](https://www.vaultproject.io/docs/internals/architecture.html) for instructions.
- Nomad is not configured to use Vault as it requires a Vault Token. Please refer to the [Nomad documentation](https://www.nomadproject.io/docs/vault-integration/) for information on how to configure the integration.
