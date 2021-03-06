export PATH=$PATH:~/.local/bin

alias g=git

for script in ~/.bash_profile.d/*; do
    # skip non-executable snippets
    [ -x "$script" ] || continue

    # execute $script in the context of the current shell
    . $script
done