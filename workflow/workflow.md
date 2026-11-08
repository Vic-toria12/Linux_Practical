# Complete Practical Workflow

**Important:** Commands below are instructions, not evidence of execution. Replace no task-specified values. Do not publish your password.

## Phase 1 — Create the required user

**Run as:** existing administrator/root account.

1. Open the Kali Linux terminal.
2. Create the account:

   ```bash
   sudo adduser student01
   ```

   `adduser` interactively creates the account and prompts for a password and optional profile details. Enter a password privately; do not put it in command history or this repository. If already operating as root, run `adduser student01` without `sudo`.

3. Add the account to the sudo group only if sudo access is required in your environment:

   ```bash
   sudo usermod -aG sudo student01
   ```

   This is an administrator action. The `-aG` options append the user to the supplementary group rather than replacing other group memberships. If the lab environment does not require `student01` to use sudo, follow the instructor's direction and do not make an unnecessary privilege change.

4. Switch to the new account:

   ```bash
   su - student01
   ```

   Enter the `student01` password when prompted.

**Verify:**

```bash
whoami
pwd
```

Expected: `whoami` prints `student01`; `pwd` should identify the new user's home directory (commonly `/home/student01`).

**Evidence:** If evidence is requested, capture the terminal showing `whoami` and the home-directory path. Do not show or record the password.

## Phase 2 — Create the project directories

**Run as:** `student01`.

```bash
cd ~
mkdir -p project/docs project/scripts project/bin
cd ~/project/docs
```

- `cd ~` moves to the current user's home directory.
- `mkdir -p` creates the required directory tree and does not fail merely because a directory already exists.
- The final `cd` places you in `docs/`.

**Verify:**

```bash
pwd
ls -la ~/project
ls -la ~/project/docs
```

Expected: `project/` contains `docs/`, `scripts/`, and `bin/`.

**Evidence:** Capture the directory listing if screenshots are requested.

## Phase 3 — Create the report and hidden file

**Run as:** `student01`, from `~/project/docs`.

Create the report using the required `echo` command:

```bash
echo "This is the initial report by student01." > report.txt
```

Create the hidden file:

```bash
echo "Top Secret" > .secret.txt
```

List all entries, including hidden entries:

```bash
ls -la
```

**Verify:**

```bash
cat report.txt
cat .secret.txt
```

Expected:
- `report.txt` contains `This is the initial report by student01.`
- `.secret.txt` contains `Top Secret`
- `ls -la` displays `.secret.txt` as well as ordinary entries.

**Evidence:** Capture the `ls -la` output and, if useful, the two file contents. Do not confuse a hidden filename (begins with `.`) with encryption or access control.

## Phase 4 — Edit, copy, move, and create the shell file

**Run as:** `student01`.

1. Open the report in nano:

   ```bash
   nano ~/project/docs/report.txt
   ```

   Add this as a second line, preserving the first line:

   ```text
   Appended line using nano.
   ```

   Save with `Ctrl+O`, press `Enter`, and exit with `Ctrl+X`.

2. Copy the report to `scripts/`:

   ```bash
   cp ~/project/docs/report.txt ~/project/scripts/report.txt
   ```

3. Move and rename the hidden file:

   ```bash
   mv ~/project/docs/.secret.txt ~/project/bin/classified.txt
   ```

4. Create `install.sh` with the exact task content:

   ```bash
   cat > ~/project/scripts/install.sh <<'EOF'
   #!/bin/bash
   echo "Installing project dependencies..."
   EOF
   ```

   This uses a quoted here-document delimiter so the text is written literally. Creating the file does not execute it.

**Verify:**

```bash
cat ~/project/docs/report.txt
diff -u ~/project/docs/report.txt ~/project/scripts/report.txt
cat ~/project/scripts/install.sh
ls -la ~/project/docs ~/project/scripts ~/project/bin
```

Expected: the report has two lines; `diff` prints nothing if the copy matches; `install.sh` contains the two specified lines; `classified.txt` is in `bin/`; `.secret.txt` is no longer in `docs/`.

**Evidence:** Capture the file contents and directory listing if requested.

## Phase 5 — Set the required permissions

**Run as:** `student01` (the owner of these files).

1. Make `install.sh` executable by all users:

   ```bash
   chmod a+x ~/project/scripts/install.sh
   ```

2. Remove read permission for others from `classified.txt`:

   ```bash
   chmod o-r ~/project/bin/classified.txt
   ```

