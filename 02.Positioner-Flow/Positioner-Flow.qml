import QtQuick

Window {
    width: 640; height: 480
    visible: true
    title: "Positioner-Flow"

    Rectangle {
        anchors.fill: parent

        Flow {  //流定位器。与网格不同，它会自动适应可用空间排布元素
            //rows: Useless!
            anchors.fill: parent
            spacing: 4  //元素间距
            padding: 5  //边距

            Repeater {
                model: 25

                MyRandColorRect {
                    width: 85; height: 85
                    radius: 20

                    Text {
                        anchors.centerIn: parent
                        text: parent.Positioner.index
                    }
                }
            }
        }
    }
}
