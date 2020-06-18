sub init()
        print "in showMainScene"
        m.Video = m.top.findNode("Video")
        setContent()
        m.Video.visible = "true"
        m.Video.control = "play"
        m.top.setFocus(true)
end sub
sub setContent()
  ContentNode = CreateObject("roSGNode", "ContentNode")
  ContentNode.streamFormat = "mp4"
  ContentNode.url ="https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4"
  m.Video.content = ContentNode
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
  handled = false
  if press then
    if (key = "OK")
      print"hi"
      ' m.leftRectangle.setField("color", "0x0000FFFF")
      ' m.leftRectangle.setField("width", 350)
      m.Video.setField("control","resume")
      
      handled = true
    else if (key="left" or key="right") then
      print "Trae funcion" 
      m.Video.setField("control","pause")
      m.Video.visible="false"
    end if
  end if
  return handled
end function
