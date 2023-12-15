-- Check packer if it's not instaled
local ensure_packer = function()
	local fn = vim.fn
	local path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

	if fn.empty(fn.glob(path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", path })
		vim.cmd([[packadd packer.nvim]])

		return true
	end

	return false
end

local bootstrapping = ensure_packer()

-- Reload config if we modify plugins.lua
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- themes
	use("folke/tokyonight.nvim")

	-- completion
	use({ "hrsh7th/nvim-cmp", config = [[require('config.nvim-cmp')]] })
	use({ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" }) -- buffer auto-completion
	use({ "hrsh7th/cmp-path", after = "nvim-cmp" }) -- path auto-completion
	use({ "hrsh7th/cmp-cmdline", after = "nvim-cmp" }) -- cmdline auto-completion

	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- managing lsp
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- lsp server
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({
		"nvimdev/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})
	-- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- linting and formating
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
		config = [[require('config.treesitter')]],
	})

	-- auto closing
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags
	use({ "windwp/nvim-autopairs", config = [[require('config.autopairs')]] }) -- autoclose parens, brackets, quotes, etc...

	-- git integration
	use({ "lewis6991/gitsigns.nvim", config = [[require('config.gitsigns')]] }) -- show line modifications on left hand side

	-- comment
	use({ "numToStr/Comment.nvim", config = [[require('config.comment')]] })

	-- tree
	use({ "nvim-tree/nvim-tree.lua", config = [[require('config.nvim-tree')]] })

	-- icon
	use("nvim-tree/nvim-web-devicons")

	-- line
	use({ "nvim-lualine/lualine.nvim", config = [[require('config.nvim-web-devicons')]] })

	use({ "machakann/vim-highlightedyank" })

	-- telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = [[require('config.telescope')]],
	})

	if bootstrapping then
		require("packer").sync()
	end
end)
