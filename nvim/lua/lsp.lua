
local bmap = vim.api.nvim_buf_set_keymap
local opts = {noremap = true, silent = true}
bmap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
bmap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
bmap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
bmap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
bmap(bufnr, 'n', 'K', '<cmd>lua vim.lps.buf.hover()<CR>', opts)
bmap(bufnr, 'n', '<C-l>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
bmap(bufnr, 'n', '<C-f>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
bmap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

local lsp_installer = require "nvim-lsp-installer"

local servers = {
	"bashls",
	"pyright",
	"clangd",
	"sumneko_lua",
	"remark_ls",
	"rust_analyzer",
	"html",
	"tsserver",
	"cssls",
	"cmake",
	"vuels",
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print("Installing " .. name)
    server:install()
  end
end

