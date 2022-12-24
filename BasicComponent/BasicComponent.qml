import QtQuick

Window {
    width: 640; height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: root
        anchors.fill: parent

        Text {  //文本
            id: helloText
            anchors.horizontalCenter: root.horizontalCenter
            text: "Hello World" //文本属性，指定显示的文本
        }
    }
}
