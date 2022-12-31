import QtQuick

Window {
    width: 640; height: 480
    visible: true
    title: "Positioner-Grid"

    Rectangle {
        anchors.fill: parent

        Grid {  //网格定位器
            id:theGrid
            anchors.fill: parent
            rows: 4; columns: 4 //行列数，默认均为4
            spacing: 4//元素间距, 也可用 rowSpacing: 4; columnSpacing: 4
            padding: 6  //边距，同 Row

            Repeater {  //Repeater, 用于显示多个相似元素
                model: 16   //重复次数

                MyRandColorRect {
                    width: 100; height: 100
                    radius: 20
                }
            }
        }
    }
}
