# Switches to (or silently moves the active window to) a workspace on the
# current monitor. Workspaces are grouped in tens per monitor (1-10, 11-20, ...),
# so the target is the Nth workspace in the active workspace's group.
# Stand-in for the hyprsplit plugin's split:workspace / split:movetoworkspacesilent
# dispatchers while the plugin is broken.

import json
import subprocess
import sys

MODE, N = sys.argv[1], int(sys.argv[2])


def run(cmd):
    return subprocess.run(cmd, shell=True, check=True, stdout=subprocess.PIPE, text=True).stdout


active_workspace = json.loads(run("hyprctl activeworkspace -j"))
group_start = ((active_workspace["id"] - 1) // 10) * 10 + 1
target_id = group_start + N - 1

run(f"hyprctl dispatch {MODE} {target_id}")
