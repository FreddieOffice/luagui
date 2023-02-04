local common = require 'gui.common'

local MediaPlayer = {}
local metatable = common.create_metatable(MediaPlayer)
common.add_position(metatable, 'media_player')
common.add_size(metatable, 'media_player')

function metatable.set_file_name(object, value)
    object.wx:Load(value)
end

function MediaPlayer.create(parent)
  local mediaplayer = {
     parent = parent,
     wx_events = {}
  }
  
  mediaplayer.wx = wx.wxMediaCtrl(
     parent.wx_panel or parent.wx,
     wx.wxID_ANY,
     '',
     wx.wxDefaultPosition, 
     wx.wxSize(200, 200))

  setmetatable(mediaplayer, metatable)
  
  return mediaplayer
end

function MediaPlayer:play()
    self.wx:Play()
end
function MediaPlayer:pause()
    self.wx:Pause()
end
function MediaPlayer:stop()
    self.wx:Stop()
end

return MediaPlayer
