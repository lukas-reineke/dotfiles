return {
    "3rd/image.nvim",
    opts = {
        tmux_show_only_in_active_window = true,
        integrations = {
            markdown = {
                enabled = true,
                clear_in_insert_mode = true,
                download_remote_images = true,
                only_render_image_at_cursor = true,
            },
        },
    },
}
