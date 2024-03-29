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
	opts = {
		workspaces = {
			{
				name = "Notes",
				-- path = "~/second-brain",
				path = "~/Documents/Logseq/",
			},
		},
		completion = {
			-- Set to false to disable completion.
			nvim_cmp = true,

			-- Trigger completion at 2 chars.
			min_chars = 2,

			-- Where to put new notes created from completion. Valid options are
			--  * "current_dir" - put new notes in same directory as the current buffer.
			--  * "notes_subdir" - put new notes in the default notes subdirectory.
			new_notes_location = "notes_subdir",

			-- Control how wiki links are completed with these (mutually exclusive) options:
			--
			-- 1. Whether to add the note ID during completion.
			-- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
			-- Mutually exclusive with 'prepend_note_path' and 'use_path_only'.
			prepend_note_id = true,
			-- 2. Whether to add the note path during completion.
			-- E.g. "[[Foo" completes to "[[notes/foo|Foo]]" assuming "notes/foo.md" is the path of the note.
			-- Mutually exclusive with 'prepend_note_id' and 'use_path_only'.
			prepend_note_path = false,
			-- 3. Whether to only use paths during completion.
			-- E.g. "[[Foo" completes to "[[notes/foo]]" assuming "notes/foo.md" is the path of the note.
			-- Mutually exclusive with 'prepend_note_id' and 'prepend_note_path'.
			use_path_only = false,
		},

        open_notes_in = "vsplit",

		note_id_func = function(title)
			-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
			local suffix = ""
			if title ~= nil then
				-- If title is given, transform it into valid file name.
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
				-- If title is nil, just add 4 random uppercase letters to the suffix.
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end
			return tostring(os.time()) .. "-" .. suffix
		end,
		-- templates = {
		--     subdir = "Templates",
		--     date_format = "%Y-%m-%d-%a",
		--     time_format = "%H:%M",
		-- },
	},
	keys = {
		{ "<leader>vv", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Opens Obsidian vault searching for files" } },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}
