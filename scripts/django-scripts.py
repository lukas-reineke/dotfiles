scripts = [
    "runserver",
    "shell_plus --vi --ptipython",
    "test --keepdb",
    "migrate",
    "generate_constants",
]

for script in scripts:
    print(script)
