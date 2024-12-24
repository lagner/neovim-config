return {
	'nvim-treesitter/nvim-treesitter',
	opts = {
		highlight = { enable = true },
		indent = { enable = true },
		ensure_installed = {
			"bash",
			"c",
			"diff",
			"html",
			"javascript",
			"json",
			"lua",
			"markdown",
			"markdown_inline",
			"printf",
			"python",
			"regex",
			"toml",
			"typescript",
			"vim",
			"xml",
			"yaml",
			"rust",
			"kotlin",
			"groovy",
			"just",
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				--	      init_selection = "<C-space>",
				--	      node_incremental = "<C-space>",
				--	      scope_incremental = false,
				--	      node_decremental = "<bs>",
			},
		},
	},
	config = function()
		vim.cmd("TSUpdate")
	end,
}
