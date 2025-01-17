import ui
import gx

const (
	win_width  = 800
	win_height = 600
)

struct App {
mut:
	window &ui.Window = 0
}

fn main() {
	mut app := &App{}
	menu_items := [
		ui.menuitem(
			text: 'Delete'
			submenu: ui.menu(
				items: [
					ui.menuitem(
						text: 'all developers'
						action: menu_click
					),
					ui.menuitem(
						text: 'users'
						submenu: ui.menu(
							items: [
								ui.menuitem(
									text: 'all1'
									action: menu_click
								),
								ui.menuitem(
									text: 'devel1'
									submenu: ui.menu(
										items: [
											ui.menuitem(
												text: 'all2'
												action: menu_click
											),
											ui.menuitem(
												text: 'devel2'
												submenu: ui.menu(
													items: [
														ui.menuitem(
															text: 'all3'
															action: menu_click
														),
														ui.menuitem(
															text: 'devel3'
															action: menu_click
														),
													]
												)
											),
										]
									)
								),
							]
						)
					),
				]
			)
		),
		ui.menuitem(
			text: 'Export users'
			action: menu_click
		),
		ui.menuitem(text: 'Exit', action: menu_click),
		ui.menuitem(
			text: 'devel'
			submenu: ui.menu(
				items: [
					ui.menuitem(
						text: 'all4'
						action: menu_click
					),
					ui.menuitem(
						text: 'devel4'
						submenu: ui.menu(
							items: [
								ui.menuitem(
									text: 'all5'
									action: menu_click
								),
								ui.menuitem(
									text: 'devel5'
									action: menu_click
								),
							]
						)
					),
				]
			)
		),
	]
	window := ui.window(
		width: win_width
		height: win_height
		title: 'Resizable Window'
		resizable: true
		state: app
		children: [
			ui.column(
				margin_: 0
				widths: [ui.stretch, .4]
				heights: [ui.compact, .4]
				bg_color: gx.rgba(255, 0, 0, 20)
				children: [ui.menubar(
					items: menu_items
				),
					ui.button(text: 'Add user')]
			),
		]
	)
	app.window = window
	ui.run(window)
}

fn menu_click(item &ui.MenuItem) {
	println('$item.text selected (id: $item.id)')
}
