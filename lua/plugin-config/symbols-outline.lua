local status, outline = pcall(require, "symbols-outline")
if not status then
    vim.notify("没有找到 symbols-outline")
    return
end


outline.setup()




-- keymaps = { -- These keymaps can be a string or a table for multiple keys
--     close = {"<Esc>", "q"},
--     goto_location = "<Cr>",
--     focus_location = "o",
--     hover_symbol = "<C-space>",
--     toggle_preview = "K",
--     rename_symbol = "r",
--     code_actions = "a",
--     fold = "h",
--     unfold = "l",
--     fold_all = "W",
--     unfold_all = "E",
--     fold_reset = "R",
--     ? Show help message
--   },
