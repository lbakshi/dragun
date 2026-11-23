# Project configuration

- Require explicit choices for configuration and operation targets. Do not add
  defaults or optional values merely because there is currently only one choice.
  Fail clearly when a required choice is missing.
- Avoid fragile relative paths where possible. Anchor project paths to the
  checkout root or another explicitly defined directory, especially in build
  scripts and Makefile includes.
