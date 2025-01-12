#!/bin/env bash

# Enable bash options, see https://www.gnu.org/software/bash/manual/bash.html.

# Correct minor errors in the spelling of a directory component in a cd command.
shopt -s cdspell

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Match all files and zero or more directories and subdirectories with "**".
shopt -s globstar

# Append to the history file, don't overwrite it.
shopt -s histappend

# Set history length.
HISTSIZE=1000
HISTFILESIZE=1000

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Save the history after each command finishes
export PROMPT_COMMAND="history -a"

# Set search path for the cd builtin command (non-existent directories are not an issue).
export CDPATH=".:~:~/projects"
