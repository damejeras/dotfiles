return {
  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',

    event = { 'VeryLazy' },

    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function() return vim.fn.executable 'make' == 1 end,
      },
      { 'nvim-telescope/telescope-live-grep-args.nvim' },
    },

    config = function (_, _)
      local telescope = require('telescope')
      local lga_actions = require("telescope-live-grep-args.actions")

      telescope.setup({
        defaults = {
          vimgrep_arguments = { 'rg', '--hidden', '--color=never',
            '--no-heading', '--with-filename', '--line-number',
            '--column', '--smart-case', '-g', '!.git', },
          path_display = { 'truncate' },
          layout_strategy = 'vertical',
          layout_config = {
            height = 0.9,
            width = 0.9,
            preview_cutoff = 1,
            prompt_position = 'bottom',
          },
        },
        extensions = {
          live_grep_args = {
            auto_quoting = true, -- enable/disable auto-quoting
            -- define mappings, e.g.
            mappings = {
              -- extend mappings
              i = {
                ["<C-k>"] = lga_actions.quote_prompt(),
                ["<C-g>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                ["<C-f>"] = lga_actions.quote_prompt({ postfix = " --fixed-strings" }),
              },
            },
          }
        }
      })

      telescope.load_extension('fzf')

      -- Show line numbers in preview
      vim.cmd("autocmd User TelescopePreviewerLoaded setlocal number")
    end,

    keys = {
      {
        '<leader>?',
        function()
          require('telescope.builtin').oldfiles()
        end,
        desc = '[?] Find recently opened files'
      },
      {
        '<leader>/',
        function()
          require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
            winblend = 10,
            previewer = false,
          })
        end,
        desc = '[/] Fuzzily search in current buffer'
      },
      {
        '<leader>st',
        function()
          require('telescope.builtin').builtin()
        end,
        desc = '[S]earch [T]elescope'
      },
      {
        '<leader>ss',
        function()
          require('telescope.builtin').lsp_document_symbols()
        end,
        desc = '[S]earch [S]ymbols'
      },
      {
        '<leader>gf',
        function()
          require('telescope.builtin').git_files()
        end,
        desc = 'Search [G]it [F]iles'
      },
      {
        '<leader>sf',
        function()
          require('telescope.builtin').find_files()
        end,
        desc = '[S]earch [F]iles'
      },
      {
        '<leader>sh',
        function()
          require('telescope.builtin').git_status()
        end,
        desc = '[S]earch Git [H]unks'
      },
      {
        '<leader>s?',
        function()
          require('telescope.builtin').help_tags()
        end,
        desc = '[S]earch [?]Help'
      },
      {
        '<leader>sw',
        function()
          require('telescope.builtin').lsp_dynamic_workspace_symbols()
        end,
        desc = '[S]earch [W]orkspace Symbols'
      },
      {
        '<leader>sg',
        function()
          require('telescope.builtin').live_grep()
        end,
        desc = '[S]earch by [G]rep'
      },
      {
        '<leader>sG',
        function()
          require("telescope").extensions.live_grep_args.live_grep_args()
        end,
        desc = '[S]earch by [G]rep with Args'
      },
      {
        '<leader>sd',
        function()
          require('telescope.builtin').diagnostics()
        end,
        desc = '[S]earch [D]iagnostics'
      },
      {
        '<leader>sr',
        function()
          require('telescope.builtin').resume()
        end,
        desc = '[S]earch [R]esume'
      },
      {
        '<leader>sb',
        function()
          require('telescope.builtin').buffers()
        end,
        desc = '[S]earch [B]uffers'
      }
    },

    cmd = {
      "Telescope",
    },
  },
}
