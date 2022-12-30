import QtQuick

Window {
    width: 640; height: 480
    visible: true
    title: "Positioner-Row"

    Row {
        anchors.fill: parent

        MyRandColorRect {
            width: 100; height: 100
        }
    }
}
