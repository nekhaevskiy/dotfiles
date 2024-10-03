return {
	"echasnovski/mini.indentscope",
	version = "*",
	config = function()
		require("mini.indentscope").setup({
      options = {
        try_as_border = true
      }
    })
	end,
}
