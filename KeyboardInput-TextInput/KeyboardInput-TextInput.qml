import QtQuick

Window {
    width: 640; height: 480
    visible: true
    title: "KeyboardInput-TextInput"

    Rectangle {
        anchors.fill: parent

        TextInput {
            id: simpleTextInput
            width: parent.width
            height: 30
            color: "red"
        }
    }
}
