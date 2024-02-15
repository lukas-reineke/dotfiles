# Moves to the next workspace on the current monitor

import json
import subprocess


def run(cmd):
    return subprocess.run(cmd, shell=True, check=True, stdout=subprocess.PIPE, text=True).stdout


def find_next_id_in_group(id, id_list):
    # Determine the group's start and end IDs based on the given ID
    group_start = ((id - 1) // 10) * 10 + 1
    group_end = group_start + 9

    # Filter IDs to only those in the same group
    group_ids = sorted([x for x in id_list if group_start <= x <= group_end])

    # Find the next ID in the group, or loop around if necessary
    for next_id in group_ids:
        if next_id > id:
            return next_id
    return group_ids[0] if group_ids else None


active_worspace = json.loads(run("hyprctl activeworkspace -j"))
workspaces = json.loads(run("hyprctl workspaces -j"))

ids = [workspace["id"] for workspace in workspaces]
next_id = find_next_id_in_group(active_worspace["id"], ids)

if next_id:
    run(f"hyprctl dispatch workspace {next_id} -j")
