local dpi = require('beautiful.xresources').apply_dpi
local wibox = require('wibox')
local awful = require('awful')
local gears = require('gears')
local gfs = require("gears.filesystem")
local current_config = gfs.get_configuration_dir()

local add_margin = require('layout/.add-margin')
local pacman_icon = current_config .. "/icons/pacman.png"
local empty1_icon = current_config .. "/icons/empty.png"
local ghost_icon = current_config .. "/icons/ghost.png"

local get_taglist = function(s)
		-- Taglist buttons
		local taglist_buttons = gears.table.join(
			awful.button({}, 1,
				function(t) t:view_only() end),
			awful.button({ modkey }, 1, function(t)
				if client.focus then client.focus:move_to_tag(t) end
			end), awful.button({}, 3, awful.tag.viewtoggle),
			awful.button({ modkey }, 3, function(t)
				if client.focus then client.focus:toggle_tag(t) end
			end), awful.button({}, 4, function(t)
				awful.tag.viewnext(t.screen)
			end), awful.button({}, 5, function(t)
				awful.tag.viewprev(t.screen)
			end))
		----------------------------------------------------------------------
		----------------------------------------------------------------------
		local unfocus = gears.surface.load_uncached(
			ghost_icon)
		--local unfocus_icon = gears.color.recolor_image(unfocus, color.light)
		local empty = gears.surface.load_uncached(
			empty1_icon)
		--local empty_icon = gears.color.recolor_image(empty, "#4C6070")
		local focus = gears.surface.load_uncached(
			pacman_icon)
		--local focus_icon = gears.color.recolor_image(focus, color.yellow --[["#f76a65"]])

		----------------------------------------------------------------------
		----------------------------------------------------------------------

		-- Function to update the tags
		local update_tags = function(self, c3)
			local tagicon = self:get_children_by_id('icon_role')[1]
			if c3.selected then
				tagicon.image = focus
			elseif #c3:clients() == 0 then
				tagicon.image = empty
			else
				tagicon.image = unfocus
			end
		end
		----------------------------------------------------------------------
		----------------------------------------------------------------------

		local icon_taglist = awful.widget.taglist {
			screen = s,
			filter = awful.widget.taglist.filter.all,
			layout = { spacing = 0, layout = wibox.layout.fixed.horizontal },
			widget_template = {
				{
					{ id = 'icon_role', widget = wibox.widget.imagebox },
					id = 'margin_role',
					top = dpi(0),
					bottom = dpi(0),
					left = dpi(2),
					right = dpi(2),
					widget = wibox.container.margin
				},
				id = 'background_role',
				widget = wibox.container.background,
				create_callback = function(self, c3, index, objects)
					update_tags(self, c3)
				end,

				update_callback = function(self, c3, index, objects)
					update_tags(self, c3)
				end
			},
			buttons = taglist_buttons
		}
		return icon_taglist
	end

return get_taglist