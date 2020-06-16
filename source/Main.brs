sub Main()
	showChannelSGScreen()
end sub
sub showChannelSGScreen()
print "in showChannelSGScreen"
	screen = CreateObject("roSGScreen")
	m.port = CreateObject("roMessagePort")
	screen.setMessagePort(m.port)
	scene = screen.CreateScene("mainScene")


	screen.show()
	scene.findNode("leftRectangle").observeField("width", m.port)

	while(true)

		msg = wait(0, m.port)
		msgType = type(msg)

		if msgType = "roSGScreenEvent"

			if msg.isScreenClosed() then return

		else if msgType = "roSGNodeEvent"
           print "node "; msg.getNode()
           print "field name "; msg.getField()
           print "data "; msg.getData()
           scene.findNode(msg.getNode()).height = 400
	   end if

	end while
end sub
