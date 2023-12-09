Tmux
====


# Reload confiure

`tmux source-file ~/.tmux.conf`

or

`C-b`+`:`

`:source-file ~/.tmux.conf`

# Select mod

```
set-window-option -g mode-keys vi
bind-key -T copy-mode-vi 'v' send -X begin-selection
bind-key -T copy-mode-vi 'y' send -X copy-selection-and-cancel
```

Enter:`C-b` + `[`

paste:`C-b`+`]`



