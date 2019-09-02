import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ApplicationWindow {
    visible: true
    width: 1024
    height: 600
    title: qsTr("*** VCM-88 Remote Controller by Jerry Fat Ver 4.0 ***")

    // inline qml for window background from file
    background: BorderImage {
        //source: "images/slider-handle.png"
        //source: "images/rd-8-front.jpg" //"background.png"
        //source: "images/ASHLY_rd8-f.jpg"
        //source: "images/ASHLY-official-rd-8-front.jpg"
        //border { left: 20; top: 20; right: 20; bottom: 20 }
        }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        //currentIndex: tabBar.currentIndex

        Page1 {
        }

        /*Page {
            Label {
                text: qsTr("Second page")
                anchors.centerIn: parent
            }
        }*/
    }

    /*footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        TabButton {
            text: qsTr("First")
        }
        TabButton {
            text: qsTr("Second")
        }
    }*/
}
