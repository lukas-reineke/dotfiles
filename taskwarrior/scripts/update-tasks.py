from taskw import TaskWarrior

w = TaskWarrior()
tasks = w.load_tasks()

# replace_tags = {
#     'trello_prio:_high': 'trello_high_priority',
#     'trello_prio:_med': 'trello_medium_priority',
#     'trello_prio:_low': 'trello_low_priority',
#     'github_awaiting____': 'github_awaiting',
# }

done_trello_lists = [
    "PR Sent",
    "Merged in Develop",
    "Merged in Candidate",
    "Merged in Master",
    "Merged in Release",
    "Done",
]

replace_projects = {
    "Project Cinnamon": "cinnamon",
    "Development: Backend Services": "services",
    "Merchant Widget": "widget",
    "Development: Adgo App": "monolith",
}

priority_map = {
    "trello_high_priority": "H",
    "trello_medium_priority": "M",
    "trello_low_priority": "L",
    "github_awaiting": "H",
    "github_needs_fixes": "L",
    "github_do_not_merge": "L",
}

for task in tasks["pending"]:
    update = False

    # for old_tag, new_tag in replace_tags.items():
    #     if old_tag in task.get('tags', []):
    #         task['tags'] = [
    #             new_tag
    #             if tag == old_tag
    #             else tag
    #             for tag in task['tags']
    #         ]
    #         update = True

    org_priority = task.get("priority")
    for tag, priority in priority_map.items():
        if tag in task.get("tags", []) and task.get("priority") != priority:
            task["priority"] = priority
    if org_priority != task.get("priority"):
        update = True

    for old_project, new_project in replace_projects.items():
        if task.get("project") == old_project:
            task["project"] = new_project
            update = True

    if task.get("intheamtrellolistname") == "Done":
        task["status"] = "done"
        update = True

    if task.get("trellolist") in done_trello_lists:
        task["status"] = "done"
        update = True

    if update:
        w.task_update(task)
        print("U", end="", flush=True)
    else:
        print(".", end="", flush=True)

print()
