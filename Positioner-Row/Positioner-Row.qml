import QtQuick

Window {
    width: 640; height: 480
    visible: true
    title: "Positioner-Row"

    Row {   //行定位器
        anchors.fill: parent
        spacing: 4  //元素间距
        padding: 3  //整个定位器的外围留白, 也可在前面加上方向
        layoutDirection: "LeftToRight"  //排列方向，默认从左到右

        Repeater {
            model: 5

            MyRandColorRect {
                width: 100; height: 100
            }
        }
    }
}
