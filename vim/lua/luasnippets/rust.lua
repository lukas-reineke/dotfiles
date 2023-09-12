local regular = {}

local auto = {
    s(
        "cns",
        fmt([[println!("{{:?}}", {input}); // NO_COMMIT]], {
            input = i(1),
        })
    ),

    s(
        "dbg",
        fmt([[dbg!({input}); /* NO_COMMIT */]], {
            input = i(1),
        })
    ),

    s("slp", t [[std::thread::sleep(std::time::Duration::from_secs(10));]], { condition = conds.line_begin }),

    s(
        "ssp",
        fmt(
            [[
                println!("{spacer} ┃ {file}:{line} > {input_rep}");
                println!("{{:?}}", {input}); // NO_COMMIT
                println!("{spacer}");
            ]],
            {
                input = i(1),
                input_rep = f(function(args)
                    return args[1][1]:gsub('"', '\\"'):gsub("\n", " ")
                end, 1),
                spacer = f(function(args)
                    return args[1][1]:gsub(".", "-")
                end, 1),
                file = f(function()
                    return vim.fn.expand "%:t"
                end),
                line = f(function()
                    return tostring(vim.fn.line "." - 2)
                end),
            }
        ),
        { condition = conds.line_begin }
    ),
}

return regular, auto
