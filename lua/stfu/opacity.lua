-- Define a function to change window opacity
function ChangeOpacity()
    -- Get the current window number
    local current_win = vim.fn.winnr()

    -- Loop through all windows
    for i = 1, vim.fn.winnr('$') do
        -- Skip the current window
        if i ~= current_win then
            -- Set the opacity of the inactive window (you can adjust the opacity value)
            vim.fn.system("xprop -id " .. vim.fn.winbufnr(i) .. " -f _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY 0x7fffffff")
        end
    end
end

-- Automatically call the change_opacity function when splitting vertically
vim.api.nvim_command("autocmd WinEnter * if &splitright | lua change_opacity() | endif")

