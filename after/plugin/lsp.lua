local lsp_zero = require('lsp-zero')
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local lspkind = require('lspkind')
local luasnip = require('luasnip')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end
    },
    mapping = {-- cmp.mapping.preset.insert({
        -- ['<Tab>'] = cmp_action.tab_complete(),
        -- ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
        -- ['<CR>'] = cmp.mapping.confirm({select = false}),
        -- -- ... Your other mappings ...
        ['<CR>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                if luasnip.expandable() then
                    luasnip.expand()
                else
                    cmp.confirm({
                        select = true,
                    })
                end
            else
                fallback()
            end
        end),

        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.locally_jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
    end, { "i", "s" }),

    -- ... Your other mappings ...
      },

    sources = {
        {name = "copilot", group_index = 2 },
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
        {name = 'buffer'},
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol",
            max_width = 50,
            symbol_map = { Copilot = "" }
        })
    }
})

vim.diagnostic.config({
    signs = false
})

-- here you can setup the language servers

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {'docker_compose_language_service', 'dockerls', 'lua_ls', 'gopls', 'jsonls', 'html', "pyright"},
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
        pyright = function()
            require('lspconfig').pyright.setup({
                settings = {
                    pyright = {
                        analysis = {
                            autoSearchPaths = true,
                            diagnosticMode = "openFilesOnly",
                            useLibraryCodeForTypes = true
                        }
                    }
                }
            })
        end,
        pylsp = function()
            require('lspconfig').pylsp.setup({
                settings = {
                    pylsp = {
                        plugins = {
                            pycodestyle = {
                                ignore = {'W391', 'E501'},
                                maxLineLength = 150
                            },
                            -- rope_autoimport = {enabled = true, {completions = {enabled = true}}}
                        }
                    }
                }
            })
        end,
        html = function()
            require('lspconfig').html.setup({
                settings = {
                    html = {
                        format = {
                            templating = true,
                            wrapLineLength = 120,
                            wrapAttributes = 'auto',
                        },
                        hover = {
                            documentation = true,
                            references = true,
                        },
                    },
                },
            })
        end,
        jsonls = function()
            require('lspconfig').jsonls.setup({
                settings = {
                    jsonls = {
                        format = {
                            enable = true,
                        },
                        providerFormatter = true
                    }
                }
            })
        end
    }
})
