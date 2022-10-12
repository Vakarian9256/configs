require("user.plugins")
require("user.options")
require("user.keymaps")
require("user.autocommands")
require("user.lsp")
require("user.neoscroll")
require("user.fidget")
require("user.harpoon")
require("user.cybu")
require("user.surround")
require("user.bookmark")
require("user.todo-comments")
require("user.jaq")
require("user.lab")
require("user.git")
require("user.zen-mode")
require("user.inlay-hints")
require("user.whichkey")
require("user.telescope")
require("user.bqf")
require("user.dial")
require("user.numb")
require("user.treesitter")
require("user.neogit")

lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('dap-python').test_method()<cr>", "Test Method" }
lvim.builtin.which_key.mappings["df"] = { "<cmd>lua require('dap-python').test_class()<cr>", "Test Class" }
lvim.builtin.which_key.vmappings["d"] = {
  name = "Debug",
  s = { "<cmd>lua require('dap-python').debug_selection()<cr>", "Debug Selection" },
}
