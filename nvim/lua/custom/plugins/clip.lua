return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    -- add options here
    -- or leave it empty to use the default settings
    default = {

      -- file and directory options
      -- expands dir_path to an absolute path
      -- When you paste a new image, and you hover over its path, instead of:
      -- test-images-img/2024-06-03-at-10-58-55.webp
      -- You would see the entire path:
      -- /Users/linkarzu/github/obsidian_main/999-test/test-images-img/2024-06-03-at-10-58-55.webp
      --
      -- IN MY CASE I DON'T WANT TO USE ABSOLUTE PATHS
      -- if I switch to a nother computer and I have a different username,
      -- therefore a different home directory, that's a problem because the
      -- absolute paths will be pointing to a different directory
      use_absolute_path = false, ---@type boolean

      -- make dir_path relative to current file rather than the cwd
      -- To see your current working directory run `:pwd`
      -- So if this is set to false, the image will be created in that cwd
      -- In my case, I want images to be where the file is, so I set it to true
      relative_to_current_file = true, ---@type boolean

      -- I want to save the images in a directory named after the current file,
      -- but I want the name of the dir to end with `-img`
      dir_path = function()
        return vim.fn.expand("%:t:r") .. "-img"
      end,

      -- If you want to get prompted for the filename when pasting an image
      -- This is the actual name that the physical file will have
      -- If you set it to true, enter the name without spaces or extension `test-image-1`
      -- Remember we specified the extension above
      --
      -- I don't want to give my images a name, but instead autofill it using
      -- the date and time as shown on `file_name` below
      prompt_for_file_name = false, ---@type boolean
      file_name = "%Y-%m-%d-at-%H-%M-%S", ---@type string

    },
    -- filetype specific options
    filetypes = {
      markdown = {
        -- encode spaces and special characters in file path
        url_encode_path = true, ---@type boolean

        -- -- The template is what specifies how the alternative text and path
        -- -- of the image will appear in your file
        --
        -- -- $CURSOR will paste the image and place your cursor in that part so
        -- -- you can type the "alternative text", keep in mind that this will
        -- -- not affect the name that the image physically has
        -- template = "![$CURSOR]($FILE_PATH)", ---@type string
        --
        -- -- This will just statically type "Image" in the alternative text
        -- template = "![Image]($FILE_PATH)", ---@type string
        --
        -- -- This will dynamically configure the alternative text to show the
        -- -- same that you configured as the "file_name" above
        template = "![$FILE_NAME]($FILE_PATH)", ---@type string
      },
    },
  },
  keys = {
    -- suggested keymap
    { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },
}
