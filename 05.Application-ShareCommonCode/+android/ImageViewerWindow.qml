import QtQuick
import QtQuick.Controls as Controls
import ".." as App

Controls.ApplicationWindow {
	id: root
	width: 324; height: 576
	visible: true
	title: "Application-Mobile"
	background: Rectangle {color: "lightgray"}
	header: Controls.ToolBar {
		Controls.ToolButton {
			anchors.left: parent.left; anchors.verticalCenter: parent.verticalCenter
			icon.source: "../../images/icons/menu-144.png"
			onClicked: drawer.open()
		}

		Text {
			color: "#ffffff"
			text: "图片查看器"
			verticalAlignment: Text.AlignVCenter
			horizontalAlignment: Text.AlignHCenter
			font.pointSize: 14
			anchors.centerIn: parent
		}
	}

	Controls.Drawer {
		id: drawer
		width: Math.min(root.width, root.height) * 2 / 3; height: root.height

		ListView {
			id: theMenu
			anchors.fill: parent
			model: ListModel {
				ListElement {
					text: "打开..."
					trigger: function() {
						imageViewerCore.openFileDialog.open()
					}
				}

				ListElement {
					text: "关于"
					trigger: function() {
						imageViewerCore.aboutDial.open()
					}
				}
			}
			delegate: Controls.ItemDelegate {
				width: parent.width
				text: model.text
				onClicked: {
					drawer.close()
					model.trigger()
				}
			}
		}
	}

	App.CommonPart {
		id: imageViewerCore
		anchors.fill: parent
	}
}
