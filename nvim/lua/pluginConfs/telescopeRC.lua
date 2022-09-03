local status, telescope = pcall( require, 'telescope' )
if ( not status ) then
	return
end

local actions = require( 'telescope.actions' )

function telescope_buffer_dir()
	return vim.fn.expand( '%:p:h' )
end

local fb_actions = require( 'telescope._extensions.file_browser.actions' )

local builtin = require( 'telescope.builtin' )

telescope.setup {
	defaults = {
		mappings = {
			n = {
				[ 'q' ] = actions.close
			}
		}
	},
	extensions = {
		file_browser = {
			theme = 'dropdown',
			-- disables netrw add use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				-- custom insert mode mappings
				[ 'i' ] = {
					[ '<C-w>' ] = function() vim.cmd( 'normal vbd' ) end,
				},
				[ 'n' ] = {
					[ 'N' ] = fb_actions.create,
					[ 'h' ] = fb_actions.goto_parent_dir,
					[ '/' ] = function()
					vim.cmd( 'startinsert' )
				end
				}
			}
		}
	}
}

telescope.load_extension( 'file_browser')

local opts = { noremap = true, silent = true }
vim.keymap.set( 'n', 'tf', function()
	builtin.find_files( { 
		no_ignore = false,
		hidden = false
	} )
end )
vim.keymap.set( 'n', 'tg', function ()
	builtin.live_grep()
end )
vim.keymap.set( 'n', 'tb', function()
	builtin.buffers()
end )
vim.keymap.set( 'n', 'tr', function ()
	builtin.resume()
end )
vim.keymap.set( 'n', 'td', function()
	builtin.diagnostics()
end )
vim.keymap.set("n", "tfe", function()
  telescope.extensions.file_browser.file_browser( {
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 }
  } )
end )
