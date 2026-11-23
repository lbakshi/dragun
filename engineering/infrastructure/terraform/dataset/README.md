# Dataset bucket

This Terraform root configures a private S3 bucket for dataset files. It blocks
public access, disables object ACLs, uses S3-managed encryption, and enables
versioning. Previous object versions incur storage charges. Terraform prevents
bucket destruction while `prevent_destroy` remains in the configuration.

Set a globally unique dataset bucket name in the ignored `terraform.tfvars`.
See the [Terraform setup guidance](../README.md) for provider and backend setup.
The dataset state key is declared in this root. This configuration does not
upload data or grant additional identities access.

From `engineering/`, use `make pull-dataset` and `make push-dataset` to sync
between the ignored repository-root `dataset/` directory and the bucket's
`dataset/` prefix. Sync includes every file and does not delete files absent
from the source, but can overwrite matching objects or local files. S3 versioning
retains overwritten object versions; local files have no such guarantee.
