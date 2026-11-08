# Evidence Guide

## What the task explicitly requires

The PDF explicitly asks you to run `tree project` and use `ls -la` to confirm file locations and permissions. It does **not** explicitly require screenshots, a screenshot count, or specific screenshot filenames.

If your instructor asks for screenshots, save genuine captures in `screenshots/`. If terminal output files are requested, save genuine output in `terminal-output/`. Do not create or label placeholder files as completed evidence.

## Suggested optional screenshots

These are useful proof points, not additional requirements from the supplied PDF:

| Suggested filename | Capture after | What it can demonstrate |
|---|---|---|
| `01-student01-identity.png` | Step 1 | `whoami` identifies `student01` |
| `02-project-directories.png` | Step 2 | `project/docs`, `project/scripts`, and `project/bin` exist |
| `03-hidden-file-and-report.png` | Step 2 | `ls -la`, report first line, and `.secret.txt` |
| `04-edited-and-moved-files.png` | Step 3 | Two-line report, copied report, `install.sh`, and `classified.txt` location |
| `05-permissions-before-cleanup.png` | Step 4 | Executable `install.sh`, `classified.txt` others-read removal, and `admin_notes.txt` mode `600` |
| `06-backup-and-final-tree.png` | Steps 5 and Final Checks | `backup/` contents and `tree project` |
| `07-command-history-bonus.png` | Optional bonus | `commands_used.txt` exists and contains actual history |

## Terminal output

If requested, save actual output from commands such as:

- `whoami`
- `ls -la`
- `stat -c '%A %a %n' ...`
- `tree project`
- `history` and `cat ~/commands_used.txt` (optional bonus)

Do not paste expected/example output as if it came from your machine. Redact sensitive information before sharing evidence.
