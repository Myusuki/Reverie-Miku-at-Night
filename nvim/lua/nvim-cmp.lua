local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  return
end

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-e>'] = cmp.mapping.select_prev_item(),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-u'] = cmp.mapping.scroll_docs(-4),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if vim.fn.pumvisible() == 1 then
          if vim.fn["UltiSnips#CanExpandSnippet"]() == 1 or
              vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
              return vim.fn.feedkeys(t("<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>"))
          end

          vim.fn.feedkeys(t("<C-n>"), "n")
      elseif check_back_space() then
          vim.fn.feedkeys(t("<tab>"), "n")
      else
          fallback()
      end
    end, {"i", "s"}),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
        if vim.fn.pumvisible() == 1 then
            vim.fn.feedkeys(t("<C-e>"), "n")
        else
            fallback()
        end
    end, {"i", "s"})
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'ultisnips' },
    { name = 'buffer' },
    { name = 'path', option = {trailing_slash = true} },
  }),
})

cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' },
    { name = 'buffer' },
    { name = 'path', option = {trailing_slash = true}}
  })
})

cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path', option = {trailing_slash = true} },
    { name = 'cmdline' }
  })
})
