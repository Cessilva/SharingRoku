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
    'Componentes nuevos
    screen = CreateObject("roSGScreen")
	m.port = CreateObject("roMessagePort")
    'Encontrar el nodo del video y observar el field control por el puerto
    scene.findNode("Video").observeField("control",m.port)
	while(true)
		msg = wait(0, m.port)
		msgType = type(msg)
		if msgType = "roSGScreenEvent"
			if msg.isScreenClosed() then return
        'Si hay un evento de nodo
		else if msgType = "roSGNodeEvent"
        'Cuando el nodo tiene algun movimiento:imprime el nodo que se esta manejando
           print "node "; msg.getNode()
           print "field name "; msg.getField()
           print "data "; msg.getData()
           'Llama a la funcion que va a traer a la otra escena
           print"Voy a crear el otro screen"
           scene.findNode("Video").visible="false"
           mandaScreen()
           scene.findNode("Video").visible="true"
           'Establece el alto de la escena 
           ' scene.findNode(msg.getNode()).height = 200
	   end if
	end while
end sub
