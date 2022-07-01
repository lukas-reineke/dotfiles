pcall(require, "luarocks.loader")
local lain = require "lain"
-- local inspect = require "inspect"

local gears = require "gears"
local awful = require "awful"
require "awful.autofocus"
local beautiful = require "beautiful"
local naughty = require "naughty"

local home = os.getenv "HOME"

awful.screen.set_auto_dpi_enabled(true)

if awesome.startup_errors then
    naughty.notify {
        preset = naughty.config.presets.critical,
        title = "Oops, there were errors during startup!",
        text = awesome.startup_errors,
    }
end

do
    local in_error = false
    awesome.connect_signal("debug::error", function(err)
        if in_error then
            return
        end
        in_error = true

        naughty.notify {
            preset = naughty.config.presets.critical,
            title = "Oops, an error happened!",
            text = tostring(err),
        }
        in_error = false
    end)
end

local modkey = "Mod4"
local shift = "Shift"
local ctrl = "Control"

awful.layout.layouts = {
    awful.layout.suit.tile,
    lain.layout.centerwork,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
}

awful.screen.connect_for_each_screen(function(s)
    if s.index == 2 or s.index == 4 then
        awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.suit.tile.bottom)
    else
        awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
    end
end)

local function next_non_empty_tag()
    for _ = 1, 9 do
        awful.tag.viewnext()
        if #awful.screen.focused().selected_tag:clients() > 0 then
            break
        end
    end
end

local globalkeys = gears.table.join(
    awful.key({ modkey }, "Tab", next_non_empty_tag),

    awful.key({}, "XF86AudioPlay", function()
        awful.spawn "playerctl -p spotify play-pause"
    end),
    awful.key({}, "XF86AudioNext", function()
        awful.spawn "playerctl -p spotify next"
    end),
    awful.key({}, "XF86AudioPrev", function()
        awful.spawn "playerctl -p spotify previous"
    end),

    awful.key({ modkey }, "v", function()
        awful.spawn(home .. "/scripts/keymaps/paste.sh")
    end),
    awful.key({ modkey }, "c", function()
        awful.spawn(home .. "/scripts/keymaps/copy.sh")
    end),
    awful.key({ modkey }, "n", function()
        awful.spawn(home .. "/scripts/keymaps/new.sh")
    end),
    awful.key({ modkey }, "w", function()
        awful.spawn(home .. "/scripts/keymaps/close.sh")
    end),
    awful.key({ modkey, shift }, "t", function()
        awful.spawn(home .. "/scripts/keymaps/reopen-tab.sh")
    end),
    awful.key({ modkey }, "z", function()
        awful.spawn(home .. "/scripts/keymaps/undo.sh")
    end),
    awful.key({ modkey, shift }, "z", function()
        awful.spawn(home .. "/scripts/keymaps/redo.sh")
    end),

    awful.key({ modkey }, "h", function()
        awful.client.focus.global_bydirection "left"
        if client.focus then
            client.focus:raise()
        end
    end),
    awful.key({ modkey }, "j", function()
        awful.client.focus.global_bydirection "down"
        if client.focus then
            client.focus:raise()
        end
    end),
    awful.key({ modkey }, "k", function()
        awful.client.focus.global_bydirection "up"
        if client.focus then
            client.focus:raise()
        end
    end),
    awful.key({ modkey }, "l", function()
        awful.client.focus.global_bydirection "right"
        if client.focus then
            client.focus:raise()
        end
    end),

    awful.key({ modkey, shift }, "h", function()
        awful.client.swap.global_bydirection "left"
    end),
    awful.key({ modkey, shift }, "j", function()
        awful.client.swap.global_bydirection "down"
    end),
    awful.key({ modkey, shift }, "k", function()
        awful.client.swap.global_bydirection "up"
    end),
    awful.key({ modkey, shift }, "l", function()
        awful.client.swap.global_bydirection "right"
    end),

    awful.key({ modkey }, "u", awful.client.urgent.jumpto),

    awful.key({ modkey }, "Return", function()
        awful.spawn "kitty --title kitty -e tmuxp load ~/dotfiles/tmux/tmuxinator/dotfiles.yml -y"
    end),
    awful.key({ modkey }, "d", function()
        awful.spawn "rofi -show drun -show-icons"
    end),
    awful.key({ modkey, shift }, "d", function()
        awful.spawn "rofi -show window -show-icons"
    end),
    awful.key({ modkey }, "i", function()
        local layouts = ""
        for i, layout in ipairs(awful.layout.layouts) do
            layouts = layouts .. layout.name
            if i ~= #awful.layout.layouts then
                layouts = layouts .. "\n"
            end
        end
        awful.spawn.easy_async_with_shell(
            string.format([[echo -e '%s' | rofi -dmenu -i -p "Layout:"]], layouts),
            function(name)
                for _, layout in ipairs(awful.layout.layouts) do
                    if layout.name == name:gsub("\n", "") then
                        awful.layout.set(layout)
                        break
                    end
                end
            end
        )
    end),
    awful.key({ modkey }, "b", function()
        awful.spawn "bwmenu -c 20"
    end),

    awful.key({ modkey, ctrl }, "r", awesome.restart),
    awful.key({ modkey, ctrl, shift }, "q", awesome.quit),

    awful.key({ modkey }, "g", function()
        awful.layout.inc(1)
    end),
    awful.key({ modkey, shift }, "g", function()
        awful.layout.inc(-1)
    end)
)

