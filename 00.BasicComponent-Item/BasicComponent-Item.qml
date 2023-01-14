import QtQuick

Window {
    width: 640; height: 480
    visible: true
    title: "BasicComponent-Item"

    Flow {
        anchors.fill: parent

        MyImageTextItem {
            width: 120; height: 130
            text: "A simple item"
        }

        MyImageTextItem {
            width: 120; height: 130
            text: "A rotated one"
            rotation: 45
        }

        MyImageTextItem {
            width: 120; height: 130
            text: "A scaled item"
            scale: 1.5  //使用 Scale 会将 Item 按位图方式缩放，不影响本身的大小，只改变显示的大小。文本也会缩放
        }

        MyImageTextItem {
            width: 120 * 1.5; height: 130 * 1.5 //使用改变宽高的方式则不改变文本大小
            text: "A scaled item(Not True)"
        }


        Rectangle { //未裁剪
            width: 200; height: 112
            radius: 20
            clip: false //是否裁剪超出边界的部分(默认为 False，不切圆角)

            Image {
                x: -50; y: -30
                source: "../images/Colorful.png"
            }
        }

        Rectangle { //裁剪
            width: 200; height: 112
            radius: 20
            clip: true

            Image {
                x: -50; y: -30
                source: "../images/Colorful.png"
            }
        }
    }

}
