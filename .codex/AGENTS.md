<!-- @format -->

# Global agent instructions

Before editing a project, locate its workspace-root `AGENTS.md` and read the
instructions that apply along the path to the target files. Read an applicable
`CLAUDE.md` as well. Keep the requested changes within the author's stated scope
and preserve unrelated local work.

For projects under `~/Drive/Repositories`, start with that workspace's `AGENTS.md`.
Use the configured `cs-latex` MCP for academic work: call `project_context` for the
target, select the matching action with `list_action_workflows`, then retrieve its
rules with `guidance_context`. Read every required continuation page. Keep writing
rules in csLaTeXMCP rather than copying them into home configuration or `.memory`.
Follow the workspace's repository protections and canonical setup/health workflow
if MCP is unavailable. Use `cs-website` for the workspace's website tasks.

Keep global instructions concise. Put project-specific guidance in the existing
workspace or project instructions, following that project's rules about local
instruction files.

Manage only explicitly selected AI configuration files with `csMacDots` and yadm.
Keep authentication files usable locally and include them only in yadm's encrypted
backup. Never add plaintext credentials, conversation history, caches, databases,
or application runtime folders to the dotfiles repository.
