#!/usr/bin/env bash
# Linux Command Line Practical — reference command sequence.
# This file is a STUDY AID, not an unattended script. Execute sections manually.
# Do not run the whole file as one script: user creation and nano require interaction.

# ---------------------------------------------------------------------------
# SECTION A — Existing administrator/root account
# ---------------------------------------------------------------------------

# Create the requested user; enter the password interactively when prompted.
sudo adduser student01

# Only if sudo-group membership is required in this Kali environment:
sudo usermod -aG sudo student01

# Switch to the new account; enter student01's password when prompted.
su - student01

# ---------------------------------------------------------------------------
# SECTION B — Run as student01
# ---------------------------------------------------------------------------

# Confirm account and move to its home directory.
whoami
cd ~

# Create the required project directory structure.
mkdir -p project/docs project/scripts project/bin
cd ~/project/docs

# Create report.txt with the exact first line required by the task.
echo "This is the initial report by student01." > report.txt

# Display hidden files/directories, then create the hidden file.
ls -la
echo "Top Secret" > .secret.txt

# MANUAL STEP: open report.txt in nano and append:
# Appended line using nano.
nano ~/project/docs/report.txt
# In nano: Ctrl+O, Enter, Ctrl+X to save and exit.

# Copy report and move/rename the hidden file.
cp ~/project/docs/report.txt ~/project/scripts/report.txt
mv ~/project/docs/.secret.txt ~/project/bin/classified.txt

# Create install.sh with the exact required contents.
cat > ~/project/scripts/install.sh <<'EOF'
#!/bin/bash
echo "Installing project dependencies..."
EOF

# Set requested permissions.
chmod a+x ~/project/scripts/install.sh
chmod o-r ~/project/bin/classified.txt

# Create admin_notes.txt and restrict it to owner read/write.
touch ~/project/docs/admin_notes.txt
chmod 600 ~/project/docs/admin_notes.txt

# Verify permissions BEFORE deleting admin_notes.txt.
ls -l ~/project/scripts/install.sh
ls -l ~/project/bin/classified.txt
ls -l ~/project/docs/admin_notes.txt

# Clean up and create backup copies, preserving docs/ and scripts/ folders.
rm ~/project/docs/admin_notes.txt
mkdir -p ~/project/backup
cp -a ~/project/docs ~/project/scripts ~/project/backup/

# Final checks from the home directory.
cd ~
tree project
ls -la ~/project/docs
ls -la ~/project/scripts
ls -la ~/project/bin
ls -la ~/project/backup

# OPTIONAL BONUS — save shell history in the required home-directory filename.
history
history > ~/commands_used.txt
