-- Plugin: https://github.com/neovim/nvim-lspconfig

local lspconfig = require('lspconfig')

lspconfig.pylsp.setup {
  settings = {
    pylsp = {
      plugins = {
        flake8 = { enabled = true }, -- default is false
        pycodestyle = { enabled = false }, -- default is true
      }
    }
  }
}

lspconfig.gopls.setup{}

lspconfig.hls.setup{}

-- Key mappings - global
-- .. show nad navigate diagnostic messages
vim.keymap.set('n', '<space>d', vim.diagnostic.setloclist)
vim.keymap.set('n', 'g]', vim.diagnostic.goto_prev)
vim.keymap.set('n', 'g]', vim.diagnostic.goto_next)

-- Key mappings - buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)

    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-S>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'cd', vim.lsp.buf.rename, opts)
    vim.keymap.set({'n', 'v'}, 'g.', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gA', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>cf', vim.lsp.buf.format, opts)

  end,
})
