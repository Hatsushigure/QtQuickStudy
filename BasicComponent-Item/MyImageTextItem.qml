//为了方便观察，用此组件代替 Item
import QtQuick

Item {
    property alias text: simpleText.text

    Rectangle {
        id: root
        color: "transparent"
        anchors.fill: parent

        Image {
            anchors.top: parent.top; anchors.left: parent.left
            width: parent.width; height: parent.height - simpleText.height
            source: "../Picture.png"
        }

        Text {
            id: simpleText
            width: parent.width
            anchors.bottom: parent.bottom;
            text: "MyImageTextItem"
            horizontalAlignment: Text.AlignHCenter

        }
    }
}
