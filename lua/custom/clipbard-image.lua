require("clipboard-image").setup({
	default = {
		img_dir = "static",
		img_dir_txt = '',
		img_name = function ()
			vim.fn.inputsave()
			local name = vim.fn.input('Name: ')
			local date = os.date('%y%m%d%H%M-')
			vim.fn.inputrestore()
			return date .. name
		end,
	},
	markdown = {
		affix = "{{<figure src=\"/%s\" caption=\"\">}}"
	}
})
