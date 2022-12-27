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
            spacing: 4

            Image { //用于显示静态图片
                id: simpleImage
                source: "../Picture.png"    //指定图片源
            }

            Image {
                source: "../Picture.png"
                fillMode: Image.Stretch //拉伸模式（默认）
                width: 200; height: 72
            }

            Image {
                source: "../Picture.png"
                fillMode: Image.PreserveAspectFit   //保留比例缩放（保留完整内容）
                width: 200; height: 72
            }

            Image {
                source: "../Picture.png"
                fillMode: Image.PreserveAspectCrop  //保留比例裁切
                width: 200; height: 72
            }

            Image {
                source: "../Picture.png"
                fillMode: Image.PreserveAspectCrop  //保留比例裁切
                width: 200
            }

            Image {
                source: "../Picture.png"
                fillMode: Image.Tile    //材质填充
                width: 288; height: 72
            }

        }
    }
}
