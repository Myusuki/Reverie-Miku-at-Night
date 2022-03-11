local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then 
  return
end


-- lspconfig
local bmap = vim.api.nvim_buf_set_keymap
local opts = {noremap = true, silent = true}
local on_attach = function(bufnr)
  -- lspconfig mappings
  bmap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- lspsaga mappings
  bmap(bufnr, 'n', 'K', '<cmd>Lspsaga hover_doc<cr>', opts)
  bmap(bufnr, 'n', '<C-k>', '<cmd>Lspsaga signature_help<cr>', opts)
  bmap(bufnr, 'n', 'rn','<cmd>Lspsaga rename<cr>', opts)
  bmap(bufnr, 'n', 'gd', '<cmd>Lspsaga preview_definition<cr>', opts)
  bmap(bufnr, 'n', 'dn', '<cmd>Lspsaga diagnostic_jump_next<cr>', opts)
  bmap(bufnr, 'n', 'de', '<cmd>Lspsaga diagnostic_jump_prev<cr>', opts)
  bmap(bufnr, 'n', 'ca', '<cmd>Lspsaga code_action<cr>', opts)
end

-- clangd
require'lspconfig'.clangd.setup{
  on_attach = on_attach,
  cmd = {"clangd"},
}

-- lua
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = runtime_path,
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}


-- lsp-installer
local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

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

