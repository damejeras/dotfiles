local navicline = function (opts)
  local navic = require('nvim-navic')
  if navic then
    return navic.get_location(opts)
  end
end

return {
  -- Useful plugin to show you pending keybinds.
  {
    'folke/which-key.nvim',
    opts = {},
    config = function (_, _)
      -- document existing key chains
      require('which-key').register {
        ['<leader>s'] = { name = '[S]cratch', _ = 'which_key_ignore' },
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = '[D]ebug', _ = 'which_key_ignore' },
        ['<leader>g'] = { name = '[G]o', _ = 'which_key_ignore' },
        ['<leader>h'] = { name = '[H]unk', _ = 'which_key_ignore' },
        ['<leader>f'] = { name = '[F]ind', _ = 'which_key_ignore' },
        ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
      }
      -- register which-key VISUAL mode
      -- required for visual <leader>hs (hunk stage) to work
      require('which-key').register({
        ['<leader>'] = { name = 'VISUAL <leader>' },
        ['<leader>h'] = { 'Git [H]unk' },
      }, { mode = 'v' })
    end
  },

  {
    'Mofiqul/vscode.nvim',
    priority = 1000,
    config = function()
      local c = require('vscode.colors').get_colors()
      vim.cmd.colorscheme 'vscode'

      -- Set colors for navic. TODO: there are some
      vim.api.nvim_set_hl(0, "NavicIconsFile",          {default = true, fg = c.vscViolet, bg = c.vscLeftMid})
      vim.api.nvim_set_hl(0, "NavicIconsModule",        {default = true, fg = c.vscLightBlue, bg = c.vscLeftMid})
      vim.api.nvim_set_hl(0, "NavicIconsNamespace",     {default = true, fg = c.vscBlueGreen, bg = c.vscLeftMid})
      vim.api.nvim_set_hl(0, "NavicIconsPackage",       {default = true, fg = c.vscBlue, bg = c.vscLeftMid})
      vim.api.nvim_set_hl(0, "NavicIconsClass",         {default = true, fg = c.vscBlueGreen, bg = c.vscLeftMid})
      vim.api.nvim_set_hl(0, "NavicIconsMethod",        {default = true, fg = c.vscPink, bg = c.vscLeftMid})
      vim.api.nvim_set_hl(0, "NavicIconsProperty",      {default = true, fg = c.vscFront, bg = c.vscLeftMid})
      vim.api.nvim_set_hl(0, "NavicIconsField",         {default = true, fg = c.vscLightBlue, bg = c.vscLeftMid})
      vim.api.nvim_set_hl(0, "NavicIconsConstructor",   {default = true, fg = c.vscUiOrange, bg = c.vscLeftMid})
      vim.api.nvim_set_hl(0, "NavicIconsEnum",          {default = true, fg = c.vscLightBlue, bg = c.vscLeftMid})
      vim.api.nvim_set_hl(0, "NavicIconsInterface",     {default = true, fg = c.vscLightBlue, bg = c.vscLeftMid})
      vim.api.nvim_set_hl(0, "NavicIconsFunction",      {default = true, fg = c.vscYellow, bg = c.vscLeftMid})
      vim.api.nvim_set_hl(0, "NavicIconsVariable",      {default = true, fg = c.vscLightBlue, bg = c.vscLeftMid})
      vim.api.nvim_set_hl(0, "NavicIconsConstant",      {default = true, fg = c.vscBlue, bg = c.vscLeftMid})
      vim.api.nvim_set_hl(0, "NavicIconsString",        {default = true, fg = c.vscOrange, bg = c.vscLeftMid})
      vim.api.nvim_set_hl(0, "NavicIconsNumber",        {default = true, fg = c.vscLightGreen, bg = c.vscLeftMid})
      vim.api.nvim_set_hl(0, "NavicIconsBoolean",       {default = true, fg = c.vscBlue, bg = c.vscLeftMid})
      vim.api.nvim_set_hl(0, "NavicIconsArray",         {default = true, fg = c.vscPink, bg = c.vscLeftMid})
      vim.api.nvim_set_hl(0, "NavicIconsObject",        {default = true, fg = c.vscLightBlue, bg = c.vscLeftMid})
      vim.api.nvim_set_hl(0, "NavicIconsKey",           {default = true, fg = c.vscBlue, bg = c.vscLeftMid})
      vim.api.nvim_set_hl(0, "NavicIconsNull",          {default = true, fg = c.vscBlue, bg = c.vscLeftMid})
      vim.api.nvim_set_hl(0, "NavicIconsEnumMember",    {default = true, fg = c.vscLightBlue, bg = c.vscLeftMid})
      vim.api.nvim_set_hl(0, "NavicIconsStruct",        {default = true, fg = c.vscLightBlue, bg = c.vscLeftMid})
      vim.api.nvim_set_hl(0, "NavicIconsEvent",         {default = true, fg = c.vscLightBlue, bg = c.vscLeftMid})
      vim.api.nvim_set_hl(0, "NavicIconsOperator",      {default = true, fg = c.vscFront, bg = c.vscLeftMid})
      vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", {default = true, fg = c.vscBlueGreen, bg = c.vscLeftMid})
      vim.api.nvim_set_hl(0, "NavicText",               {default = true, fg = c.vscFront, bg = c.vscLeftMid})
      vim.api.nvim_set_hl(0, "NavicSeparator",          {default = true, fg = c.vscFront, bg = c.vscLeftMid})
    end,
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',

    dependencies = {
      'SmiteshP/nvim-navic',
      opts = {
        highlight = true,
        lsp = {
          auto_attach = true,
        },
      },
    },

    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'vscode',
        component_separators = '|',
        section_separators = '',
        disabled_filetypes = { 'neo-tree' },
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diagnostics'},
        lualine_c = {{ navicline }},
        lualine_x = {'diff', {'filename', path = 1}, 'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
    },
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {
      indent = {
        char = "┊",
      },
      scope = {
        enabled = false,
      },
    },
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  {
    'romgrk/barbar.nvim',
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- etc.
      icons = {
        gitsigns = {
          added = {enabled = true},
          changed = {enabled = true},
          deleted = {enabled = true},
        },
        pinned = {
          button = '📌',
          filename = true,
        },
        filetype = {
          enabled = false
        }
      },
      sidebar_filetypes = {
        ['neo-tree'] = {event = 'BufWipeout'},
      },
    },
  },

  -- Scratchpad
  {
    "LintaoAmons/scratch.nvim",
    event = "VeryLazy",
    keys = {
      {
        '<leader>sn',
        '<cmd>Scratch<CR>',
        desc = '[S]cratch [N]ew'
      },
      {
        '<leader>ss',
        '<cmd>ScratchOpen<CR>',
        desc = '[S]cratch [S]earch'
      },
    },
  },

  -- Auto close brackets
  {
    'm4xshen/autoclose.nvim',
    opts = {},
  },

  -- Preview markdown
  {    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,

  }
}
