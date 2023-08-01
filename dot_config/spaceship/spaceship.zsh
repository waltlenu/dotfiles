#!/usr/bin/env zsh

# ZSH spaceship prompt
# https://github.com/denysdovhan/spaceship-prompt

# Configure spaceship prompt
SPACESHIP_PROMPT_ORDER=(
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_RPROMPT_ORDER=(
  kubectl       # Kubernetes
)

# Adds a newline character before each prompt line
SPACESHIP_PROMPT_ADD_NEWLINE=false

# Prompt symbol
SPACESHIP_CHAR_SYMBOL='  '

# Prefix before cwd when it's truncated
SPACESHIP_DIR_TRUNC_PREFIX='…/'

# While in git repo, show only root directory and folders inside it
SPACESHIP_DIR_TRUNC_REPO=false

# Show Kubernetes section
SPACESHIP_KUBECTL_SHOW=true
SPACESHIP_KUBECTL_VERSION_SHOW=false
SPACESHIP_KUBECTL_CONTEXT_SHOW=true
SPACESHIP_KUBECTL_CONTEXT_SUFFIX=''
SPACESHIP_KUBECTL_CONTEXT_COLOR=blue

# Prefix before execution time section
SPACESHIP_EXEC_TIME_PREFIX='(took '

# Suffix after execution time section
SPACESHIP_EXEC_TIME_SUFFIX=') '

# Color of Git branch subsection
SPACESHIP_GIT_BRANCH_COLOR=''

# Show exit code of last command
SPACESHIP_EXIT_CODE_SHOW=true

# Character to be shown before exit code
SPACESHIP_EXIT_CODE_SYMBOL='✘ '
