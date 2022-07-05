local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
	return
end

-- manually set PRs:
    -- Allow lower case color names #77
    -- https://github.com/norcalli/nvim-colorizer.lua/pull/77/commits/c385dbbaf48aa93bade31b886e49a682ee771261

    -- using virtualtext as one option for highlight #55
    -- https://github.com/norcalli/nvim-colorizer.lua/pull/55/commits/63f8a012900be60d0ca69864c24adbf6b41d829c

colorizer.setup({ "*" }, {
	RGB = true, -- #RGB hex codes
	RRGGBB = true, -- #RRGGBB hex codes
	names = true, -- "Name" codes like Blue or blue
	RRGGBBAA = true, -- #RRGGBBAA hex codes
	rgb_fn = true, -- CSS rgb() and rgba() functions
	hsl_fn = true, -- CSS hsl() and hsla() functions
	css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
	css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
	-- Available modes: foreground, background, virtualtext
	mode = "background", -- Set the display mode.
})
