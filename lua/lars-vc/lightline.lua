vim.g.lightline = {
	active = {
		left = {
			{ 'mode', 'past' },
			{ 'gitbranch', 'filename', 'modified' }
		}
	},
    colorscheme = 'solarized',
	component_function = {
		gitbranch = 'fugitive#head'
	}
}
