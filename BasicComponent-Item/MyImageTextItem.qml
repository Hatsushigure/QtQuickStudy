//为了方便观察，用此组件代替 Item
import QtQuick

Item {
    Rectangle {
        id: root
        anchors.fill: parent

        Image {
            anchors.top: parent.top; anchors.left: parent.left
            width: parent.width
            source: "../Picture.png"
        }

        Text {
            id: simpleText
            anchors.bottom: parent.bottom
            text: "MyImageTextItem"
        }
    }
}
