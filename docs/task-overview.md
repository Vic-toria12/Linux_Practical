# Task Overview — Linux Command Line Practical Task

## Objective

Demonstrate understanding of basic Linux commands by completing the tasks as a newly created user in Kali Linux.

## Required steps

### Step 1 — Create and switch to a new user
1. Open the terminal.
2. Create user `student01`.
3. Set a password for the user.
4. Add the user to the `sudo` group (if required).
5. Switch to the new user using `su` or `login`.
6. Confirm the active user with `whoami`.

### Step 2 — Directory and file management
1. In the new user's home directory, create `project/` and its subdirectories `docs/`, `scripts/`, and `bin/`.
2. In `docs/`, create `report.txt` using `echo` with this exact first line:

   `This is the initial report by student01.`

3. Use `ls -la` to view hidden files and directories.
4. Create hidden file `docs/.secret.txt` containing:

   `Top Secret`

### Step 3 — Edit and move files
1. Open `report.txt` with `nano` and add this second line:

   `Appended line using nano.`

2. Copy `report.txt` to `scripts/`.
3. Move `.secret.txt` to `bin/` and rename it `classified.txt`.
4. Create `scripts/install.sh` with exactly:

   ```bash
   #!/bin/bash
   echo "Installing project dependencies..."
   ```

### Step 4 — Permissions with chmod
1. In `scripts/`, make `install.sh` executable by all users.
2. In `bin/`, remove read permission for others from `classified.txt`.
3. In `docs/`, create `admin_notes.txt` and set permissions so only the owner can read and write it.

### Step 5 — Clean-up and final touches
1. Delete `admin_notes.txt`.
2. Create `project/backup/`.
3. Copy the entire content of `docs/` and `scripts/` into `backup/`.

This workflow interprets the last instruction by preserving the two source folders inside `backup/` (`backup/docs/` and `backup/scripts/`). This keeps the contents distinguishable and avoids filename collisions. If your instructor expects a flat merge directly into `backup/`, confirm before using a different copy command.

## Final checks
1. Navigate to the home directory.
2. Run `tree project`. If `tree` is not installed, the task says to run `sudo apt install tree` first.
3. Use `ls -la` to confirm permissions and file locations.

## Optional bonus
1. Use `history` to list commands run so far.
2. Redirect the history output to `commands_used.txt` in the home directory using `>`.

## What the source does not specify

The PDF does not give a required password, a particular method for creating the account (`adduser` versus `useradd`), exact screenshot filenames, a required report, or a submission platform. This guide uses the interactive `adduser` command as a practical Kali-friendly method and does not invent a password or completed output.
