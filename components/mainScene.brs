sub init()
        print "in showMainScene"
        m.leftRectangle = m.top.findNode("leftRectangle")
        m.Video = m.top.findNode("Video")
        m.leftRectangle.observeField("color", "someFunction")
        m.leftRectangle.observeField("width", "someOtherFunction")
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

sub someFunction()
  print "color was changed"
end sub

sub someOtherFunction()
  print "width was changed"
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
  handled = false
  if press then
    if (key = "OK")
      print"hi"
      m.leftRectangle.setField("color", "0x0000FFFF")
      m.leftRectangle.setField("width", 350)
      m.Video.setField("control","pause")
      handled = true
    else if (key="left" or key="right") then
      print "Trae funcion" 
      'm.Video.setField("control","pause")
    end if
  end if
  return handled
end function
