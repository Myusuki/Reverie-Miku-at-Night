return {
	"lukas-reineke/indent-blankline.nvim",
	event = BufEnter,
	config = function()
		require("ibl").setup()
	end
}
