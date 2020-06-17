sub init()
        print "in showMainScene"
        m.leftRectangle = m.top.findNode("leftRectangle")
        m.leftRectangle.observeField("color", "someFunction")
        m.leftRectangle.observeField("width", "someOtherFunction")
        m.top.setFocus(true)
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
            m.leftRectangle.setField("color", "0x0000FFFF")
            m.leftRectangle.setField("width", 350)
            handled = true
          end if
        end if
        return handled
      end function
