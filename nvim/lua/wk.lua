local status_ok, wk = pcall( require, 'which-key')
if not status_ok then
 return
end 

wk.register({
  [ "<leader>wk" ] = { "<cmd>WhichKey", "pull up list of keybindings" },
  [ "<leader>so" ] = { "<cmd>so $MYVIMRC<cr>", "Source nvim config file" },
  [ "<leader>p" ] = {
    name = "packer",
    s = { "<cmd>PackerSync<cr>", "Packer Sync command" },
    c = { "<cmd>PackerClean<cr>", "Packer cleans plugins that are unlisted" },
  },
  [ "<leader>z" ] = { "<cmd>TZAtaraxis<cr>", "Enter Zen mode" },
})
