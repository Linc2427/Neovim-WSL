require("user")
-- https://www.reddit.com/r/neovim/comments/vxdjyb/neovim_in_wsl2_cant_copypaste_tofrom_system/
-- Yank and Paste to System Clipboard
local clip = '/mnt/c/Windows/System32/clip.exe'
if vim.fn.executable(clip) == 1 then
  vim.api.nvim_create_augroup('WSLYank', { clear = true })
  vim.api.nvim_create_autocmd('TextYankPost', {
    group = 'WSLYank',
    callback = function()
      if vim.v.event.operator == 'y' then
        vim.fn.system(clip, vim.fn.getreg('0'))
      end
    end,
  })
end

