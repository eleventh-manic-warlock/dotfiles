-- blink completions 
return {
    "saghen/blink.cmp",
    -- optional: provides snippets for the snippet source
    dependencies = { "rafamadriz/friendly-snippets" },

    -- Use a release tag to download pre-built binaries
    version = "*",

    opts = {
        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- 'super-tab' for mappings similar to VSCode (tab to accept)
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        --
        -- :h blink-cmp-config-keymap for defining keymaps
        keymap = {
            -- Each keymap may be a list of commands and/or functions
            preset = "default",
            -- Select completions
            ["<Up>"] = { "select_prev", "fallback" },
            ["<Down>"] = { "select_next", "fallback" },
            ["<Tab>"] = { "select_next", "fallback" },
            ["<S-Tab"] = { "select_prev", "fallback" },
            -- Scroll documentation
            ["<C-b>"] = { "scroll_documentation_up", "fallback" },
            ["<C-f>"] = { "scroll_documentation_down", "fallback" },
            -- Show/hide signature
            ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
        },

        appearance = {
            -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = "mono",
        },

        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- For lua implementation instead use `implementation = "lua"` or fallback to the lua
        -- implementation when the Rust fuzzy matcher is not available with `implementation = "prefer_rust"`
        fuzzy = { implementation = "prefer_rust_with_warning" },
        completion = {
            -- The keyword should only match against the text before
            keyword = { range = "prefix" },
            menu = {
                -- Use treesitter to highlight label text for the given list of sources
                draw = {
                    treesitter = { "lsp" },
                },
            },
            -- Show completions after typing a trigger character, defined by the source
            trigger = { show_on_trigger_character = true },
            documentation = {
                -- Show documentation automatically
                auto_show = true,
            },
        },

        -- Signature help when tying
        signature = { enabled = true },
    },
    opts_extend = { "sources.default" },
 }

