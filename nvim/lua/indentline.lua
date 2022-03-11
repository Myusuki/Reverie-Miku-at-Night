local status_ok, indent = pcall(require, "indent_blankline")
if not status_ok then
  return
end

vim.g.indent_blankline_use_treesitter = true

indent.setup {
  show_current_context = true,
  show_current_context_start = true,
}
