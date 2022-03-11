local status_ok, treesit = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end
treesit.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "c",
    "cpp",
    "cmake",
    "scss",
    "html",
    "javascript",
    "markdown",
    "lua",
    "rust",
    "yaml",
    "python",
    "llvm"
  },
  sync_install = true,
}
