import QtQuick 2.7
//import QtQuick.Controls 1.4 // error: Cannot assign to non-existent property "to"
import QtQuick.Controls 2.2
// qml styling
//import QtQuick.Controls.Styles 1.4 // old qwidget not qml quick 2
import QtQuick.Particles 2.0
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

// for dialog boxes
// ? #include <QSerialPortInfo>
Item {
    // allows external global
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
    property alias localhostname: localhostname
    property alias hostName: hostName
    property alias slider0: slider0
    property alias sw0: sw0
    property alias sw2: sw2
    property alias sw4: sw4
    property alias sw1: sw1
    property alias sw3: sw3
    property alias sw5: sw5
    property alias sw6: sw6
    property alias sw7: sw7
    property alias master: master
    property alias useTCP: useTCP
    property alias useRS232: useRS232
    property alias useBT: useBT
    //property alias useRS232portOpen: useRS232portOpen
    //
    property alias menu: menu
    property var menutxt0 : qsTr("")
    property var menutxt1 : qsTr("")
    property var menutxt2 : qsTr("")
    property var menutxt3 : qsTr("")
    property var menutxt4 : qsTr("")
    property var menutxt5 : qsTr("")


    //property alias menu: menu
    //property alias useBT: useBT
    property alias addr: addr
    property alias port: port
    property alias comDevPath: comDevPath
    property alias textBluetooth: textBluetooth


    property alias new1Dialog: new1Dialog
    property alias new2Dialog: new2Dialog
    //scale: 1.5
    rotation: 0

    // default text messages
    property var comDevPathText: qsTr("none") //qsTr("/dev/ttyUSB0")
    property var globalTitle: qsTr("msgTitle")
    property var globalText: qsTr("HelloJerry") // text for global text field
    property var globButton: 0 // return value from dialog 0 = cancel,ok=1,

    property var useRS232portOpen : 0


    //property alias globalTitle : globalTitle
    //property alias globalText : globalText
    //property alias globButton : globButton

    //property alias globText : globalText
    //property alias globButton : globButton // value 0 = false 1 = ok 2 =2nd button 3 = 4th button

    /*RowLayout {
        anchors.horizontalCenterOffset: -2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 8
        anchors.top: parent.top
        */

    /*ColumnLayout {
            TextField {
                id: textField1
                width: 100
                placeholderText: qsTr("Text Field")
            }

            Button {
                id: button1
                text: qsTr("Press Me")

                //onClicked: dataStore.callMeFromQml()
            }
        }*/

    // slider horizontal movement:
    //x: slider0.leftPadding + slider0.visualPosition * (slider0.availableWidth - width)
    //y: slider0.topPadding + slider0.availableHeight / 2 - height / 2
    // slider vertical movement
    //x: slider0.leftPadding //+ slider0.availableWidth / 2 + (slider0.availableWidth - width)
    //y: slider0.topPadding + (slider0.availableHeight * slider0.visualPosition) - height / 2
    Dialog {
        // text in title
        id: new1Dialog
        //width: Qt.platform.os == "linux" ?  300 : 1
        title: qsTr("" + globalTitle) //qsTr("MessageDialog") //globalText // "new1Dialog"
        Column {
            anchors.fill: parent
            Text {
                text: qsTr("" + globalText) //globalText  //"TextMessage"
                //height: 400
            }
        }
        /*TextField {
                id: newDialogInput
                width: parent.width * 0.75
                focus: true
                onFocusChanged: console.log("Focus changed " + focus)
            }*/

        //text: globalText //"It's so cool that you are using Qt Quick."
        /*onAccepted: {
            console.log("And of course you could only agree.")
            //Qt.quit()// quit app
        }*/
        //Component.onCompleted: visible = true
        //visible : false
    }

    Dialog {
        id: new2Dialog
        title: qsTr("" + globalTitle)
        height: 150
        width: 300
        standardButtons: StandardButton.Ok | StandardButton.Cancel

        //focus: true    // Needed in 5.9+ or this code is NOT going to work!!
        Column {
            anchors.fill: parent
            Text {
                text: qsTr("" + globalText)
                height: 40
            }
            TextField {
                id: newDialog2Input
                width: parent.width * 0.75
                focus: true
                //onFocusChanged: console.log("Focus changed " + focus)
            }
        }
    }


    /* functions not allowed in 5.9 ?   function new1Dialog() {// 1 button OK and simple text message
        new1Dialog.open()
        //newDialogInput.focus = true
    }*/

    /*Button {
            anchors.centerIn: parent
            text: "click me!"
            onClicked: newFolder()
        }*/

    /* no functions in 5.9 ?
            function new2Dialog() {  // new 2 button dialog OK CANCEL and input text field
            new2Dialog.open()
            //newDialogInput.focus = true
        }*/

    Label {
        id: vcm88
        x: 596
        y: 164
        text: qsTr("VCM-88 CONTROL")
        font.pointSize: 10
        font.bold: true
        z: 7
        color: "#ffffff"
    }

    Label {
        id: jerryfat
        x: 599
        y: 178
        text: qsTr("BY JERRY FAT")
        font.bold: true
        font.pointSize: 12
        z: 6
        color: "#ffffff"
    }

    /*
    QUrl url("192.168.1.2:2000")
    qDebug() << "IP Host:" << url.host();
    qDebug() << "IP Port:" << url.port();

    QTcpSocket tcpSocket;
    tcpSocket.connectToHost(url.host(), url.port()); //tcpSocket.connectToHost("192.168.1.2", 2000);
    if (tcpSocket.isOpen ())
       qDebug(" C++: Socket opened");
       qDebug(" C++: data0 data1 data2: %d %d %d" , data[0] , data[1], data[2]);
       qDebug(" C++: data0 data1 data2: %d %d %d" , bankID , channel, level);
       length = tcpSocket.write(data);
       length2 = tcpSocket.waitForBytesWritten();
       qDebug(" C++: len:%d %d",length, length2);
       tcpSocket.disconnectFromHost(); //close socket
       qDebug("\n");
    else
       qDebug("C++: Socket error: not opened");
    */
    Slider {
        id: slider0
        x: 8
        y: 159
        width: 40
        height: 180
        to: 1.27
        //clip:true
        //opacity: 0.5
        orientation: Qt.Vertical
        //value: 0
        //enabled: master.checked ? true : false
        //opacity: master.checked ? 1.0 : 0.5
        //visible: sw0.checked ? true : false
        handle: Rectangle {
            // horizontal movement:
            //x: slider0.leftPadding + slider0.visualPosition * (slider0.availableWidth - width)
            //y: slider0.topPadding + slider0.availableHeight / 2 - height / 2
            // vertical movement
            x: slider0.leftPadding //+ slider0.availableWidth / 2 + (slider0.availableWidth - width)
            y: slider0.topPadding + (slider0.availableHeight * slider0.visualPosition) - height / 2
            color: sw0.checked ? "#f0f0f0" : "#f6f6f6"
            border.color: "black"
            border.width: 2
            implicitWidth: 24
            implicitHeight: 14
            //radius: 2 // square corners
            radius: (sw0.checked
                     && master.checked) ? width : 4 //radius: 4 square
            Image {
                width: 60
                height: 150
                anchors.centerIn: parent
                //source: "images/ASHLY-slider-handle3-green.png"
                //source: (sw0.checked && master.checked) ? "images/ASHLY-slider-handle3-green.png" : "images/ASHLY-slider-handle3-red.png"
                source: (slider0.pressed == true) ? "images/ASHLY-slider-handle4-yellow.png" : (sw0.checked && master.checked) ? "images/ASHLY-slider-handle4-green.png" : "images/ASHLY-slider-handle3-red.png"
                //source: (slider0.pressed==true && sw0.checked && master.checked) ? "images/ASHLY-slider-handle3-yellow.png" : (sw0.checked && master.checked) ? "images/ASHLY-slider-handle3-green.png" : "images/ASHLY-slider-handle3-red.png"
                //color: roundButton.checked ? "#b9fd4b" : "#8B0000"
                // text: roundButton.checked ? qsTr("ON") : qsTr("OFF")
            }
        }

        //end handle rectabgle
    } //end slider0

    Slider {
        id: slider1
        x: 68
        y: 159
        width: 40
        height: 180
        to: 1.27
        orientation: Qt.Vertical
        //enabled: master.checked ? true : false
        //opacity: master.checked ?  1.0 : 0.5
        //visible: sw1.checked ? true : false
        //value:0 default
        handle: Rectangle {
            // horizontal movement:
            //x: slider0.leftPadding + slider0.visualPosition * (slider0.availableWidth - width)
            //y: slider0.topPadding + slider0.availableHeight / 2 - height / 2
            // vertical movement
            x: slider1.leftPadding //+ slider0.availableWidth / 2 + (slider0.availableWidth - width)
            y: slider1.topPadding + (slider1.availableHeight * slider1.visualPosition) - height / 2
            color: sw1.checked ? "#f0f0f0" : "#f6f6f6"
            border.color: "black"
            border.width: 2
            implicitWidth: 24
            implicitHeight: 14
            radius: 2
            Image {
                x: -15
                width: 60
                height: 150
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: 0
                anchors.centerIn: parent
                //source: "images/ASHLY-slider-handle3-green.png"
                //source: (sw1.checked && master.checked) ? "images/ASHLY-slider-handle3-green.png" : "images/ASHLY-slider-handle3-red.png"
                source: (slider1.pressed == true) ? "images/ASHLY-slider-handle4-yellow.png" : (sw1.checked && master.checked) ? "images/ASHLY-slider-handle4-green.png" : "images/ASHLY-slider-handle3-red.png"
            }
        } //end handle rectabgle
    }

    Slider {
        id: slider2
        x: 122
        y: 159
        width: 40
        height: 180
        //visible: sw2.checked ? true : false
        to: 1.27
        orientation: Qt.Vertical
        //enabled: master.checked ? true : false
        //value: 0
        //enabled: false
        handle: Rectangle {
            // horizontal movement:
            //x: slider0.leftPadding + slider0.visualPosition * (slider0.availableWidth - width)
            //y: slider0.topPadding + slider0.availableHeight / 2 - height / 2
            // vertical movement
            x: slider2.leftPadding //+ slider0.availableWidth / 2 + (slider0.availableWidth - width)
            y: slider2.topPadding + (slider2.availableHeight * slider2.visualPosition) - height / 2
            color: sw2.checked ? "#f0f0f0" : "#f6f6f6"
            border.color: "black"
            border.width: 2
            implicitWidth: 24
            implicitHeight: 14
            radius: 2
            Image {
                x: -18
                width: 60
                height: 150
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: 4
                anchors.centerIn: parent
                //source: (sw2.checked && master.checked)? "images/ASHLY-slider-handle3-green.png" : "images/ASHLY-slider-handle3-red.png"
                //source: "images/ASHLY-slider-handle3-red.png"
                source: (slider2.pressed == true) ? "images/ASHLY-slider-handle4-yellow.png" : (sw2.checked && master.checked) ? "images/ASHLY-slider-handle4-green.png" : "images/ASHLY-slider-handle3-red.png"
            }
        } //end handle rectabgle
    }

    Slider {
        id: slider3
        x: 185
        y: 159
        width: 40
        height: 180
        to: 1.27
        orientation: Qt.Vertical
        //enabled: master.checked ? true : false
        //visible: sw3.checked ? true : false
        //value: 0
        handle: Rectangle {
            // horizontal movement:
            //x: slider0.leftPadding + slider0.visualPosition * (slider0.availableWidth - width)
            //y: slider0.topPadding + slider0.availableHeight / 2 - height / 2
            // vertical movement
            x: slider3.leftPadding //+ slider0.availableWidth / 2 + (slider0.availableWidth - width)
            y: slider3.topPadding + (slider3.availableHeight * slider3.visualPosition) - height / 2
            color: sw3.checked ? "#f0f0f0" : "#f6f6f6"
            border.color: "black"
            border.width: 2
            implicitWidth: 24
            implicitHeight: 14
            radius: 2
            Image {
                width: 60
                height: 150
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: 0
                anchors.centerIn: parent
                source: (slider3.pressed == true) ? "images/ASHLY-slider-handle4-yellow.png" : (sw3.checked && master.checked) ? "images/ASHLY-slider-handle4-green.png" : "images/ASHLY-slider-handle3-red.png"
                //source: "images/ASHLY-slider-handle3-red.png"
                //source: (sw3.checked && master.checked) ? "images/ASHLY-slider-handle3-green.png" : "images/ASHLY-slider-handle3-red.png"
            }
        } //end handle rectabgle
    }

    Slider {
        id: slider4
        x: 240
        y: 159
        width: 40
        height: 180
        to: 1.27
        orientation: Qt.Vertical
        //enabled: master.checked ? true : false
        //visible: sw4.checked ? true : false//value: 0
        handle: Rectangle {
            // horizontal movement:
            //x: slider0.leftPadding + slider0.visualPosition * (slider0.availableWidth - width)
            //y: slider0.topPadding + slider0.availableHeight / 2 - height / 2
            // vertical movement
            x: slider4.leftPadding //+ slider0.availableWidth / 2 + (slider0.availableWidth - width)
            y: slider4.topPadding + (slider4.availableHeight * slider4.visualPosition) - height / 2
            color: sw4.checked ? "#f0f0f0" : "#f6f6f6"
            border.color: "black"
            border.width: 2
            implicitWidth: 24
            implicitHeight: 14
            radius: 2
            Image {
                width: 60
                height: 150
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: 4
                anchors.centerIn: parent
                source: (slider4.pressed == true) ? "images/ASHLY-slider-handle4-yellow.png" : (sw4.checked && master.checked) ? "images/ASHLY-slider-handle4-green.png" : "images/ASHLY-slider-handle3-red.png"
                //source: "images/ASHLY-slider-handle3.jpg"
                //source: (sw4.checked && master.checked) ? "images/ASHLY-slider-handle3-green.png" : "images/ASHLY-slider-handle3-red.png"
            }
        } //end handle rectabgle
    }

    Slider {
        id: slider5
        x: 301
        y: 159
        width: 40
        height: 180
        to: 1.27
        orientation: Qt.Vertical
        //enabled: master.checked ? true : false
        //visible: sw5.checked ? true : false
        //value: 0
        handle: Rectangle {
            // horizontal movement:
            //x: slider0.leftPadding + slider0.visualPosition * (slider0.availableWidth - width)
            //y: slider0.topPadding + slider0.availableHeight / 2 - height / 2
            // vertical movement
            x: slider5.leftPadding //+ slider0.availableWidth / 2 + (slider0.availableWidth - width)
            y: slider5.topPadding + (slider5.availableHeight * slider5.visualPosition) - height / 2
            width: 34
            color: sw5.checked ? "#f0f0f0" : "#f6f6f6"
            border.color: "black"
            border.width: 2
            implicitWidth: 24
            implicitHeight: 14
            radius: 2
            Image {
                x: -16
                width: 60
                height: 150
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: -6
                anchors.centerIn: parent
                source: (slider5.pressed == true) ? "images/ASHLY-slider-handle4-yellow.png" : (sw5.checked && master.checked) ? "images/ASHLY-slider-handle4-green.png" : "images/ASHLY-slider-handle3-red.png"
                //source: "images/ASHLY-slider-handle3.jpg"
                //source: (sw5.checked && master.checked) ? "images/ASHLY-slider-handle3-green.png" : "images/ASHLY-slider-handle3-red.png"
            }
        } //end handle rectabgle
    }

    Slider {
        id: slider6
        x: 360
        y: 159
        width: 40
        height: 180
        to: 1.27
        orientation: Qt.Vertical
        //enabled: master.checked ? true : false
        //visible: sw6.checked ? true : false
        //value: 0
        handle: Rectangle {
            // horizontal movement:
            //x: slider0.leftPadding + slider0.visualPosition * (slider0.availableWidth - width)
            //y: slider0.topPadding + slider0.availableHeight / 2 - height / 2
            // vertical movement
            x: slider6.leftPadding //+ slider0.availableWidth / 2 + (slider0.availableWidth - width)
            y: slider6.topPadding + (slider6.availableHeight * slider6.visualPosition) - height / 2
            color: sw6.checked ? "#f0f0f0" : "#f6f6f6"
            border.color: "black"
            border.width: 2
            implicitWidth: 24
            implicitHeight: 14
            radius: 2
            Image {
                width: 60
                height: 150
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: 0
                anchors.centerIn: parent
                //source: "images/ASHLY-slider-handle3.jpg"
                source: (slider6.pressed == true) ? "images/ASHLY-slider-handle4-yellow.png" : (sw6.checked && master.checked) ? "images/ASHLY-slider-handle4-green.png" : "images/ASHLY-slider-handle3-red.png"
                //source: (sw6.checked && master.checked) ? "images/ASHLY-slider-handle3-green.png" : "images/ASHLY-slider-handle3-red.png"
            }
        } //end handle rectabgle
    }

    Slider {
        id: slider7
        x: 421
        y: 159
        width: 40
        height: 180
        to: 1.27
        orientation: Qt.Vertical
        //enabled: master.checked ? true : false
        //visible: sw7.checked ? true : false
        //value: 0
        handle: Rectangle {
            // horizontal movement:
            //x: slider0.leftPadding + slider0.visualPosition * (slider0.availableWidth - width)
            //y: slider0.topPadding + slider0.availableHeight / 2 - height / 2
            // vertical movement
            x: slider7.leftPadding //+ slider0.availableWidth / 2 + (slider0.availableWidth - width)
            y: slider7.topPadding + (slider7.availableHeight * slider7.visualPosition) - height / 2
            color: sw7.checked ? "#f0f0f0" : "#f6f6f6" //(sw1.checked && master.checked)
            border.color: "black"
            border.width: 2
            implicitWidth: 24
            implicitHeight: 14
            radius: 2
            Image {
                width: 60
                height: 150
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: 0
                anchors.centerIn: parent
                //source: "images/ASHLY-slider-handle3.jpg"
                //source: (sw7.checked && master.checked) ? "images/ASHLY-slider-handle3-green.png" : "images/ASHLY-slider-handle3-red.png"
                source: (slider7.pressed == true) ? "images/ASHLY-slider-handle4-yellow.png" : (sw7.checked && master.checked) ? "images/ASHLY-slider-handle4-green.png" : "images/ASHLY-slider-handle3-red.png"
            }
        } //end handle rectabgle
    }

    Slider {
        // aka master
        id: slider8
        x: 494
        y: 80
        width: 50
        height: 227
        spacing: 1
        leftPadding: 20
        to: 1
        orientation: Qt.Vertical
        //enabled: master.checked ? true : false
        //visible: master.checked ? true : false
        //value: 0
        handle: Rectangle {
            // horizontal movement:
            //x: slider0.leftPadding + slider0.visualPosition * (slider0.availableWidth - width)
            //y: slider0.topPadding + slider0.availableHeight / 2 - height / 2
            // vertical movement
            x: slider8.leftPadding //+ slider0.availableWidth / 2 + (slider0.availableWidth - width)
            y: slider8.topPadding + (slider8.availableHeight * slider8.visualPosition) - height / 2
            //color: master.checked ? "#f0f0f0" : "#f6f6f6"
            //color: master.checked ? "#f0f0f0" : "#f6f6f6"
            color: master.checked ? "#f0f0f0" : "#f6f6f6"
            border.color: "black"
            border.width: 2
            implicitWidth: 24
            implicitHeight: 14
            radius: 2
            Image {
                width: 57
                height: 109
                anchors.verticalCenterOffset: 1
                anchors.horizontalCenterOffset: 6
                scale: 1.7
                anchors.centerIn: parent
                //source: "images/ASHLY-slider-handle-green.jpg"
                //source: master.checked ? "images/ASHLY-slider-handle3-green.png" : "images/ASHLY-slider-handle3-red.png"
                source: (slider8.pressed == true) ? "images/ASHLY-slider-handle4-yellow.png" : (master.checked && master.checked) ? "images/ASHLY-slider-handle4-green.png" : "images/ASHLY-slider-handle3-red.png"
            }
        } //end handle rectabgle
    }


    ///
    RoundButton {
        id: sw0
        x: 8
        y: 12
        width: 55
        height: 100
        text: (sw0.checked && master.checked) ? qsTr("ON") : qsTr("OFF")
        font.strikeout: false
        //visible: master.checked ? true : false
        //enabled: true
        //text: sw0.checked ? qsTr("ON") : qsTr("MUTE")
        checkable: true
        font.bold: true
        font.pointSize: 16
        //opacity: master.checked ?  1.0 : 0.5
        //checkable: true
        //checked: true
        //button0: roundButton.down ? true : false
        background: Rectangle {
            //color: "#b9fd4b"
            implicitWidth: width
            implicitHeight: height
            border.color: "#fce94f" //"#ce5c00"
            border.width: 3
            radius: (sw0.checked
                     && master.checked) ? width * 0.5 : 4 //radius: 4 square
            color: (sw0.checked
                    && master.checked) ? "#64a001" : "#8B0000" //"#b9fd4b"
            // text: roundButton.checked ? qsTr("ON") : qsTr("OFF")
            //color: roundButton.down ? "#b9fd4b" : "#f6f6f6"
        }
    }

    RoundButton {
        id: sw1
        x: 65
        y: 12
        width: 55
        height: 100
        checkable: true
        text: (sw1.checked && master.checked) ? qsTr("ON") : qsTr("OFF")
        font.strikeout: false
        //visible: master.checked ? true : false
        font.bold: true
        font.pointSize: 16
        //opacity: master.checked ?  1.0 : 0.5
        background: Rectangle {
            //color: "#b9fd4b"
            implicitWidth: width
            implicitHeight: height
            border.color: "#fce94f" //"#ce5c00"
            border.width: 3
            radius: (sw1.checked
                     && master.checked) ? width * 0.5 : 4 //radius: 4 square
            //color: master.checked ? "#b9fd4b" : "#8B0000"
            color: (sw1.checked && master.checked) ? "#64a001" : "#8B0000"
        }
    }

    RoundButton {
        id: sw2
        x: 122
        y: 12
        width: 55
        height: 100
        checkable: true
        text: (sw2.checked && master.checked) ? qsTr("ON") : qsTr("OFF")
        //visible: master.checked ? true : false
        font.pointSize: 16
        font.bold: true
        background: Rectangle {
            implicitWidth: width
            implicitHeight: height
            border.color: "#fce94f" //"#ce5c00"
            border.width: 3
            radius: (sw2.checked
                     && master.checked) ? width * 0.5 : 4 //radius: 4 square
            color: (sw2.checked && master.checked) ? "#64a001" : "#8B0000"
        }
    }

    RoundButton {
        id: sw3
        x: 178
        y: 12
        width: 55
        height: 100
        checkable: true
        //visible: master.checked ? true : false
        text: (sw3.checked && master.checked) ? qsTr("ON") : qsTr("OFF")
        font.bold: true
        font.pointSize: 16
        background: Rectangle {
            implicitWidth: width
            implicitHeight: height
            border.color: "#fce94f" //"#ce5c00"
            border.width: 3
            radius: (sw3.checked
                     && master.checked) ? width * 0.5 : 4 //radius: 4 square
            color: (sw3.checked && master.checked) ? "#64a001" : "#8B0000"
        }
    }

    RoundButton {
        id: sw4
        x: 236
        y: 11
        width: 55
        height: 100
        checkable: true
        text: (sw4.checked && master.checked) ? qsTr("ON") : qsTr("OFF")
        //visible: master.checked ? true : false
        font.bold: true
        font.pointSize: 16
        background: Rectangle {
            implicitWidth: width
            implicitHeight: height
            border.color: "#fce94f" //"#ce5c00"
            border.width: 3
            radius: (sw4.checked
                     && master.checked) ? width * 0.5 : 4 //radius: 4 square
            color: (sw4.checked && master.checked) ? "#64a001" : "#8B0000"
        }
    }

    Rectangle {
        id: rectangle
        x: 759
        y: 255
        width: 31
        height: 105
        color: "#8a8585"
        visible: false
    }

    RoundButton {
        id: sw5
        x: 294
        y: 12
        width: 55
        height: 100
        checkable: true
        text: (sw5.checked && master.checked) ? qsTr("ON") : qsTr("OFF")
        //visible: master.checked ? true : false
        font.bold: true
        font.pointSize: 16
        background: Rectangle {
            color: (sw5.checked && master.checked) ? "#64a001" : "#8B0000"
            implicitWidth: width
            implicitHeight: height
            border.color: "#fce94f" //"#ce5c00"
            border.width: 3
            radius: (sw5.checked
                     && master.checked) ? width * 0.5 : 4 //radius: 4 square
        }
    }

    RoundButton {
        id: sw6
        x: 353
        y: 12
        width: 55
        height: 100
        checkable: true
        text: (sw6.checked && master.checked) ? qsTr("ON") : qsTr("OFF")
        //visible: master.checked ? true : false
        font.bold: true
        font.pointSize: 16
        background: Rectangle {
            color: (sw6.checked && master.checked) ? "#64a001" : "#8B0000"
            implicitWidth: width
            implicitHeight: height
            border.color: "#fce94f" //"#ce5c00"
            border.width: 3
            radius: (sw6.checked
                     && master.checked) ? width * 0.5 : 4 //radius: 4 square
        }
    }

    RoundButton {
        id: sw7
        x: 412
        y: 12
        width: 55
        height: 100
        text: (sw7.checked && master.checked) ? qsTr("ON") : qsTr("OFF")
        //visible: master.checked ? true : false
        scale: 1
        checkable: true
        font.bold: true
        font.pointSize: 16
        background: Rectangle {
            color: (sw7.checked && master.checked) ? "#64a001" : "#8B0000"
            implicitWidth: width
            implicitHeight: height
            border.color: "#fce94f" //"#ce5c00"
            border.width: 3
            radius: (sw7.checked
                     && master.checked) ? width * 0.5 : 4 //radius: 4 square
        }
    }

    RoundButton {
        id: master
        x: 592
        y: 15
        width: 103
        height: 142
        text: "MUTE"
        checkable: true
        visible: true // always visible
        font.weight: Font.Bold
        font.bold: true
        font.pointSize: 22
        rotation: 0
        scale: 1
        background: Rectangle {
            //width: 5
            color: master.checked ? "#64a001" : "#ce5c00"
            implicitWidth: width
            implicitHeight: height
            border.color: "#fce94f" //"#ce5c00"
            border.width: 3
            radius: master.checked ? width * 0.5 : 4 //radius: 4 square
        }
    }

    TextField {
        id: addr
        x: 612
        y: 252
        width: 80
        height: 30
        //text: addr.checked
        text: qsTr("192.168.1.5")
        font.pointSize: 12
        bottomPadding: 5
        topPadding: 5
        z: 2
        visible: useTCP.checked ? true : false
    }

    TextField {
        id: port
        x: 621
        y: 286
        width: 51
        height: 30
        text: qsTr("2000")
        leftPadding: 2
        font.pointSize: 12
        bottomPadding: 5
        topPadding: 5
        z: 1
        visible: useTCP.checked ? true : false
    }

    Label {
        id: labelAddr
        x: 842
        y: 211
        text: qsTr("Srvr")
        visible: false
        z: 3
    }

    Label {
        id: labelIPserialServer
        x: 779
        y: 100
        text: qsTr("Connect To:")
        font.underline: true
        font.bold: true
        z: 5
        font.pointSize: 14
        visible: (useBT.checked | useRS232.checked | useTCP.checked) ? true : false
    }

    Menu {
        id: menu
        //x: 681
        x: useRS232.width
        width: 300
        height: 400 // useRS232.height * 4

        MenuItem {
            id: item0
            text: menutxt0
            //text: dataStore.call_get_serial_port_info("0") ? qsTr("port 0:") + dataStore.call_get_serial_port_info("0") : qsTr("")
            onClicked: globButton = 0  // comDevPathText =
        }
        MenuItem {
            id: item1
            text: menutxt1
            //text: dataStore.call_get_serial_port_info("1") ? qsTr("port 1:") + dataStore.call_get_serial_port_info("1") : qsTr("")
            onClicked: globButton = 1
        }
        MenuItem {
            id: item2
            text: menutxt2
            //text: dataStore.call_get_serial_port_info("2") ? qsTr("port 2:") + dataStore.call_get_serial_port_info("2") : qsTr("")
            onClicked: globButton = 2
        }
        MenuItem {
            id: item3
            text: menutxt3
            //text: dataStore.call_get_serial_port_info("3") ? qsTr("port 3:") + dataStore.call_get_serial_port_info("3") : qsTr("")
            onClicked: globButton = 3
        }
        MenuItem {
            id: item4
            text: menutxt4
            //text: dataStore.call_get_serial_port_info("4") ? qsTr("port 4:") + dataStore.call_get_serial_port_info("4") : qsTr("")
            onClicked: globButton = 4
        }
        MenuItem {
            id: item5
            text: menutxt5
            //text: dataStore.call_get_serial_port_info("5") ? qsTr("port 5:") + dataStore.call_get_serial_port_info("5") : qsTr("")
            onClicked: globButton = 5
        }
    }

    CheckBox {
        id: useRS232
        x: 594
        y: 331
        text: qsTr("RS232")
        font.bold: true
        scale: 1
        leftPadding: 2
        rightPadding: 2
        font.pointSize: 13
        bottomPadding: 2
        topPadding: 2
        //onClicked: menu.open();

    }

    CheckBox {
        id: useTCP
        x: 594
        y: 216
        text: qsTr("TCP Server")
        display: AbstractButton.TextOnly
        focusPolicy: Qt.StrongFocus
        font.bold: true
        scale: 1
        rightPadding: 2
        leftPadding: 2
        topPadding: 2
        bottomPadding: 2
        font.pointSize: 13
    }

    CheckBox {
        id: useBT
        x: 774
        y: 159
        text: qsTr("Bluetooth")
        visible: false
        font.bold: true
        font.pointSize: 13
        checked: false
        rightPadding: 2
        bottomPadding: 2
        leftPadding: 2
        topPadding: 2
    }

    Text {
        id: localIPaddr
        x: 763
        y: 210
        width: 42
        height: 21
        text: qsTr("0.0.0.0")
        visible: false
        font.pointSize: 13
    }

    Text {
        id: hostName
        x: 796
        y: 333
        width: 56
        height: 15
        text: qsTr("localhost")
        visible: false
        font.pointSize: 13
    }

    Text {
        id: localhostname
        x: 810
        y: 373
        text: qsTr("local addr")
        visible: false
        font.pointSize: 13
    }

    TextField {
        id: textBluetooth
        x: 810
        y: 241
        width: 97
        height: 25
        text: qsTr("NotWorking")
        bottomPadding: 5
        visible: useBT.checked ? true : false
        font.pixelSize: 10
    }

    TextField {
        id: comDevPath
        x: 598
        y: 369
        width: 115
        height: 27
        text: comDevPathText //qsTr("/dev/ttyUSB0")
        bottomPadding: 8
        visible: useRS232.checked ? true : false
        font.pixelSize: 10
    }

    /*Button {
        id: fileButton
        text: "File"
        onClicked: menu.open()

        Menu {
            id: menu
            y: fileButton.height

            MenuItem {
                text: "New..."
            }
            MenuItem {
                text: "Open..."
            }
            MenuItem {
                text: "Save"
            }
        }
    }*/

    Label {
        id: label
        x: 595
        y: 199
        text: qsTr("Version: 6.0 8-25-2019")
        font.bold: true
        font.pointSize: 8
        color: "#ffffff"
    }

    Rectangle {
        id: rectangle1
        x: 0
        y: -1
        width: 968
        height: 547
        color: "#565353"
        z: -1
        visible: true
    }
}
/////// END ALL RIGHTS RESERVED JERRY FAT 2017

