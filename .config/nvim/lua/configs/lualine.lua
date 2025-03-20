local line_ok, lualine = pcall(require, "lualine")
if not line_ok then
	return
end

local navic = require('nvim-navic');

lualine.setup({
    sections = {
        lualine_c = {
            {
            function()
                return navic.get_location()
            end,
            cond = function()
                return navic.is_available()
            end
            },
        }
    }
})
