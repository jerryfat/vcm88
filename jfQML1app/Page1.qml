//import QtQuick 2.7
//import QtWebSockets 1.0

import Qt.labs.settings 1.0 // for persistent boot object and settings
import QtQuick.Dialogs 1.2 // for dialog boxes


/*MessageDialog {
    id: messageDialog
    title: "May I have your attention please"
    text: "It's so cool that you are using Qt Quick."
    onAccepted: {
        console.log("And of course you could only agree.")
        Qt.quit()
    }
    Component.onCompleted: visible = true
}*/

Page1Form {
    //console.log("Page1.qml Qt.application.name:",Qt.application.name," Qt.application.organization:",Qt.application.organization," Qt.application.domain:",Qt.application.domain)

    menu.onClosed : { // try to open serial port selected in menu // useRS232 checked // after a serial port avail ports menu.open(); // select port from menu and return index 0-5 in globButton
        comDevPathText = dataStore.call_get_serial_port_name( globButton );
        // inform user via Dialog message box text message
        globalText = qsTr("linux-PORT SELECTED: ") + dataStore.call_get_serial_port_name( globButton ) + qsTr("\n")
                    + qsTr("Port Info: ") + qsTr("\n") + dataStore.call_get_serial_port_info( globButton ) + qsTr("\n");
                    //+ qsTr("linux-PORTS-AVAIL:") + qsTr("\n") + dataStore.call_enumerate_serial_ports( );
        globalTitle = qsTr("linux-MENU PORT SELECTED: ") + globButton ;
        // go get the port info and initialize port
        new1Dialog.open();   // test dialog
        //
        // check if port closed
        console.log("qml: is port open before init");
        if ( dataStore.call_serial_port_IsOpen( globButton ) == "") {
            useRS232portOpen = true
        }

        //
        // try to open port
        console.log("qml: try to init port and open");
        dataStore.call_serial_port_init( globButton );

        // is port open after init
        console.log("qml: is port open after init");
        dataStore.call_serial_port_IsOpen( globButton );
        //
        //
    }

    useRS232.onClicked:{  //(master.checked && useRS232.checked) {                    // RS232 enabled    Qt.platform.os !== "android" linux, unix windows osx
        if (!useRS232.checked){
            console.log("qml: unchecked useRS232, try to close open ser port");
            //menu.item1.text = qsTr("port 0:") + dataStore.call_get_serial_port_info("0")

        }
        if (useRS232.checked){ // initialize serial port menus independent of os // if (Qt.platform.os == "linux"){ etc
            console.log("qml: checked useRS232, try to enumerate ser ports available in menu");
            //globalText =
            //globalTitle = qsTr("Platform.os: ") + Qt.platform.os
            menutxt0 = qsTr("port 0:") + qsTr("\n") + dataStore.call_get_serial_port_info("0");
            menutxt1 = qsTr("port 1:") + qsTr("\n") + dataStore.call_get_serial_port_info("1");
            menutxt2 = qsTr("port 2:") + qsTr("\n") + dataStore.call_get_serial_port_info("2");
            menutxt3 = qsTr("port 3:") + qsTr("\n") + dataStore.call_get_serial_port_info("3");
            menutxt4 = qsTr("port 4:") + qsTr("\n") + dataStore.call_get_serial_port_info("4");
            menutxt5 = qsTr("port 5:") + qsTr("\n") + dataStore.call_get_serial_port_info("5");
            comDevPathText = qsTr("None Selected") //dataStore.call_get_serial_port_name( globButton );
        }
        //if (useRS232.onClicked ) {  //&& useRS232.checked
            //menu.open();
            // try to open port
            //dataStore.call_serial_port_IsOpen( globButton );
            //
            //console.log("qml: try to init port and open");
            //dataStore.call_serial_port_init( globButton );
            //console.log("qml: try IsOpen()");
            //dataStore.call_serial_port_IsOpen( globButton );
        //}



        // SELECT SERIAL PORT by OS

        if (Qt.platform.os == "linux"){
            console.log("qml: comDevPathText:"+comDevPathText);
            console.log("qml: os= linux RS232 button pressed");
            if ( useRS232.checked ) { // checked
                menu.open();
            }
        }
        if (Qt.platform.os == "windows") {
            console.log("qml: comDevPathText:"+comDevPathText);
            console.log("qml: os= windows RS232 button pressed");
            if ( useRS232.checked ) { // checked
                menu.open();

            }
        //
        }
        if (Qt.platform.os == "osx") {
            console.log("qml: comDevPathText:"+comDevPathText);
            console.log("qml: os= osx RS232 button pressed");
            if ( useRS232.checked ) { // checked
                menu.open();

            }
            //
        }
        if (Qt.platform.os == "unix") {
            console.log("qml: comDevPathText:"+comDevPathText);
            console.log("qml: os= unix RS232 button pressed");
            if ( useRS232.checked ) { // checked
                menu.open();

            }
            //
        }
        if (Qt.platform.os == "android") {
            console.log("qml: comDevPathText:"+comDevPathText);
            console.log("qml: os= android RS232 button pressed");
            if ( useRS232.checked ) { // checked
                menu.open();
            }
            //
        }
    }
//sliders 0-7 8 is master sw0 is first on left of remote unit 7 is number 8 and master is sw8
    sw0.onClicked:{
        console.log("Switch0 moved Page1.qml id: val:", "sw0 " ,sw0.value);
        if (sw0.checked && master.checked && useTCP.checked) {
            console.log("Sending TCP msg sw0 moved Page1.qml id: val:", "sw0 " ,slider0.value);
            dataStore.call_TCP_FromQml("0", slider8.value*slider0.value*100, addr.text, port.text ); }
        if (sw0.checked && master.checked && useRS232.checked) {
            console.log("Sending RS232 msg sw0 moved Page1.qml id: val:", "sw0 " ,slider0.value);
            dataStore.call_RS232_FromQml("0", slider8.value*slider0.value*100, "0.0.0.0", port.text  ); }
        // uncheck
        if (sw0.checked==false && master.checked && useTCP.checked) {
            console.log("Sending TCP msg sw0 moved Page1.qml id: val:", "sw0 " ,sw0.value);
            dataStore.call_TCP_FromQml("0", 0, addr.text, port.text ); }
        if (sw0.checked==false && master.checked && useRS232.checked) {
            console.log("Sending RS232 msg sw0 moved Page1.qml id: val:", "sw0 " ,sw0.value);
            dataStore.call_RS232_FromQml("0", 0, "0.0.0.0", port.text  );}
    }
    sw1.onClicked:{
        console.log("Switch1 moved Page1.qml id: val:", "sw1 " ,sw1.value);
        if (sw1.checked && master.checked && useTCP.checked) {
            console.log("Sending TCP msg sw1 moved Page1.qml id: val:", "sw1 " ,sw1.value);
            dataStore.call_TCP_FromQml("1", slider8.value*slider1.value*100, addr.text, port.text ); }
        if (sw1.checked && master.checked && useRS232.checked) {
            console.log("Sending RS232 msg sw1 moved Page1.qml id: val:", "sw1 " ,sw1.value);
            dataStore.call_RS232_FromQml("1", slider8.value*slider1.value*100, "0.0.0.0", port.text  ); }
        // uncheck
        if (sw1.checked==false && master.checked && useTCP.checked) {
            console.log("Sending TCP msg sw1 moved Page1.qml id: val:", "sw1 " ,sw1.value);
            dataStore.call_TCP_FromQml("1", 0, addr.text, port.text ); }
        if (sw1.checked==false && master.checked && useRS232.checked) {
            console.log("Sending RS232 msg sw1 moved Page1.qml id: val:", "sw1 " ,sw1.value);
            dataStore.call_RS232_FromQml("1", 0, "0.0.0.0", port.text  );}
    }
    sw2.onClicked:{
        console.log("Switch2 moved Page1.qml id: val:", "sw2 " ,sw2.value);
        if (sw2.checked && master.checked && useTCP.checked) {
            console.log("Sending TCP msg sw2 moved Page1.qml id: val:", "sw2 " ,sw3.value);
            dataStore.call_TCP_FromQml("2", slider8.value*slider2.value*100, addr.text, port.text ); }
        if (sw2.checked && master.checked && useRS232.checked) {
            console.log("Sending RS232 msg sw2 moved Page1.qml id: val:", "sw2 " ,sw2.value);
            dataStore.call_RS232_FromQml("2", slider8.value*slider2.value*100, "0.0.0.0", port.text  ); }
        // uncheck
        if (sw2.checked==false && master.checked && useTCP.checked) {
            console.log("Sending TCP msg sw2 moved Page1.qml id: val:", "sw2 " ,sw2.value);
            dataStore.call_TCP_FromQml("2", 0, addr.text, port.text ); }
        if (sw2.checked==false && master.checked && useRS232.checked) {
            console.log("Sending RS232 msg sw2 moved Page1.qml id: val:", "sw2 " ,aw2.value);
            dataStore.call_RS232_FromQml("2", 0, "0.0.0.0", port.text  );}
    }
    sw3.onClicked:{
        console.log("Switch3 moved Page1.qml id: val:", "sw3 " ,sw3.value);
        if (sw3.checked && master.checked && useTCP.checked) {
            console.log("Sending TCP msg sw3 moved Page1.qml id: val:", "sw3 " ,sw3.value);
            dataStore.call_TCP_FromQml("3", slider8.value*slider3.value*100, addr.text, port.text ); }
        if (sw3.checked && master.checked && useRS232.checked) {
            console.log("Sending RS232 msg sw3 moved Page1.qml id: val:", "sw3 " ,sw3.value);
            dataStore.call_RS232_FromQml("3", slider8.value*slider3.value*100, "0.0.0.0", port.text  ); }
        // uncheck
        if (sw3.checked==false && master.checked && useTCP.checked) {
            console.log("Sending TCP msg sw3 moved Page1.qml id: val:", "sw3 " ,sw3.value);
            dataStore.call_TCP_FromQml("3", 0, addr.text, port.text ); }
        if (sw3.checked==false && master.checked && useRS232.checked) {
            console.log("Sending RS232 msg sw3 moved Page1.qml id: val:", "sw3 " ,sw3.value);
            dataStore.call_RS232_FromQml("3", 0, "0.0.0.0", port.text  );}
    }
    sw4.onClicked:{
        console.log("Switch4 moved Page1.qml id: val:", "sw4 " ,sw4.value);
        if (sw4.checked && master.checked && useTCP.checked) {
            console.log("Sending TCP msg sw4 moved Page1.qml id: val:", "sw4 " ,sw4.value);
            dataStore.call_TCP_FromQml("4", slider8.value*slider4.value*100, addr.text, port.text ); }
        if (sw4.checked && master.checked && useRS232.checked) {
            console.log("Sending RS232 msg sw4 moved Page1.qml id: val:", "sw4 " ,sw4.value);
            dataStore.call_RS232_FromQml("4", slider8.value*slider4.value*100, "0.0.0.0", port.text  ); }
        // uncheck
        if (sw4.checked==false && master.checked && useTCP.checked) {
            console.log("Sending TCP msg sw4 moved Page1.qml id: val:", "sw4 " ,sw4.value);
            dataStore.call_TCP_FromQml("4", 0, addr.text, port.text ); }
        if (sw4.checked==false && master.checked && useRS232.checked) {
            console.log("Sending RS232 msg sw4 moved Page1.qml id: val:", "sw4 " ,sw4.value);
            dataStore.call_RS232_FromQml("4", 0, "0.0.0.0", port.text  );}
    }
    sw5.onClicked:{
        console.log("Switch5 moved Page1.qml id: val:", "sw5 " ,sw5.value);
        if (sw5.checked && master.checked && useTCP.checked) {
            console.log("Sending TCP msg sw5 moved Page1.qml id: val:", "sw5 " ,sw5.value);
            dataStore.call_TCP_FromQml("5", slider8.value*slider5.value*100, addr.text, port.text ); }
        if (sw5.checked && master.checked && useRS232.checked) {
            console.log("Sending RS232 msg sw5 moved Page1.qml id: val:", "sw5 " ,sw5.value);
            dataStore.call_RS232_FromQml("5", slider8.value*slider5.value*100, "0.0.0.0", port.text  ); }
        // uncheck
        if (sw5.checked==false && master.checked && useTCP.checked) {
            console.log("Sending TCP msg sw5 moved Page1.qml id: val:", "sw5 " ,sw5.value);
            dataStore.call_TCP_FromQml("5", 0, addr.text, port.text ); }
        if (sw5.checked==false && master.checked && useRS232.checked) {
            console.log("Sending RS232 msg sw5 moved Page1.qml id: val:", "sw5 " ,sw5.value);
            dataStore.call_RS232_FromQml("5", 0, "0.0.0.0", port.text  );}
    }
    sw6.onClicked:{
        console.log("Switch6 moved Page1.qml id: val:", "sw6 " ,sw6.value);
        if (sw6.checked && master.checked && useTCP.checked) {
            console.log("Sending TCP msg sw6 moved Page1.qml id: val:", "sw6 " ,sw6.value);
            dataStore.call_TCP_FromQml("6", slider8.value*slider6.value*100, addr.text, port.text ); }
        if (sw6.checked && master.checked && useRS232.checked) {
            console.log("Sending RS232 msg sw6 moved Page1.qml id: val:", "sw6 " ,sw6.value);
            dataStore.call_RS232_FromQml("6", slider8.value*slider6.value*100, "0.0.0.0", port.text  ); }
        // uncheck
        if (sw6.checked==false && master.checked && useTCP.checked) {
            console.log("Sending TCP msg sw6 moved Page1.qml id: val:", "sw6 " ,sw6.value);
            dataStore.call_TCP_FromQml("6", 0, addr.text, port.text ); }
        if (sw6.checked==false && master.checked && useRS232.checked) {
            console.log("Sending RS232 msg sw6 moved Page1.qml id: val:", "sw6 " ,sw6.value);
            dataStore.call_RS232_FromQml("6", 0, "0.0.0.0", port.text  );}
    }
    sw7.onClicked:{
        console.log("Switch7 moved Page1.qml id: val:", "sw7 " ,sw7.value);
        if (sw7.checked && master.checked && useTCP.checked) {
            console.log("Sending TCP msg sw7 moved Page1.qml id: val:", "sw7 " ,sw7.value);
            dataStore.call_TCP_FromQml("7", slider8.value*slider7.value*100, addr.text, port.text ); }
        if (sw7.checked && master.checked && useRS232.checked) {
            console.log("Sending RS232 msg sw7 moved Page1.qml id: val:", "sw7 " ,sw7.value);
            dataStore.call_RS232_FromQml("7", slider8.value*slider7.value*100, "0.0.0.0", port.text  ); }
        // uncheck
        if (sw7.checked==false && master.checked && useTCP.checked) {
            console.log("Sending TCP msg sw7 moved Page1.qml id: val:", "sw7 " ,sw7.value);
            dataStore.call_TCP_FromQml("7", 0, addr.text, port.text ); }
        if (sw7.checked==false && master.checked && useRS232.checked) {
            console.log("Sending RS232 msg sw7 moved Page1.qml id: val:", "sw7 " ,sw7.value);
            dataStore.call_RS232_FromQml("7", 0, "0.0.0.0", port.text  );}
    }


    master.onClicked:{
        console.log(" master.onClicked:" ); // MUTE
        if (master.checked==false && useTCP.checked) { //(useTCP.checked && master.checked) {    // TCP enabled so send messages
            console.log(" MUTE useIP addr and port for network Page1.qml addr: port:", "slider8 " , addr.text, port.text );
            //
            console.log(" send TCP msg Slider8 moved Page1.qml id: val:", "slider8 " ,slider8.value);
            dataStore.call_TCP_FromQml("8", 0, addr.text, port.text );
            // send 0-7 multiplied by value=slider8.value(0-1)

                console.log("Slider0 moved Page1.qml id: val:", "slider0 " ,slider0.value);
                dataStore.call_TCP_FromQml("0", 0, addr.text, port.text );

                console.log("Slider1 moved Page1.qml id: val:", "slider1 " ,slider1.value);
                dataStore.call_TCP_FromQml("1", 0, addr.text, port.text );

                console.log("Slider2 moved Page1.qml id: val:", "slider2 " ,slider2.value);
                dataStore.call_TCP_FromQml("2", 0, addr.text, port.text );

                console.log("Slider3 moved Page1.qml id: val:", "slider3 " ,slider3.value);
                dataStore.call_TCP_FromQml("3", 0, addr.text, port.text );

                console.log("Slider4 moved Page1.qml id: val:", "slider4 " ,slider4.value);
                dataStore.call_TCP_FromQml("4", 0, addr.text, port.text );

                console.log("Slider5 moved Page1.qml id: val:", "slider5 " ,slider5.value);
                dataStore.call_TCP_FromQml("5", 0, addr.text, port.text );

                console.log("Slider6 moved Page1.qml id: val:", "slider6 " ,slider6.value);
                dataStore.call_TCP_FromQml("6", 0, addr.text, port.text );

                console.log("Slider7 moved Page1.qml id: val:", "slider7 " ,slider7.value);
                dataStore.call_TCP_FromQml("7", 0, addr.text, port.text );
        }
        if (master.checked==true && useTCP.checked) { // UNMUTE (useTCP.checked && master.checked) {    // TCP enabled so send messages
            console.log(" UNMUTE useIP addr and port for network Page1.qml addr: port:", "slider8 " , addr.text, port.text );
            //
            console.log(" send TCP msg Slider8 moved Page1.qml id: val:", "slider8 " ,slider8.value);
            dataStore.call_TCP_FromQml("8", slider8.value*100, addr.text, port.text );
            // send 0-7 multiplied by value=slider8.value(0-1)
            if (sw0.checked) {
                console.log("Slider0 moved Page1.qml id: val:", "slider0 " ,slider0.value);
                dataStore.call_TCP_FromQml("0", slider8.value*slider0.value*100, addr.text, port.text ); }
            if (sw1.checked) {
                console.log("Slider1 moved Page1.qml id: val:", "slider1 " ,slider1.value);
                dataStore.call_TCP_FromQml("1", slider8.value*slider1.value*100, addr.text, port.text );}
            if (sw2.checked) {
                console.log("Slider2 moved Page1.qml id: val:", "slider2 " ,slider2.value);
                dataStore.call_TCP_FromQml("2", slider8.value*slider2.value*100, addr.text, port.text );}
            if (sw3.checked) {
                console.log("Slider3 moved Page1.qml id: val:", "slider3 " ,slider3.value);
                dataStore.call_TCP_FromQml("3", slider8.value*slider3.value*100, addr.text, port.text );}
            if (sw4.checked) {
                console.log("Slider4 moved Page1.qml id: val:", "slider4 " ,slider4.value);
                dataStore.call_TCP_FromQml("4", slider8.value*slider4.value*100, addr.text, port.text );}
            if (sw5.checked) {
                console.log("Slider5 moved Page1.qml id: val:", "slider5 " ,slider5.value);
                dataStore.call_TCP_FromQml("5", slider8.value*slider5.value*100, addr.text, port.text );}
            if (sw6.checked) {
                console.log("Slider6 moved Page1.qml id: val:", "slider6 " ,slider6.value);
                dataStore.call_TCP_FromQml("6", slider8.value*slider6.value*100, addr.text, port.text );}
            if (sw7.checked) {
                console.log("Slider7 moved Page1.qml id: val:", "slider7 " ,slider7.value);
                dataStore.call_TCP_FromQml("7", slider8.value*slider7.value*100, addr.text, port.text );}
            }
   }


    /*button1.onClicked: {
        console.log("Button Pressed. Inside Page1.qml() Entered text: " + textField1.text);
        dataStore.callMeFromQml();
        //console.log("");
        }*/

    addr.onAccepted: {
        console.log("Addr text field changed, looking up hostanme from address");
        }

    slider0.onValueChanged: {
        console.log("Slider0 moved Page1.qml id: val:", "slider0 " ,slider0.value);
        if (sw0.checked && master.checked && useTCP.checked) {
            console.log("Sending TCP msg Slider0 moved Page1.qml id: val:", "slider0 " ,slider0.value);
            dataStore.call_TCP_FromQml("0", slider8.value*slider0.value*100, addr.text, port.text ); }
        if (sw0.checked && master.checked && useRS232.checked) {
            console.log("Sending RS232 msg Slider0 moved Page1.qml id: val:", "slider0 " ,slider0.value);
            dataStore.call_RS232_FromQml("0", slider8.value*slider0.value*100, "0.0.0.0", port.text  );
        } }
    slider1.onValueChanged: {
        console.log("Slider1 moved Page1.qml id: val:", "slider1 " ,slider1.value);
        if (sw1.checked && master.checked && useTCP.checked) {
            console.log("Sending TCP msg Slider1 moved Page1.qml id: val:", "slider1 " ,slider1.value);
            dataStore.call_TCP_FromQml("1", slider8.value*slider1.value*100, addr.text, port.text ); }
        if (sw1.checked && master.checked && useRS232.checked) {
            console.log("Sending RS232 msg Slider1 moved Page1.qml id: val:", "slider1 " ,slider1.value);
            dataStore.call_RS232_FromQml("1", slider8.value*slider1.value*100, "0.0.0.0", port.text  );
        } }
    slider2.onValueChanged: {
        console.log("Slider2 moved Page1.qml id: val:", "slider2 " ,slider2.value);
        if (sw2.checked && master.checked && useTCP.checked) {
            console.log("Sending TCP msg Slider2 moved Page1.qml id: val:", "slider2 " ,slider2.value);
            dataStore.call_TCP_FromQml("2", slider8.value*slider2.value*100, addr.text, port.text ); }
        if (sw2.checked && master.checked && useRS232.checked) {
            console.log("Sending RS232 msg Slider2 moved Page1.qml id: val:", "slider2 " ,slider2.value);
            dataStore.call_RS232_FromQml("2", slider8.value*slider2.value*100, "0.0.0.0", port.text  );
        } }
    slider3.onValueChanged: {
        console.log("Slider3 moved Page1.qml id: val:", "slider3 " ,slider3.value);
        if (sw3.checked && master.checked && useTCP.checked) {
            console.log("Sending TCP msg Slider3 moved Page1.qml id: val:", "slider3 " ,slider3.value);
            dataStore.call_TCP_FromQml("3", slider8.value*slider3.value*100, addr.text, port.text ); }
        if (sw3.checked && master.checked && useRS232.checked) {
            console.log("Sending RS232 msg Slider3 moved Page1.qml id: val:", "slider3 " ,slider3.value);
            dataStore.call_RS232_FromQml("3", slider8.value*slider3.value*100, "0.0.0.0", port.text  );
        } }
    slider4.onValueChanged: {
        console.log("Slider4 moved Page1.qml id: val:", "slider4 " ,slider4.value);
        if (sw4.checked && master.checked && useTCP.checked) {
            console.log("Sending TCP msg Slider4 moved Page1.qml id: val:", "slider4 " ,slider4.value);
            dataStore.call_TCP_FromQml("4", slider8.value*slider4.value*100, addr.text, port.text ); }
        if (sw4.checked && master.checked && useRS232.checked) {
            console.log("Sending RS232 msg Slider4 moved Page1.qml id: val:", "slider4 " ,slider0.value);
            dataStore.call_RS232_FromQml("4", slider8.value*slider4.value*100, "0.0.0.0", port.text  );
        } }
    slider5.onValueChanged: {
        console.log("Slider5 moved Page1.qml id: val:", "slider5 " ,slider5.value);
        if (sw5.checked && master.checked && useTCP.checked) {
            console.log("Sending TCP msg Slider5 moved Page1.qml id: val:", "slider5 " ,slider5.value);
            dataStore.call_TCP_FromQml("5", slider8.value*slider5.value*100, addr.text, port.text ); }
        if (sw5.checked && master.checked && useRS232.checked) {
            console.log("Sending RS232 msg Slider5 moved Page1.qml id: val:", "slider5 " ,slider5.value);
            dataStore.call_RS232_FromQml("5", slider8.value*slider5.value*100, "0.0.0.0", port.text  );
        } }
    slider6.onValueChanged: {
        console.log("Slider6 moved Page1.qml id: val:", "slider6 " ,slider6.value);
        if (sw6.checked && master.checked && useTCP.checked) {
            console.log("Sending TCP msg Slider6 moved Page1.qml id: val:", "slider6 " ,slider6.value);
            dataStore.call_TCP_FromQml("6", slider8.value*slider6.value*100, addr.text, port.text ); }
        if (sw6.checked && master.checked && useRS232.checked) {
            console.log("Sending RS232 msg Slider6 moved Page1.qml id: val:", "slider6 " ,slider6.value);
            dataStore.call_RS232_FromQml("6", slider8.value*slider6.value*100, "0.0.0.0", port.text  );
        } }
    slider7.onValueChanged: {
        console.log("Slider7 moved Page1.qml id: val:", "slider7 " ,slider7.value);
        if (sw7.checked && master.checked && useTCP.checked) {
            console.log("Sending TCP msg Slider7 moved Page1.qml id: val:", "slider7 " ,slider7.value);
            dataStore.call_TCP_FromQml("7", slider8.value*slider7.value*100, addr.text, port.text ); }
        if (sw7.checked && master.checked && useRS232.checked) {
            console.log("Sending RS232 msg Slider7 moved Page1.qml id: val:", "slider7 " ,slider7.value);
            dataStore.call_RS232_FromQml("7", slider8.value*slider7.value*100, "0.0.0.0", port.text  );
        } }
    slider8.onValueChanged: { // master slider
        console.log("Slider8 has moved Page1.qml id: val:", "slider8 " ,slider8.value);
        //

    if (master.checked && useTCP.checked) { //(useTCP.checked && master.checked) {    // TCP enabled so send messages
            console.log(" useIP addr and port for network Page1.qml addr: port:", "slider8 " , addr.text, port.text );
            //
            console.log(" send TCP msg Slider8 moved Page1.qml id: val:", "slider8 " ,slider8.value);
            //dataStore.call_TCP_FromQml("8", slider8.value*100, addr.text, port.text );
            // send 0-7 multiplied by value=slider8.value(0-1)
            if (sw0.checked) {
                console.log("Slider0 moved Page1.qml id: val:", "slider0 " ,slider0.value);
                dataStore.call_TCP_FromQml("0", slider8.value*slider0.value*100, addr.text, port.text ); }
            if (sw1.checked) {
                console.log("Slider1 moved Page1.qml id: val:", "slider1 " ,slider1.value);
                dataStore.call_TCP_FromQml("1", slider8.value*slider1.value*100, addr.text, port.text );}
            if (sw2.checked) {
                console.log("Slider2 moved Page1.qml id: val:", "slider2 " ,slider2.value);
                dataStore.call_TCP_FromQml("2", slider8.value*slider2.value*100, addr.text, port.text );}
            if (sw3.checked) {
                console.log("Slider3 moved Page1.qml id: val:", "slider3 " ,slider3.value);
                dataStore.call_TCP_FromQml("3", slider8.value*slider3.value*100, addr.text, port.text );}
            if (sw4.checked) {
                console.log("Slider4 moved Page1.qml id: val:", "slider4 " ,slider4.value);
                dataStore.call_TCP_FromQml("4", slider8.value*slider4.value*100, addr.text, port.text );}
            if (sw5.checked) {
                console.log("Slider5 moved Page1.qml id: val:", "slider5 " ,slider5.value);
                dataStore.call_TCP_FromQml("5", slider8.value*slider5.value*100, addr.text, port.text );}
            if (sw6.checked) {
                console.log("Slider6 moved Page1.qml id: val:", "slider6 " ,slider6.value);
                dataStore.call_TCP_FromQml("6", slider8.value*slider6.value*100, addr.text, port.text );}
            if (sw7.checked) {
                console.log("Slider7 moved Page1.qml id: val:", "slider7 " ,slider7.value);
                dataStore.call_TCP_FromQml("7", slider8.value*slider7.value*100, addr.text, port.text );}
            }
        if (master.checked && useRS232.checked) {                    // RS232 enabled    Qt.platform.os !== "android" linux, unix windows osx
            console.log("Send RS232 msg Slider8 moved Page1.qml id: val:", "slider8 " ,slider8.value);
            dataStore.call_RS232_FromQml("8", slider8.value*100, "0.0.0.0", port.text );
            console.log("Slider0 moved Page1.qml id: val:", "slider0 " ,slider0.value); // send 0-7 multiplied by value=slider8.value(0-1)
            dataStore.call_RS232_FromQml("0", slider8.value*slider0.value*100, "0.0.0.0", comDevPath.text );
            console.log("Slider1 moved Page1.qml id: val:", "slider1 " ,slider1.value);
            dataStore.call_RS232_FromQml("1", slider8.value*slider1.value*100, "0.0.0.0", comDevPath.text );
            console.log("Slider2 moved Page1.qml id: val:", "slider2 " ,slider2.value);
            dataStore.call_RS232_FromQml("2", slider8.value*slider2.value*100, "0.0.0.0", comDevPath.text );
            console.log("Slider3 moved Page1.qml id: val:", "slider3 " ,slider3.value);
            dataStore.call_RS232_FromQml("3", slider8.value*slider3.value*100, "0.0.0.0", comDevPath.text );
            console.log("Slider4 moved Page1.qml id: val:", "slider4 " ,slider4.value);
            dataStore.call_RS232_FromQml("4", slider8.value*slider4.value*100, "0.0.0.0", comDevPath.text );
            console.log("Slider5 moved Page1.qml id: val:", "slider5 " ,slider5.value);
            dataStore.call_RS232_FromQml("5", slider8.value*slider5.value*100, "0.0.0.0", comDevPath.text );
            console.log("Slider6 moved Page1.qml id: val:", "slider6 " ,slider6.value);
            dataStore.call_RS232_FromQml("6", slider8.value*slider6.value*100, "0.0.0.0", comDevPath.text );
            console.log("Slider7 moved Page1.qml id: val:", "slider7 " ,slider7.value);
            dataStore.call_RS232_FromQml("7", slider8.value*slider7.value*100, "0.0.0.0", comDevPath.text );
          }
    }
}
        /*if (master.checked && useBT.checked) { // BT enabled
            console.log("Send BT msg Slider8 moved Page1.qml id: val:", "slider8 " ,slider8.value);
            dataStore.call_TCP_FromQml("8", slider8.value*100, addr.text, port.text );
            // send 0-7 multiplied by value=slider8.value(0-1)
            console.log("Slider0 moved Page1.qml id: val:", "slider0 " ,slider0.value);
            dataStore.call_TCP_FromQml("0", slider8.value*slider0.value*100, addr.text, port.text );
            console.log("Slider1 moved Page1.qml id: val:", "slider1 " ,slider1.value);
            dataStore.call_TCP_FromQml("1", slider8.value*slider1.value*100, addr.text, port.text );
            console.log("Slider2 moved Page1.qml id: val:", "slider2 " ,slider2.value);
            dataStore.call_TCP_FromQml("2", slider8.value*slider2.value*100, addr.text, port.text );
            console.log("Slider3 moved Page1.qml id: val:", "slider3 " ,slider3.value);
            dataStore.call_TCP_FromQml("3", slider8.value*slider3.value*100, addr.text, port.text );
            console.log("Slider4 moved Page1.qml id: val:", "slider4 " ,slider4.value);
            dataStore.call_TCP_FromQml("4", slider8.value*slider4.value*100, addr.text, port.text );
            console.log("Slider5 moved Page1.qml id: val:", "slider5 " ,slider5.value);
            dataStore.call_TCP_FromQml("5", slider8.value*slider5.value*100, addr.text, port.text );
            console.log("Slider6 moved Page1.qml id: val:", "slider6 " ,slider6.value);
            dataStore.call_TCP_FromQml("6", slider8.value*slider6.value*100, addr.text, port.text );
            console.log("Slider7 moved Page1.qml id: val:", "slider7 " ,slider7.value);
            dataStore.call_TCP_FromQml("7", slider8.value*slider7.value*100, addr.text, port.text );
            }
        }*/
    //persistent vars to save
    /*
    // allows external global
    property alias slider0: slider0
    property alias slider1: slider1
    property alias slider2: slider2
    property alias slider3: slider3
    property alias slider4: slider4
    property alias slider5: slider5
    property alias slider6: slider6
    property alias slider7: slider7
    property alias slider8: slider8
    width: 1024
    height: 600
    property alias sw0 : sw0
    property alias sw1 : sw1
    property alias sw2 : sw3
    property alias sw3 : sw3
    property alias sw4 : sw4
    property alias sw5 : sw5
    property alias sw6 : sw6
    property alias sw7 : sw7
    property alias master : master
    property alias useTCP : useTCP
    property alias useRS232 : useRS232
    property alias useBT : useBT
    property alias addr : addr
    property alias port : port */

