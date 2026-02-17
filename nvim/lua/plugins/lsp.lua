return {
    {
        "neovim/nvim-lspconfig",
        init = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local buf = args.buf
                    vim.keymap.set("n", "gd", vim.lsp.buf.declaration, { buffer = buf, desc = "Go to Declaration" })
                    vim.keymap.set("n", "gi", vim.lsp.buf.definition, { buffer = buf, desc = "Go to Definition" })
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = buf, desc = "Hover" })
                    vim.keymap.set("n", "<leader>s", function()
                        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = buf }), { bufnr = buf })
                    end, { buffer = buf, desc = "Toggle Inlay Hints" })
                end,
            })
        end,
        opts = {
            diagnostics = {
                virtual_text = true,
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "✗",
                        [vim.diagnostic.severity.WARN] = "⚠",
                        [vim.diagnostic.severity.HINT] = "💡",
                        [vim.diagnostic.severity.INFO] = "ℹ",
                    },
                },
                underline = true,
                update_in_insert = false,
                severity_sort = true,
            },
            servers = {
                clangd = {
                    cmd = {
                        "clangd",
                        "--header-insertion=never",
                        "--all-scopes-completion",
                        "--completion-style=detailed",
                        "-j=8",
                        "--pch-storage=disk",
                        "--compile-commands-dir=build",
                        "--background-index",
                    },
                    filetypes = { "c", "cc", "cpp", "objc", "objcpp", "cuda" },
                    capabilities = {
                        textDocument = {
                            completion = {
                                completionItem = {
                                    snippetSupport = false,
                                },
                            },
                        },
                    },
                },
                gopls = {
                    filetypes = { "go" },
                },
                lua_ls = {},
            },
        },
    },
}
