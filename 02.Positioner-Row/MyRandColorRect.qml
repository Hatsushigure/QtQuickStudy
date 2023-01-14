//随机颜色的矩形
import QtQuick

Item {
    Rectangle {
        id: theRect
        anchors.fill: parent
        color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
    }
}
