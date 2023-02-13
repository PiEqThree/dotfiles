local ensure_packer = function()
	local fn= vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd[[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()


return require('packer').startup(function(use)
	-- packer can manage itself
	use 'wbthomason/packer.nvim'

	-- colorscheme
	use 'ellisonleao/gruvbox.nvim'

	-- telescope fuzzy finder
	use {
		'nvim-telescope/telescope.nvim',
		requires={ 
			{'nvim-lua/plenary.nvim'},
			{'BurntSushi/ripgrep'},
			{'nvim-telescope/telescope-fzf-native.nvim'}
		},
	}

	-- treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}


	-- LSP configuration & Plugins
	use {
		'neovim/nvim-lspconfig',
		requires = {
			{'williamboman/mason.nvim'}, 
			{'williamboman/mason-lspconfig.nvim'}, 
			{'j-hui/fidget.nvim'}
		},	
	}


	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	if packer_bootstrap then
		require('packer').sync()
	end
end)
