function mandaScreen()
    print "HOLA ya entre"
    screen=CreateObject("roScreen")
    white=&hFF000000
    screen.Clear(white)
    screen.SetAlphaEnable(true)
    screen.finish()
    sleep(5000)
    print "Ya acabe"
    screen = CreateObject("roScreen") ' Create the screen

end function
