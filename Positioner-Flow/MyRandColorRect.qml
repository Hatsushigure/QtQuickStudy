//随机颜色的矩形
import QtQuick

Item {
    property alias radius: theRect.radius

    Rectangle {
        id: theRect
        anchors.fill: parent
        color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
    }
}
