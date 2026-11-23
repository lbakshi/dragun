# Terraform

Components live in their own root directories here. From `engineering/`, the
Makefile delegates commands such as `make plan-dataset` to the named component.
Name the component explicitly; do not assume a default.

Each root links the shared `provider.tf` and declares its own provider requirements
and backend. Keep provider values in an ignored `terraform.tfvars`; worktrees can
link that file to the primary checkout. AWS credentials come from the local AWS
profile, not Terraform configuration or variables files.

Each root uses the existing private Lucky9 S3 state bucket and lock table, with
a distinct state key declared in that root. Configure shared backend settings in
the ignored `backend.hcl`, using `backend.hcl.example` as a template. The backend
and provider profiles must target the intended account. Do not commit backend
configuration, Terraform state, plans, credentials, or dataset files. Terraform
caches backend configuration in the ignored `.terraform/` directory. Remote state
is already shared and locked in S3; no local state symlink is needed.

Keep the private backend file and each component's `terraform.tfvars` in the
primary checkout. For a new worktree, create symlinks to those files as a
one-time setup step; Git does not create ignored files or their links. Terraform
and Make read the linked files normally and do not manage the links.

From `engineering/`, use `make init-<component>`, `make validate-<component>`,
`make plan-<component>`, and `make deploy-<component>`. Review plans before
deployment. See the component README for its specific setup and operations.
