# dragun
Exercise in personable egg to evil robotic pet

## Structure

- `engineering/` — software, hardware, and infrastructure.
- `content/` — materials for the series.

Terraform under `engineering/infrastructure/terraform/` is organized by
component first. Each deployable component has its own Terraform root (for
example, `dataset/`); `modules/` is for reusable building blocks. When a
component needs separate development and production deployments, identify each
environment explicitly within that component and keep its state separate.
Shared components should be identified as shared rather than assumed to belong
to a particular environment.

## License

The software is licensed under the [PolyForm Noncommercial License 1.0.0](LICENSE).
