import QtQuick

Window {
    width: 640; height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: root
        anchors.fill: parent

        Text {  //文本
            id: helloText
            anchors.horizontalCenter: root.horizontalCenter
            text: "Hello World" //文本属性，指定显示的文本
        }

        Text {  //自动换行
            id: wrappedText
            anchors.top: helloText.bottom; anchors.horizontalCenter: root.horizontalCenter; anchors.topMargin: 4
            width: root.width
            color: "#36e414"
            text: "This line of text is too long and needs wrapping!"
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 14
            wrapMode: /*Text.WrapAnywhere*//*Text.Wrap*/Text.WordWrap   //换行属性分别为任意位置换行、自动判断和单词间换行
        }

        Text {  //省略（当内容过长时会变成省略号
            id: elidedText
            width: root.width
            color: "#0edbee"
            anchors.top: wrappedText.bottom; anchors.horizontalCenter: root.horizontalCenter; anchors.topMargin: 4
            text: "This text is also too long and needs eliding!"
            font.family: "Times New Roman"
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 14
            elide: /*Text.ElideLeft*//*Text.ElideMiddle*/Text.ElideRight    //左、中、右省略
        }
    }
}
