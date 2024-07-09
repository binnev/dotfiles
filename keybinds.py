"""
A script to make sure my keybinds are unique across different OS/WMs
"""


from contextlib import contextmanager


class KeyBinds(dict):
    _prefix: str | None = None

    def add(self, key: str, value: str) -> None:
        actions: list[str] = self.get(key, [])
        if self._prefix:
            value = f"{self._prefix}: {value}"
        actions.append(value)
        self[key] = actions

    @contextmanager
    def prefix(self, prefix: str):
        self._prefix = prefix
        yield
        self._prefix = None


keys = KeyBinds()

# generic
keys.add("ctrl f", "search")
keys.add("alt f", "search (macos)")

keys.add("ctrl s", "save")
keys.add("alt s", "save (mac)")

keys.add("ctrl w", "close tab")
keys.add("alt w", "close tab (mac)")

keys.add("alt q", "quit (mac)")
keys.add("alt space", "launcher (mac)")

keys.add("ctrl c", "copy")
keys.add("alt c", "copy (mac)")

keys.add("ctrl v", "paste")
keys.add("alt v", "paste (mac)")

keys.add("ctrl t", "new tab")
keys.add("alt t", "new tab (mac)")

keys.add("ctrl +", "zoom in")
keys.add("alt +", "zoom in (mac)")

keys.add("ctrl -", "zoom out")
keys.add("alt -", "zoom out (mac)")

# vscode
with keys.prefix("vscode"):
    keys.add("alt d", "duplicate")
    keys.add("alt j", "select next occurrence")
    keys.add("ctrl alt p", "files pane")
    keys.add("ctrl alt g", "git pane")
    keys.add("ctrl alt h", "git branch")
    keys.add("ctrl alt s", "outline pane")
    keys.add("ctrl alt y", "terminal pane")
    keys.add("ctrl shift p", "command palette")

# obsidian
with keys.prefix("obsidian"):
    keys.add("ctrl p", "obsidian command palette")
    keys.add("cmd p", "obsidian command palette (macos)")


# chrome
with keys.prefix("chrome"):
    keys.add("ctrl l", "url bar")
    keys.add("cmd l", "url bar (macos)")

# window manager
with keys.prefix("i3"): 
    keys.add("alt enter", "new terminal")
    keys.add("alt 1-9", "switch to desktop 1-9")
    keys.add("alt shift 1-9", "move window to desktop 1-9 and go to that desktop")
    keys.add("alt i", "focus window up")
    keys.add("alt j", "focus window left")
    keys.add("alt k", "focus window down")
    keys.add("alt l", "focus window right")
    keys.add("alt shift i", "move window up")
    keys.add("alt shift j", "move window left")
    keys.add("alt shift k", "move window down")
    keys.add("alt shift l", "move window right")
    keys.add("alt shift q", "close window")

for key, actions in keys.items():
    if len(actions) != 1:
        print(f"Conflict for {key}!")
        for action in actions:
            print(f"\t{action}")
    else:
        action = actions[0]
        print(f"{key}: {action}")
