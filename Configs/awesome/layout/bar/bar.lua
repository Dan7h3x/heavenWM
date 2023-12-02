local dpi = require("beautiful.xresources").apply_dpi
local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local gfs = require("gears.filesystem")
local current_config = gfs.get_configuration_dir()

-- Widgets
local date = require("widgets/.clock")
local mem = require("widgets/.mem")
local wifi = require("widgets/.wifi")
local weather = require("widgets/.weather")
local hdd = require("widgets/.hdd")
local cpu = require("widgets/.cpu")
local weather_widget = require("widgets.weather-widget.weather")
local dashboard = require("widgets/.dashboard")
local volume_widget = require("widgets.volume-widget.volume")
local fs_widget = require("widgets.fs-widget.fs-widget")
local bat = require("widgets.battery")
local taglist = require("layout/bar/.taglist")
local todo = require("widgets.todo-widget.todo")
local pacman_widget = require("widgets.pacman-widget.pacman")
local mpdarc = require("widgets.mpdarc-widget.mpdarc")
local systray = require("widgets.systray")
-- Functions
local add_margin = require("layout/.add-margin")
local baritems = require("layout/bar/.baritems")

awful.screen.connect_for_each_screen(function(s)
	-- Each scre en has its own tag table.
	awful.tag({ "1", "2", "3", "4", "5", "6", "7" }, s, awful.layout.layouts[1])

	baritems(s)

	s.mytaglist = taglist(s)

	function rounded_shape(cr, width, height)
		gears.shape.rounded_rect(cr, width, height, 15)
	end

	s.mywibox = awful.wibar({
		position = "top",
		screen = s,
		height = 35,
		width = s.full,
		border_width = 3,
		shape = rounded_shape,
	})

	s.mywibox:setup({
		layout = wibox.layout.align.horizontal,
		{ -- Left Items
			add_margin(s.mytaglist, 7),
			add_margin(s.mytasklist, 7),
			layout = wibox.layout.align.horizontal,
		},
		{ -- Middle Items
			layout = wibox.layout.align.horizontal,
			add_margin(s.mypromptbox, 3),
			add_margin(mpdarc, 3),
		},
		{ -- Right Items
			add_margin(todo(), 4),
			add_margin(
				pacman_widget({
					interval = 600, -- Refresh every 10 minutes
					popup_bg_color = "#222222",
					popup_border_width = 1,
					popup_border_color = "#7e7e7e",
					popup_height = 10, -- 10 packages shown in scrollable window
					popup_width = 300,
					polkit_agent_path = "/usr/bin/lxpolkit",
				}),
				3
			),

			add_margin(systray, 3),
			add_margin(
				weather_widget({
					api_key = "74506808e69308bd700962204ad7fecf",
					coordinates = { 35.6944, 51.4245 },
					font_name = "Carter One",
					icons = "VitalyGorbachev",
					icons_extension = ".svg",
					show_hourly_forecast = true,
					show_daily_forecast = true,
				}),
				5
			),
			add_margin(wifi, 5),
			add_margin(cpu, 5),
			add_margin(hdd, 5),
			add_margin(mem, 5),
			add_margin(bat, 5),
			add_margin(date, 5),
			add_margin(volume_widget, 2),
			add_margin(s.mylayoutbox, 5),
			layout = wibox.layout.fixed.horizontal,
		},
		left = 100,
	})
end)
