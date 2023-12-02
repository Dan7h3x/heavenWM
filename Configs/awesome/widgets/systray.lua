local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local color = require("widgets.colors")
local dpi = beautiful.xresources.apply_dpi

--Separator
local separator = wibox.widget.textbox("")

--Systray Widget
local systray = wibox.widget({
	wibox.widget.systray(),
	widget = wibox.container.margin,
	left = dpi(1),
	right = dpi(1),
	top = dpi(1),
	bottom = dpi(1),
	visible = true,
})

--Tray toggle widget
local widget = wibox.widget({
	id = "icon",
	widget = wibox.widget.imagebox,
	image = os.getenv("HOME") .. "/.config/awesome/icons/crayon/w4.png",
	resize = true,
	opacity = 1,
})

local tray_toggle = wibox.widget({
	{
		widget,
		left = dpi(1),
		right = 0,
		top = dpi(1),
		bottom = dpi(1),
		widget = wibox.container.margin,
	},
	bg = color.background_dark,
	shape = gears.shape.rounded_rect,
	widget = wibox.container.background,
})

--Main Widget
local top_left = wibox.widget({
	{
		{
			separator,
			systray,
			separator,
			tray_toggle,
			layout = wibox.layout.fixed.horizontal,
		},
		widget = wibox.container.background,
		shape = gears.shape.rounded_rect,
		bg = color.background_dark,
	},
	left = dpi(1),
	right = dpi(0),
	top = dpi(1),
	bottom = dpi(1),
	widget = wibox.container.margin,
})

--Toggle function for systray
tray_toggle:connect_signal("button::press", function(_, _, _, button)
	if button == 1 then
		systray.visible = not systray.visible
		if systray.visible then
			widget:set_image(os.getenv("HOME") .. "/.config/awesome/icons/crayon/w4.png")
		else
			widget:set_image(os.getenv("HOME") .. "/.config/awesome/icons/crayon/w3.png")
		end
	end
end)

return top_left
