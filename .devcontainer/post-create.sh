#!/bin/bash

# Install system dependencies
apt-get update
apt-get install -y build-essential sqlite3 libsqlite3-dev jq

# Install AI coding assistants
npm install -g @openai/codex
npm install -g @google/gemini-cli

# Configure Claude Code user-level settings
mkdir -p ~/.claude
cat > ~/.claude/settings.json << 'EOF'
{
  "permissions": {
    "deny": [
      "Read(/.rules/prompt.txt)",
      "Write(/.rules/prompt.txt)",
      "Edit(/.rules/prompt.txt)",
      "Bash(*.claude-prompt.txt*)"
    ]
  }
}
EOF

# # Mark Claude Code onboarding as complete
# if [ -f ~/.claude.json ]; then
#   jq '. + {"hasCompletedOnboarding": true}' ~/.claude.json > ~/.claude.json.tmp && mv ~/.claude.json.tmp ~/.claude.json
# else
#   echo '{"hasCompletedOnboarding": true, "theme": "dark"}' > ~/.claude.json
# fi

# Set up alias for Claude with custom system prompt
# echo 'alias claude="claude --append-system-prompt-file \$WORKSPACE_FOLDER/.rules/prompt.txt"' >> ~/.bashrc

# Install Ruby gems and prepare database
bundle install
