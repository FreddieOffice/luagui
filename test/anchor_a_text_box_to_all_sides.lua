require 'gui'

local window = gui.create_window()
local text_box = window:add_text_box()
text_box.width = window.width / 2
text_box.anchor = 'all'

gui.run()