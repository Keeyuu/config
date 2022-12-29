local status, db = pcall(require, "dashboard")
if not status then
    vim.notify("没有找到 dashboard")
    return
end

db.custom_footer = {
    "",
    "",
    "真正的价值，往往源于微小的瑕疵",
}

db.custom_center = {
    {
        icon = "  ",
        desc = "Projects                            ",
        action = "Telescope projects",
    },
    {
        icon = "  ",
        desc = "Recently files                      ",
        action = "Telescope oldfiles",
    },
    {
        icon = "  ",
        desc = "Find file                           ",
        action = "Telescope find_files",
    },
    {
        icon = "  ",
        desc = "Edit keybindings                    ",
        action = "edit ~/.config/nvim/lua/keybindings.lua",
    },
    {
        icon = "  ",
        desc = "Edit Projects                       ",
        action = "edit ~/.local/share/nvim/project_nvim/project_history",
    },
    {
        icon = "  ",
        desc = "Edit .zshrc                         ",
        action = "edit ~/.zshrc",
    },
    {
        icon = "  ",
        desc = "write note                          ",
        action = "edit ~/Library/Mobile\\ Documents/com\\~apple\\~CloudDocs/note/doc",
    },
    --{
    --    icon = "  ",
    --    desc = { "Change Theme                           " },
    --    action = 'Telescope colorscheme'
    --},
    -- {
    --   icon = "  ",
    --   desc = "Edit .bashrc                        ",
    --   action = "edit ~/.bashrc",
    -- },
    -- {
    --   icon = "  ",
    --   desc = "Change colorscheme                  ",
    --   action = "ChangeColorScheme",
    -- },
    -- {
    --   icon = "  ",
    --   desc = "Edit init.lua                       ",
    --   action = "edit ~/.config/nvim/init.lua",
    -- },
    -- {
    --   icon = "  ",
    --   desc = "Find file                           ",
    --   action = "Telescope find_files",
    -- },
    -- {
    --   icon = "  ",
    --   desc = "Find text                           ",
    --   action = "Telescopecope live_grep",
    -- },
}

db.custom_header = {
    [[]],
    [[]],
    [[]],
    [[]],
    [[]],
    [[]],
    [[]],
    [[]],
    [[ ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
    [[ ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
    [[ ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
    [[ ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
    [[ ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
    [[ ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
    [[]],
}