local clientkeys = gears.table.join(
    awful.key({ modkey }, "f", function(c)
        c.fullscreen = not c.fullscreen
        c:raise()
    end),
    awful.key({ modkey, shift }, "q", function(c)
        c:kill()
    end),
    awful.key({ modkey, ctrl }, "space", function(c)
        awful.client.floating.toggle(c)
        c.ontop = not c.ontop
    end),
    awful.key({ modkey }, "s", function(c)
        c.sticky = not c.sticky
    end),
    awful.key({ modkey }, "m", function(c)
        c:swap(awful.client.getmaster())
    end),
    awful.key({ modkey }, "t", function(c)
        c.ontop = not c.ontop
    end),
    awful.key({ modkey }, "o", function()
        local scr = awful.screen.focused()
        local tag = scr.selected_tag
        tag.gap_single_client = not tag.gap_single_client
        awful.layout.arrange(scr)
    end),

    awful.key({ modkey, ctrl }, "h", function(c)
        if c.floating then
            c:relative_move(0, 0, -50, 0)
        else
            awful.tag.incmwfact(-0.03)
        end
    end),
    awful.key({ modkey, ctrl }, "j", function(c)
        if c.floating then
            c:relative_move(0, 0, 0, 50)
        else
            awful.client.incwfact(0.1)
        end
    end),
    awful.key({ modkey, ctrl }, "k", function(c)
        if c.floating then
            c:relative_move(0, 0, 0, -50)
        else
            awful.client.incwfact(-0.1)
        end
    end),
    awful.key({ modkey, ctrl }, "l", function(c)
        if c.floating then
            c:relative_move(0, 0, 50, 0)
        else
            awful.tag.incmwfact(0.03)
        end
    end),
    awful.key({ modkey, ctrl, shift }, "h", function(c)
        if c.floating then
            c:relative_move(-50, 0, 0, 0)
        end
    end),
    awful.key({ modkey, ctrl, shift }, "j", function(c)
        if c.floating then
            c:relative_move(0, 50, 0, 0)
        end
    end),
    awful.key({ modkey, ctrl, shift }, "k", function(c)
        if c.floating then
            c:relative_move(0, -50, 0, 0)
        end
    end),
    awful.key({ modkey, ctrl, shift }, "l", function(c)
        if c.floating then
            c:relative_move(50, 0, 0, 0)
        end
    end)
)

for i = 1, 9 do
    globalkeys = gears.table.join(
        globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9, function()
            local screen = awful.screen.focused()
            local tag = screen.tags[i]
            if tag then
                tag:view_only()
            end
        end),
        -- Toggle tag display.
        awful.key({ modkey, ctrl }, "#" .. i + 9, function()
            local screen = awful.screen.focused()
            local tag = screen.tags[i]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end),
        -- Move client to tag.
        awful.key({ modkey, shift }, "#" .. i + 9, function()
            if client.focus then
                local tag = client.focus.screen.tags[i]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end)
    )
end

local screen_map = { 3, 2, 4, 1, 6, 5 }

for i = 1, 6 do
    globalkeys = gears.table.join(
        globalkeys,
        awful.key({ ctrl }, "#" .. i + 9, function()
            client.focus:move_to_screen(screen_map[i])
        end)
    )
end

root.keys(globalkeys)

beautiful.border_normal = "#000000"
beautiful.border_focus = "#98C379"
beautiful.border_width = 2

local clientbuttons = gears.table.join(
    awful.button({}, 1, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
    end),
    awful.button({ modkey }, 1, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
        awful.mouse.client.resize(c)
    end)
)

awful.rules.rules = {
    {
        rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            buttons = clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen,
        },
    },
    {
        rule_any = {
            instance = {},
            class = {
                "Arandr",
            },
            name = {
                "Event Tester", -- xev.
            },
            role = {
                "pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
            },
        },
        properties = { floating = true },
    },

    { rule_any = { type = { "normal", "dialog" } }, properties = { titlebars_enabled = true } },

    {
        rule = {
            name = "Picture in Picture",
        },
        properties = {
            screen = 5,
            tag = "9",
            switchtotag = true,
        },
    },

    {
        rule = {
            name = "Insomnia",
        },
        properties = {
            screen = 6,
            tag = "1",
            switchtotag = true,
        },
    },
    {
        rule = {
            name = "Spotify",
        },
        properties = {
            screen = 4,
            tag = "2",
            switchtotag = true,
        },
    },
}

client.connect_signal("manage", function(c)
    if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
        awful.placement.no_offscreen(c)
    end
end)

client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

client.connect_signal("focus", function(c)
    c.border_color = beautiful.border_focus
end)
client.connect_signal("unfocus", function(c)
    c.border_color = beautiful.border_normal
end)

beautiful.useless_gap = 15
beautiful.gap_single_client = false

awful.spawn.once(home .. "/.screenlayout/default.sh")
awful.spawn.once "nitrogen --restore"
awful.spawn.once "syncthing serve --no-browser"