3. Create `admin_notes.txt` and set owner read/write only:

   ```bash
   touch ~/project/docs/admin_notes.txt
   chmod 600 ~/project/docs/admin_notes.txt
   ```

   Mode `600` means owner read/write (`rw-`), group no permissions (`---`), and others no permissions (`---`).

**Verify:**

```bash
ls -l ~/project/scripts/install.sh
ls -l ~/project/bin/classified.txt
ls -l ~/project/docs/admin_notes.txt
stat -c '%A %a %n' ~/project/scripts/install.sh ~/project/bin/classified.txt ~/project/docs/admin_notes.txt
```

Expected:
- `install.sh` has execute (`x`) permission for owner, group, and others.
- `classified.txt` has no `r` in the others permission triplet. Other permission bits are not changed by `chmod o-r`.
- `admin_notes.txt` has mode `600` / symbolic permissions `-rw-------` before deletion.

**Evidence:** Capture the `ls -l` or `stat` output before deleting `admin_notes.txt`, if evidence is requested.

## Phase 6 — Clean up and create the backup

**Run as:** `student01`.

Delete the temporary notes file:

```bash
rm ~/project/docs/admin_notes.txt
```

Create the backup directory:

```bash
mkdir -p ~/project/backup
```

Copy both source directories into it, preserving their directory names:

```bash
cp -a ~/project/docs ~/project/scripts ~/project/backup/
```

This produces `backup/docs/` and `backup/scripts/`, including the report and install script. The task says to copy the entire content of `docs` and `scripts` into `backup`; preserving each source directory is a clear, non-colliding interpretation. If your instructor specifically expects a flat merge into `backup/`, ask before changing this behavior.

**Verify:**

```bash
find ~/project/backup -maxdepth 3 -type f -print
test ! -e ~/project/docs/admin_notes.txt && echo "admin_notes.txt has been removed"
diff -u ~/project/docs/report.txt ~/project/backup/docs/report.txt
diff -u ~/project/scripts/install.sh ~/project/backup/scripts/install.sh
```

Expected: backup contains copies under `backup/docs/` and `backup/scripts/`; `admin_notes.txt` is absent; the `diff` commands print no differences for matching copies.

**Evidence:** Capture the backup listing and cleanup verification if requested.

## Phase 7 — Final checks

**Run as:** `student01`, from the home directory.

```bash
cd ~
tree project
ls -la ~/project/docs
ls -la ~/project/scripts
ls -la ~/project/bin
ls -la ~/project/backup
```

If `tree` is missing, the task instructs you to install it:

```bash
sudo apt install tree
```

If package lists need refreshing, run `sudo apt update` first. These package-management commands require sudo privileges; if `student01` was not granted sudo, ask the instructor or use an authorized administrator account to install `tree`.

Check the permissions and file locations against the task, not against an assumed sample output.

**Evidence:** The task explicitly asks for `tree project` and `ls -la` checks. Save terminal output or screenshots if your instructor requests evidence.

## Phase 8 — Optional bonus: save command history

**Run as:** `student01`, in the same shell session used for the lab.

```bash
history
history > ~/commands_used.txt
```

The first command displays the history. The second redirects the history output to `commands_used.txt` in the home directory, replacing that file if it already exists. Verify with:

```bash
ls -l ~/commands_used.txt
cat ~/commands_used.txt
```

This bonus is optional. The task does not say that command history must be submitted, but it does specify the filename and location if you complete the bonus.

## Completion checklist

- [ ] Account `student01` created and password set.
- [ ] Sudo group membership handled only if required.
- [ ] `whoami` confirms `student01`.
- [ ] `project/docs`, `project/scripts`, and `project/bin` created.
- [ ] `docs/report.txt` contains both required lines.
- [ ] `docs/.secret.txt` created and later moved/renamed to `bin/classified.txt`.
- [ ] `scripts/report.txt` copied from the edited report.
- [ ] `scripts/install.sh` contains the exact required content.
- [ ] `install.sh` executable by all users.
- [ ] Others' read permission removed from `classified.txt`.
- [ ] `docs/admin_notes.txt` set to mode `600`, then deleted.
- [ ] `backup/docs/` and `backup/scripts/` contain the copied source directories.
- [ ] `tree project` and `ls -la` final checks completed.
- [ ] Optional: `~/commands_used.txt` saved.
