return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local defaultCapabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                capabilities = defaultCapabilities
            })
            lspconfig.clangd.setup({
                capabilities = defaultCapabilities
            })
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set({ 'n' }, '<leader>ca', vim.lsp.buf.code_action, {})
        end
    },
}
