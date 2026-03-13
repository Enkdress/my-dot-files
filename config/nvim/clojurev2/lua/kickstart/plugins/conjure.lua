return {
	{
		"Olical/conjure",
		ft = { "clojure", "fennel", "python" }, -- etc
		lazy = true,
		init = function()
			-- Set configuration options here
			-- Uncomment this to get verbose logging to help diagnose internal Conjure issues
			-- This is VERY helpful when reporting an issue with the project
			-- vim.g["conjure#debug"] = true

			-- Rebind it from K to <prefix>gk
			vim.g["conjure#mapping#doc_word"] = "K"
			vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
			vim.g["conjure#client#clojure#nrepl#test#current_form_names"] =
				{ "deftest", "defflow", "defspec", "describe" }
		end,

		-- Optional cmp-conjure integration
		-- dependencies = { "PaterJason/cmp-conjure" },
	},
	-- {
	-- 	"PaterJason/cmp-conjure",
	-- 	lazy = true,
	-- 	config = function()
	-- 		local cmp = require("cmp")
	-- 		local config = cmp.get_config()
	-- 		table.insert(config.sources, { name = "conjure" })
	-- 		return cmp.setup(config)
	-- 	end,
	-- },
}
