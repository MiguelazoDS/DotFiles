require("full-border"):setup {
  -- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
  -- ya pkg add yazi-rs/plugins:full-border
  type = ui.Border.ROUNDED,
}

require("bookmarks"):setup({
  last_directory = { enable = false, persist = false, mode = "dir" },
  persist = "all",
  desc_format = "full",
  file_pick_mode = "hover",
  custom_desc_input = false,
  show_keys = false,
  notify = {
    enable = false,
    timeout = 1,
    message = {
      new = "New bookmark '<key>' -> '<folder>'",
      delete = "Deleted bookmark in '<key>'",
      delete_all = "Deleted all bookmarks",
    },
  },
})

require("relative-motions"):setup({
  show_numbers = "relative",
  show_motion = true,
  enter_mode = "first"
})

-- show disk in status bar
-- https://github.com/sxyazi/yazi/issues/2493#issuecomment-2875924677
Status:children_add(function()
    local command = "df -kh .|awk '!/^Filesystem/{printf \" %s / %s \", $3, $4}'"
    local info = ui.Span(io.popen(command):read('*a')):fg("green")
    return info
end, 1500, Header.RIGHT)

