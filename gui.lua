require 'wx'
local Window = require 'gui.window'
local OpenFileDialog = require 'gui.open_file_dialog'

gui = {}

function gui.create_window()
  return Window.create()
end

function gui.create_open_file_dialog()
  return OpenFileDialog.create()
end

function gui.run()
  wx.wxGetApp():MainLoop()
end

function gui.reload()
  package.loaded.gui = nil
  
  for name,_ in pairs(package.loaded) do
    if string.match(name, 'gui%..+') then
      package.loaded[name] = nil
    end
  end
  
  return require 'gui'
end