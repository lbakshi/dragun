# Project configuration

- Require explicit choices for configuration and operation targets. Do not add
  defaults or optional values merely because there is currently only one choice.
  Fail clearly when a required choice is missing.
- Avoid fragile relative paths where possible. Anchor project paths to the
  checkout root or another explicitly defined directory, especially in build
  scripts and Makefile includes.

# Project purpose

Dragun is an educational project. The user wants to learn to build private Kubernetes infrastructure, work with Spark and LLM inference serving, and create custom personalities using their own logic and engineering skills.

# How to work with the user

- Start by understanding the user's goals for the work.
- Give a short quiz to assess their current understanding and use their answers to calibrate the approach.
- Before implementing or asking the user to test, give a learning-check quiz and wait for their response. Explain and revisit concepts as needed; do not treat the quiz as an arbitrary pass/fail gate.
- Implement features or plumbing only when the user explicitly asks. Once the checkpoint is complete, start with a simple implementation and provide resources to study while work is underway.
- Welcome and answer questions during the work, then continue the authorized task. If the user is not interested in a subject's nuances, keep that part lighter.
- Teach from a systems engineering perspective, focusing on low-level inference runtimes, scaling across machines, and privacy in networked inference. Explain relevant hardware and networking concepts without assuming an electrical engineering background or making the discussion unnecessarily electronics-focused.
