# Guiding principles: calledtoconstruct/nix-container

## Purpose and scope
A Docker image with a pre-built Nix configuration for Haskell development.

## Stack and layout
`Dockerfile` (from `nixos/nix`, channel nixos-19.09, runs `nix build`) and Nix files: `default.nix`, `compiler.nix`, `nixpkgs.nix`, `hie.nix`, `vscode.nix`, `vscode-personal.nix`.

## Commands
| Check | Command | Evidence |
|---|---|---|
| Build | `docker build .` (Dockerfile; runs `nix build` inside) | Dockerfile |
| Lint | None | - |
| Tests | None | repository tree |
| CI | None | repository tree |

Commands marked as not written down come from the build files, not from project docs; confirm them before relying on them.

## Before every push
Before every push: run the build and type-check/lint that exist here, plus only the tests for the files or feature you changed (team rule, ideas #14 note 6797). Do not run the full suite locally as a routine gate; this repository has no CI that runs the full suite, so run the full suite only when the change is broad, and say in the PR that CI coverage is missing. Merge needs a positive review. Explain any new failure your change caused. Never weaken a valid test to make it pass, and never invent a command this file does not list.

## Project rules
- Pin nixpkgs through `nixpkgs.nix`; do not reach for unpinned channels in new files.
- Keep tool lists (hlint, hoogle, brittany and others) in `default.nix`.

## What to avoid
- Committing to the default branch; work on a branch and open a pull request.
- Deleting files, branches or history, or changing repository settings.
- Adding tooling, CI or dependencies that the change does not need.
- Rules copied from other projects (file-size limits, clocks, quotas) that this repository never adopted.

## Delivery and safety
- The image is not published from this repository.

## Open questions
- The nixos-19.09 channel is very old; whether the build still works was not checked.

## Sources
Read from the `master` branch on 2026-11-08 ET: `README.md`, Dockerfile, `default.nix`.

## Instruction updates
Check `guiding-principles.version` at the start of each turn and when you enter this project; reload this file when the version changes. Change this file, its version and date, and `PRINCIPLES_HISTORY.md` in the same commit. Team-wide role instructions are versioned separately in the team-process repository.
