local ok, fzf = pcall(require, "fzf-lua")
if not ok then
	return
end

local symbols_exclude = { "Variable", "String", "Number", "Text", "Boolean" }

local M = {}

M.opts = {
	hls = {
		normal = "Normal",
		preview_normal = "Normal",
		border = "Function",
		preview_border = "Function",
	},
	winopts = {
		height = 0.25,
		width = 0.4,
		row = 0.5,
		preview = { hidden = "hidden" },
		border = "rounded",
		treesitter = { enabled = true },
	},
	fzf_opts = {
		["--no-info"] = "",
		["--info"] = "hidden",
		["--padding"] = "13%,5%,13%,5%",
		["--header"] = " ",
		["--no-scrollbar"] = "",
	},
	files = {
		formatter = "path.filename_first",
		git_icons = false,
		prompt = ":",
		no_header = true,
		cwd_header = false,
		cwd_prompt = false,
		cwd = vim.fs.root(0, { ".git" }),
		winopts = {
			title = " files 📑 ",
			title_pos = "center",
			title_flags = false,
		},
		actions = {
			["ctrl-d"] = {
				fn = function(...)
					fzf.actions.file_vsplit(...)
					vim.cmd("windo diffthis")
					local switch = vim.api.nvim_replace_termcodes("<C-w>h", true, false, true)
					vim.api.nvim_feedkeys(switch, "t", false)
				end,
				desc = "diff-file",
			},
		},
	},
}

M.keys = {
	{
		"<C-p>",
		function()
			fzf.files()
		end,
		desc = "fzf browse files",
	},
}

return M
