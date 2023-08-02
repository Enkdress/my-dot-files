local status_colorizer, colorizer = pcall(require, "colorizer")
if (not status_colorizer) then return end

colorizer.setup({
	'*',
})
