return {
    'saghen/blink.cmp',
    lazy = false, -- lazy loading handled internally
    -- optional: provides snippets for the snippet source
    dependencies = 'rafamadriz/friendly-snippets',

    -- use a release tag to download pre-built binaries
    version = 'v0.*',
    -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- 'default' for mappings similar to built-in completion
        -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
        -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
        -- see the "default configuration" section below for full documentation on how to define
        -- your own keymap.
        keymap = {
            preset = 'default',
            ['<C-n>'] = { 'show', 'select_next', 'fallback' },
            ['<C-j>'] = { 'snippet_forward', 'fallback' },
            ['<C-k>'] = { 'snippet_backward', 'fallback' },
        },

        appearance = {
            -- Sets the fallback highlight groups to nvim-cmp's highlight groups
            -- Useful for when your theme doesn't support blink.cmp
            -- will be removed in a future release
            use_nvim_cmp_as_default = true,
            -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'mono',
        },

        -- default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, via `opts_extend`
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
            providers = {
                snippets = {
                    opts = {
                        search_paths = {
                            vim.fn.stdpath('config') .. './lua/snippets/',
                        },
                    },
                },
            },
            cmdline = {},
        },

        -- experimental auto-brackets support
        completion = {
            trigger = {
                show_in_snippet = true,
                show_on_keyword = false,
                show_on_trigger_character = false,
            },
            accept = { auto_brackets = { enabled = true } },
            -- ghost_text = {
            --     enabled = false,
            -- },
        },

        -- experimental signature help support
        signature = { enabled = true },
    },
    -- allows extending the enabled_providers array elsewhere in your config
    -- without having to redefine it
    -- opts_extend = { 'sources.completion.enabled_providers' },
} -- TODO: add blink.cmp https://github.com/saghen/blink.cmp
