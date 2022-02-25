local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
       vim.fn["UltiSnips#Anon"](args.body)
    end,
  },

	mapping = {
		['<C-n>'] = cmp.mapping.scroll_docs(-4),
		['<C-e>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-x>'] = cmp.mapping.close(),
		['<tab>'] = cmp.mapping.confirm({ select = true }),
	},
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'ultisnips' },
  }, {
    { name = 'buffer' },
  }, {
    { name = 'path' },
  })
})

cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' },  
  }, {
    { name = 'buffer' },
  })
})

cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
