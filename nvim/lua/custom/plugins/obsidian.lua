return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  keys = {
    -- { '<leader>nd', ':ObsidianToday<cr>', desc = 'obsidian [d]aily' },
    -- { '<leader>nt', ':ObsidianToday 1<cr>', desc = 'obsidian [t]omorrow' },
    -- { '<leader>ny', ':ObsidianToday -1<cr>', desc = 'obsidian [y]esterday' },
    -- { '<leader>nb', ':ObsidianBacklinks<cr>', desc = 'obsidian [b]acklinks' },
    -- { '<leader>nl', ':ObsidianLink<cr>', desc = 'obsidian [l]ink selection' },
    -- { '<leader>nf', ':ObsidianFollowLink<cr>', desc = 'obsidian [f]ollow link' },
    { '<leader>nn', ':ObsidianNew<cr>', desc = 'obsidian [n]ew' },
    { '<leader>ns', ':ObsidianSearch<cr>', desc = 'obsidian [s]earch' },
    -- { '<leader>no', ':ObsidianQuickSwitch<cr>', desc = 'obsidian [o]pen quickswitch' },
    -- { '<leader>nO', ':ObsidianOpen<cr>', desc = 'obsidian [O]pen in app' },
  },
  opts = {

  disable_frontmatter = true,
      -- name new notes starting the ISO datetime and ending with note name
  -- put them in the inbox subdir
    note_id_func = function(title)
      local suffix = ""
      -- get current ISO datetime with -5 hour offset from UTC for EST
      local current_datetime = os.date("!%Y-%m-%d-%H%M%S", os.time() - 5*3600)
      if title ~= nil then
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      -- return current_datetime .. "_" .. suffix
      return suffix
    end,
    workspaces = {
      {
        name = "internal_docs",
        path = "/Users/u479488/Documents/internal-docs/docs/",
      },
      -- {
      --   name = "work",
      --   path = "~/vaults/work",
      -- },
    },

    -- daily_notes = {
    --   -- Optional, if you keep daily notes in a separate directory.
    --   folder = "250-daily",
    --   -- folder = "notes/dailies",
    --   -- Optional, if you want to change the date format for the ID of daily notes.
    --   date_format = "%Y-%m-%d",
    --   -- Optional, if you want to change the date format of the default alias of daily notes.
    --   alias_format = "%B %-d, %Y",
    --   -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
    --   template = nil,
    -- },

    -- see below for full list of options 👇
  },
}
