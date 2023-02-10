import QtQuick

Window {
	width: 640; height: 480
	visible: true
	title: "Model-View-Repeater"

	Row {
		anchors.fill: parent
		Column {
			padding: 6
			spacing: 4
			width: parent.width / 3
			Repeater {	//Repeater 会一次性创建所有 delegate, 造成性能损失
				anchors.fill: parent
				model: 10	//使用数量作为 model, 相当于创建空 Item 作为 model
				delegate: Rectangle {
					color: "#2be8c8"
					border.width: 1; border.color: Qt.lighter(color)
					width: parent.width - 2 * parent.padding; height: 32

					Text {
						text: model.index
						verticalAlignment: Text.AlignVCenter
						horizontalAlignment: Text.AlignHCenter
						anchors.fill: parent
						wrapMode: Text.WordWrap
					}
				}
			}
		}
		Column {
			padding: 6
			spacing: 4
			width: parent.width / 3
			Repeater {
				anchors.fill: parent
				model: ["Enterprise", "Columbia", "Challenger", "Discovery", "Endeavour", "Atlantis"]	//使用数组作为 model, 可从 modelData 获取信息
				delegate: Rectangle {
					color: "#12cc18"
					border.width: 1; border.color: Qt.lighter(color)
					width: parent.width - 2 * parent.padding; height: 32

					Text {
						text: modelData + " (" + model.index + ')'
						verticalAlignment: Text.AlignVCenter
						horizontalAlignment: Text.AlignHCenter
						anchors.fill: parent
						wrapMode: Text.WordWrap
					}
				}
			}
		}
		Column {
			padding: 6
			spacing: 4
			width: parent.width / 3
			Repeater {
				anchors.fill: parent
				model: ListModel {	//预置 model
					ListElement {text: "Mercury"; color: "gray"}
					ListElement {text: "Venus"; color: "yellow"}
					ListElement {text: "Earth"; color: "blue"}
					ListElement {text: "Mars"; color: "orange"}
					ListElement {text: "Saturn"; color: "yellow"}
					ListElement {text: "Uranus"; color: "lightblue"}
					ListElement {text: "Neptune"; color: "lightblue"}
				}
				delegate: Rectangle {
					color: "#1080ea"
					radius: 8
					border.width: 1; border.color: Qt.lighter(color)
					width: parent.width - 2 * parent.padding; height: 32

					Rectangle {
						color: model.color
						width: 16; height: 16
						radius: width / 2
						anchors.verticalCenter: parent.verticalCenter
						anchors.left: parent.left; anchors.leftMargin: 6
					}

					Text {
						text: model.text
						verticalAlignment: Text.AlignVCenter
						horizontalAlignment: Text.AlignHCenter
						anchors.fill: parent
						wrapMode: Text.WordWrap
					}
				}
			}
		}
	}
}
