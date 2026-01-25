local is_ok, configs = pcall(require, "nvim-treesitter.configs")
if not is_ok then
  return
end

configs.setup({
  -- List of parsers to install automatically
  ensure_installed = {
    "bash",
    "c",
    "css",
    "csv",
    "diff",
    "dockerfile",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "html",
    "hyprlang",
    "json",
    "latex",
    "lua",
    "luadoc",
    "markdown",
    "markdown_inline",
    "ruby",
    "scss",
    "sql",
    "toml",
    "vim",
    "yaml",
    "zsh"
  },
  -- Install parsers synchronously
  sync_install = false,
  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = {
    enable = true,
    -- List of parsers to disable highlighting for
    disable = {},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  -- Indentation based on treesitter for the = operator.
	-- NOTE: This is an experimental feature.
	indent = {
		enable = true,
	},
})
