# Linux Command Line Practical

A learning-friendly, GitHub-ready guide for completing **Linux Task 02: Linux Command Line Practical** in Kali Linux.

## Objective

Demonstrate understanding of basic Linux commands by completing the supplied activity as a newly created user named `student01`.

This repository is a workflow and evidence template. It does **not** claim that the lab has been completed. Run the commands in your own Kali Linux environment and record your actual results.

## Lab requirements from the task

- Kali Linux terminal.
- Create the user `student01`, set a password, add the user to the `sudo` group if required, and switch to that user.
- Create `project/` with `docs/`, `scripts/`, and `bin/` under the new user's home directory.
- Create and edit the specified files, move/copy them to the specified locations, and apply the requested permissions.
- Delete `admin_notes.txt`, create `backup/`, and copy the contents of `docs/` and `scripts/` into it.
- Verify the result with `tree project` and `ls -la`.
- Optional bonus: use `history` and redirect the output to `commands_used.txt` in the home directory.

The task document does not specify a required screenshot set, report format, or upload/submission platform. Check with your instructor if additional submission requirements apply.

## Tools and technologies

- Kali Linux
- Bash / Linux terminal
- `adduser`, `passwd`, `usermod`, `su`
- `mkdir`, `cd`, `echo`, `ls`, `nano`, `cp`, `mv`, `cat`
- `chmod`, `rm`, `tree`, `history`, shell output redirection (`>`)

## Prerequisites

1. A working Kali Linux installation or approved Kali Linux virtual machine.
2. Access to an administrator account that can create users and, if needed, grant `sudo` group membership.
3. A terminal.
4. Internet access only if `tree` must be installed using APT.

## Environment and privilege notes

- **Administrator/root account:** create `student01`; optionally add the account to `sudo`.
- **`student01` account:** perform the directory, file, permission, cleanup, backup, and verification tasks after switching with `su - student01`.
- Commands marked `sudo` require an account with sudo privileges. If the task is being performed as root, omit `sudo` where appropriate.
- Group membership changes take effect in a new login session. Switch out and back in if you change group membership after the user has already logged in.
- Do not share your password or include it in this repository.

## Project structure

```text
linux-command-line-practical/
├── README.md
├── .gitignore
├── docs/
│   ├── README.md
│   └── task-overview.md
├── workflow/
│   ├── README.md
│   └── workflow.md
├── commands/
│   ├── README.md
│   └── commands.sh
├── evidence/
│   ├── README.md
│   ├── screenshots/
│   │   └── .gitkeep
│   └── terminal-output/
│       └── .gitkeep
└── submission/
    ├── README.md
    ├── command-history.txt
    └── final-output.txt
```

The `project/` tree described in the task is created in the **Kali Linux user's home directory**, not in this Git repository. The `commands/` folder in this repository contains a reference sequence; the `scripts/` folder created inside the lab is where the task's `install.sh` file belongs.

## Step-by-step workflow

1. Read [`docs/task-overview.md`](docs/task-overview.md) and [`workflow/workflow.md`](workflow/workflow.md).
2. Open Kali Linux terminal using an administrator account.
3. Create `student01`, set its password, and add it to `sudo` only if required.
4. Switch to `student01` and verify with `whoami`.
5. Complete the directory/file creation, editing, copy/move, permissions, cleanup, and backup steps in order.
6. Run the final verification commands.
7. If doing the optional bonus, save command history as `~/commands_used.txt`.
8. Record only your actual evidence and results in the `evidence/` and `submission/` folders.

## Expected final lab layout

After completing the required tasks, the home directory should contain a `project/` directory with the following structure. `backup/docs/` and `backup/scripts/` are used to preserve the source-directory layout when copying their contents into `backup/`.

```text
project/
├── docs/
│   └── report.txt
├── scripts/
│   ├── report.txt
│   └── install.sh
├── bin/
│   └── classified.txt
└── backup/
    ├── docs/
    │   └── report.txt
    └── scripts/
        ├── report.txt
        └── install.sh
```

`admin_notes.txt` should have been deleted. `.secret.txt` should have been moved and renamed to `bin/classified.txt`. The optional `commands_used.txt` is in the user's home directory, outside `project/`.

## Key permission expectations

- `scripts/install.sh`: executable by all users (`chmod a+x`).
- `bin/classified.txt`: read permission removed for others (`chmod o-r`).
- `docs/admin_notes.txt`: owner read/write only (`chmod 600`) before it is deleted in Step 5.

Use `ls -l` or `ls -la` to inspect actual permissions. Do not assume a permission result—verify it.

## Evidence and submission

The supplied task explicitly requires terminal verification using `tree project` and `ls -la`. It does **not** explicitly require screenshots or a particular submission format. The evidence folder is provided as an optional place to keep screenshots/output if your instructor asks for them.

The optional bonus requires `commands_used.txt` in the `student01` home directory. See [`submission/README.md`](submission/README.md).

## Troubleshooting

- **`adduser` or `usermod` says permission denied:** use an authorized administrator account or prefix the command with `sudo` if that account has sudo privileges.
- **`su - student01` fails:** check that the account exists and use the password set for `student01`.
- **`sudo` is not available to `student01`:** confirm whether sudo access is required by the lab; if you changed group membership, start a fresh login session.
- **`nano` is unfamiliar:** use the arrow keys to move to the end, add the requested line, then `Ctrl+O`, `Enter`, and `Ctrl+X` to save and exit.
- **`tree: command not found`:** follow the task instruction: `sudo apt install tree` (run `sudo apt update` first if package metadata needs refreshing).
- **A file is in the wrong directory:** use `pwd` and `find ~/project -maxdepth 3 -type f -print` to inspect locations before correcting it.

## Safety and permissions

Use only your own Kali Linux system or an environment for which you have permission. User creation and group changes affect the system account database. Do not run commands on a shared or production system without authorization.

## Final verification checklist

- [ ] `student01` was created and given a password.
- [ ] `student01` was added to `sudo` if required by the environment/task.
- [ ] `whoami` confirmed the active user is `student01`.
- [ ] `project/docs`, `project/scripts`, and `project/bin` exist in the home directory.
- [ ] `docs/report.txt` contains both required lines.
- [ ] `scripts/report.txt` is a copy of `docs/report.txt`.
- [ ] `bin/classified.txt` exists and was moved/renamed from `.secret.txt`.
- [ ] `scripts/install.sh` contains the specified two lines and is executable by all users.
- [ ] `classified.txt` has no read permission for others.
- [ ] `docs/admin_notes.txt` was created with mode `600` and then deleted.
- [ ] `backup/docs` and `backup/scripts` contain copies of the respective source directory contents.
- [ ] `tree project` and `ls -la` were run and checked.
- [ ] Optional: `~/commands_used.txt` was created from `history`.
- [ ] Actual evidence/results were saved if requested by the instructor.
