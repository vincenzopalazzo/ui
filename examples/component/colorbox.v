import ui
import ui.component as uic
import gx

const (
	win_width  = 30 + 256 + 4 * 10 + uic.cb_cv_hsv_w
	win_height = 376
)

struct App {
mut:
	window &ui.Window
}

fn main() {
	mut app := &App{
		window: 0
	}
	cb_layout := uic.colorbox_stack(id: 'cbox', light: false, hsl: false)
	rect := ui.rectangle(text: 'Here a simple ui rectangle')
	mut dtw := ui.DrawTextWidget(rect)
	dtw.update_style(color: gx.blue, size: 30)
	window := ui.window(
		width: win_width
		height: win_height
		title: 'V UI: Toolbar'
		state: app
		native_message: false
		children: [
			ui.column(
				heights: [ui.compact, ui.compact]
				children: [cb_layout, rect]
			),
		]
	)
	mut cb := uic.colorbox_component(cb_layout)
	cb.connect(&rect.style.color)
	app.window = window
	ui.run(window)
}
