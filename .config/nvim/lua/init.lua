--
-- Configuration
--

vim.opt.fillchars = { eob = " " } -- no ~ in the end of the buffers

--
-- Colors
--
require('solarized').setup({
  variant = 'summer',
})

--
-- Plugins
--

require('lualine').setup {
  options = { theme = 'solarized' }
}

require("nvim-autopairs").setup {}

require('neo-tree').setup({
  window = {
    position = "right",
    width = 30,
  },
})


--
-- Telescope
--

local telescope = require('telescope')
local actions = require('telescope.actions')
telescope.setup({
  defaults = {
    layout_strategy = 'horizontal',
    layout_config = {
      width = 0.99,
      height = 0.99,
    },
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-l>"] = actions.send_to_loclist + actions.open_loclist,
      },
    },
    file_ignore_patterns = vim.fn.split(vim.o.wildignore, ","),
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
    },
  },
})


--
-- LSP settings
--

vim.lsp.config('pylsp', {
  settings = {
    pylsp = {
      plugins = {
        flake8 = { enabled = true }, -- default is false
        pycodestyle = { enabled = false }, -- default is true
      }
    }
  }
})
vim.lsp.enable('pylsp')

vim.lsp.config('ruff', {
  init_options = {
    settings = {
      organizeImports = true
    }
  }
})
vim.lsp.enable('ruff')

vim.lsp.enable('gopls')
vim.lsp.enable('hls')

--
-- LSP key bindings
--

function format()
  vim.lsp.buf.format { async = true }
end

function setup_lsp_keymaps(bufnr)
  local opts = { buffer = bufnr }

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', 'gci', vim.lsp.buf.incoming_calls, opts)
  vim.keymap.set('n', 'gco', vim.lsp.buf.outgoing_calls, opts)
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', 'K',  vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'go', vim.lsp.buf.document_symbol, opts)

  vim.keymap.set({'n', 'v'}, 'ga', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'gn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', 'gf', format, opts)
  vim.keymap.set('n', '<leader>cf', format, opts)

  vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, opts)
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    setup_lsp_keymaps(ev.buf)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
  end
})
