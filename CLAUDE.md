# Superpowers - Claude Code Configuration

This repository contains the Superpowers skills library for Claude Code.

## Available Skills

The following skills are installed and available via the `Skill` tool:

- **brainstorming** - Socratic design refinement before writing code
- **writing-plans** - Detailed implementation plans
- **subagent-driven-development** - Fast iteration with two-stage review
- **executing-plans** - Batch execution with human checkpoints
- **test-driven-development** - RED-GREEN-REFACTOR cycle enforcement
- **systematic-debugging** - 4-phase root cause analysis
- **verification-before-completion** - Evidence-based completion checks
- **requesting-code-review** - Pre-review checklist
- **receiving-code-review** - Structured feedback response
- **dispatching-parallel-agents** - Concurrent subagent workflows
- **using-git-worktrees** - Isolated development branches
- **finishing-a-development-branch** - Merge/PR decision workflow
- **writing-skills** - Create new skills following best practices
- **using-superpowers** - Introduction to the skills system

## Installation Applied

Skills are installed to `~/.claude/skills/` and the SessionStart hook is configured
in `~/.claude/settings.json` to automatically inject the `using-superpowers` context
at the start of each session.

## Development

When contributing to this repository, use the skills themselves:
1. Use `brainstorming` to design changes
2. Use `writing-plans` to plan implementation
3. Use `test-driven-development` during implementation
4. Use `requesting-code-review` before submitting PRs
