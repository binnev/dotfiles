"""
A script to make sure my keybinds are unique across different OS/WMs
"""


class KeyBinds(dict):
    errors = set()

    def __setitem__(self, key: str, value: str) -> None:
        key = key.lower()
        if key in self:
            self.errors.add(key)
        return super().__setitem__(key, value)


keys = KeyBinds()

# MacOS specific things that are unlikely to change
keys["alt q"] = "quit (mac)"
keys["alt space"] = "launcher (mac)"
keys["alt s"] = "save (mac)"
keys["alt C"] = "copy (mac)"
keys["alt v"] = "paste (mac)"
keys["alt w"] = "close tab (mac)"
keys["alt t"] = "new tab (mac)"
keys["alt ="] = "zoom in (mac)"
keys["alt -"] = "zoom out (mac)"
keys["alt f"] = "search"

# Linux specifics
keys["ctrl s"] = "save"
keys["ctrl w"] = "close tab"
keys["alt `"] = "switch to other window same app"
keys["alt tab"] = "switch to other window"

# vscode
keys["alt d"] = "duplicate"
keys["alt j"] = "select next occurrence"
keys["ctrl alt p"] = "files pane"
keys["ctrl alt g"] = "git pane"
keys["ctrl alt h"] = "git branch"
keys["ctrl alt s"] = "outline pane"
keys["ctrl alt y"] = "terminal pane"
keys["ctrl shift p"] = "command palette"

# obsidian
keys["ctrl p"] = "command palette"

# generic
keys["ctrl f"] = "search"

# chrome
keys["ctrl l"] = "url bar"

# window manager
keys["alt enter"] = "new terminal"
keys["alt 1-9"] = "switch to desktop 1-9"
keys["alt shift 1-9"] = "move window to desktop 1-9 and go to that desktop"
keys["alt i"] = "focus window up"
keys["alt j"] = "focus window left"
keys["alt k"] = "focus window down"
keys["alt l"] = "focus window right"
keys["alt shift i"] = "move window up"
keys["alt shift j"] = "move window left"
keys["alt shift k"] = "move window down"
keys["alt shift l"] = "move window right"
keys["alt shift q"] = "close window"

for key, action in keys.items():
    print(f"{key} : {action}")
if keys.errors:
    for key in keys.errors:
        print(f"Conflict for {key}: {keys[key]}!")
