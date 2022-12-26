import QtQuick

Window {
    width: 640; height: 480
    visible: true
    title: qsTr("BasicComponent-Image")

    Rectangle {
        id: root
        anchors.fill: parent


        Flow {
            anchors.fill: parent
//            columns: 3

            Image { //用于显示静态图片
                id: simpleImage
                source: "../Picture.png"
            }

            Image {
                id: stretchedImage
                source: "../Picture.png"
                fillMode: Image.Stretch //拉伸模式（默认）
                width: 288; height: 72
            }
        }
    }
}
