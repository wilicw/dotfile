local overrides = require("custom.configs.overrides")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local cmp = require("cmp")
local luasnip = require("luasnip")

---@type NvPluginSpec[]
local plugins = {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},
	{
		"saecki/crates.nvim",
		ft = { "toml" },
		config = function(_, opts)
			local crates = require("crates")
			crates.setup(opts)
			require("cmp").setup.buffer({
				sources = { { name = "crates" } },
			})
			crates.show()
			require("core.utils").load_mappings("crates")
		end,
	},
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		dependencies = "neovim/nvim-lspconfig",
		config = function(_, opts)
			require("rust-tools").setup(opts)
		end,
	},
	{
		"skywind3000/asyncrun.vim",
		lazy = false,
	},
	-- To make a plugin not be loaded
	{
		"NvChad/nvim-colorizer.lua",
	},
	{
		"github/copilot.vim",
		event = "InsertEnter",
		config = function()
			vim.cmd(":AsyncRun! Copilot setup")
			vim.cmd('imap <silent><script><expr> <C-]> copilot#Accept("")')
			vim.cmd("let g:copilot_no_tab_map = v:true")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		lazy = false,
		config = function()
			require("dapui").setup()
			local dap = require("dap")
			dap.adapters.cppdbg = {
				id = "cppdbg",
				type = "executable",
				command = "/Users/wilicw/.local/share/nvim/mason/bin/OpenDebugAD7",
			}
			dap.configurations.cpp = {
				{
					name = "Arm cortex debug",
					type = "cppdbg",
					request = "launch",
					MIMode = "gdb",
					miDebuggerServerAddress = "localhost:3333",
					miDebuggerPath = "/Applications/ARM/bin/arm-none-eabi-gdb",
					cwd = "${workspaceFolder}",
					program = function()
						local handle = io.popen('find . -type f -name "*.elf" | xargs readlink -f')
						local result = handle:read("*a")
						handle:close()
						-- return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
						return result
					end,
					stopAtEntry = true,
				},
			}
			dap.configurations.c = dap.configurations.cpp
		end,
		dependencies = {
			"mfussenegger/nvim-dap",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		opts = {
			mapping = cmp.mapping.preset.insert({
				["<Up>"] = cmp.mapping.select_prev_item(),
				["<Down>"] = cmp.mapping.select_next_item(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = cmp.mapping.confirm({ select = true }),
				["<C-j>"] = cmp.mapping(function(fallback)
					if luasnip.jumpable(1) then
						luasnip.jump(1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<C-k>"] = cmp.mapping(function(fallback)
					if luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
		},
	},
	{
		"ibhagwan/smartyank.nvim",
		lazy = false,
		config = function()
			require("smartyank").setup({
				enable = true,
				enable_visual = true,
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		lazy = false,
		dependencies = "nvim-lua/plenary.nvim",
		opts = {},
	},
}

return plugins
