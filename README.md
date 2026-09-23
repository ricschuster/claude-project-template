# {{PROJECT_NAME}}

Stack-agnostic project harness for Claude Code workflows: no tech stack baked
in, just the process scaffolding: docs framework (design notes, ADRs,
handoffs), issue/PR templates, contribution and security policies, a license,
and Claude Code working rules (`CLAUDE.md`, `.claude/settings.json`).

## Using this template

1. Click "Use this template" on GitHub to create a new repo from this one.
2. Find and replace every `{{PROJECT_NAME}}` placeholder (README.md,
   CLAUDE.md) with your project's actual name.
3. Fill in `docs/design/00_project_brief.md`: replace every `{{...}}`
   placeholder with real content, or delete sections that do not apply
   (for example, the "Scope layers" section if the project has a single flat
   scope).
4. Fill in the `## Project purpose`, `## Project status`, `## Scope`, and
   `## Stack` sections of `CLAUDE.md` to match.
5. Pick a license. `LICENSE` here is GPL-3.0; swap it for whatever fits, and
   update the License section below.
6. Once a tech stack is chosen:
   - Fill in the `## Setup` section of `CONTRIBUTING.md` with real local-run
     commands.
   - Add your stack's own format/lint/typecheck/test/build job to
     `.github/workflows/ci.yml`, alongside the existing stack-neutral
     `repo-hygiene` job (markdown lint, no-em-dash check, docs-structure
     check, workflow lint). Do not replace that job; add another one next to
     it.
   - Add a `package-ecosystem` entry to `.github/dependabot.yml` for your
     package manager (see the commented example there).
7. Run `scripts/bootstrap-repo-settings.sh` once (requires the GitHub CLI,
   authenticated with admin access on the new repo) to set branch protection
   on `main`, enable auto-merge, and create the starter label set. Templates
   do not carry repo settings over, only files, so this step is manual.
8. Add your first ADR to `docs/decisions/` (see `docs/decisions/README.md`
   for the format; `docs/decisions/0001-record-architecture-decisions.md` is
   an example) for the stack choice you just made.
9. Delete this "Using this template" section once done, and replace it with
   real project usage instructions (what the project does for a user, how to
   run it).

## What's included

- `CLAUDE.md`: working rules and durable context, loaded automatically by
  Claude Code.
- `.claude/settings.json`: default tool permissions for Claude Code sessions
  in this repo.
- `docs/design/`: design notes, starting with a project brief template.
- `docs/decisions/`: Architecture Decision Records (ADRs).
- `docs/handoffs/`: session handoff template for continuity between work
  sessions.
- `.github/`: issue templates, PR template, Dependabot config, and a
  stack-neutral CI workflow.
- `CONTRIBUTING.md`, `SECURITY.md`, `CHANGELOG.md`, `LICENSE`.
- `scripts/bootstrap-repo-settings.sh`: one-time repo settings setup (branch
  protection, auto-merge, labels) that a template cannot carry over on its
  own.

## License

GNU General Public License v3.0. Replace with your own choice if different.
