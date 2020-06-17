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
    'Encontrar el nodo y observar el width por el puerto
	scene.findNode("leftRectangle").observeField("width", m.port)
    scene.findNode("Video").observeField("control",m.port)
	while(true)
		msg = wait(0, m.port)
		msgType = type(msg)
		if msgType = "roSGScreenEvent"
			if msg.isScreenClosed() then return
        'Si hay un evento de nodo
		else if msgType = "roSGNodeEvent"
           print "node "; msg.getNode()
           print "field name "; msg.getField()
           print "data "; msg.getData()
           'Establece el alto de la escena 
           scene.findNode(msg.getNode()).height = 200
	   end if
	end while
end sub
