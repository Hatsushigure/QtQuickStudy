import QtQuick
import QtQuick.Controls.Material as Controls
import "." as App

Controls.ApplicationWindow {
	width: 324; height: 576
	visible: true
	title: "嵌套页面"
	header: Controls.ToolBar {
		Controls.ToolButton {
			id: menuBtn
			anchors.left: parent.left
			icon.source: "../images/icons/menu-144.png"
			onClicked: {
				if (stackView.depth > 1) {
					stackView.pop()
				}
				else drawer.open()
			}
		}

		Text {
			color: "#ffffff"
			anchors.centerIn: parent
			text: stackView.currentItem.title
			font.bold: true
			font.pointSize: 14
			verticalAlignment: Text.AlignVCenter
			horizontalAlignment: Text.AlignHCenter
		}
	}

	Controls.Drawer {
		id: drawer
		width: parent.width * 2 / 3
		height: parent.height

		ListView {
			anchors.fill: parent
			delegate: Controls.ItemDelegate {
				text: model.text
				width: parent.width
				onClicked: {
					drawer.close()
					model.trigger()
				}
			}
			model: ListModel {
				ListElement {
					text: "主页"
					trigger: function() {
						stackView.push(Qt.createComponent("./HomePage.qml", stackView))
					}
				}

				ListElement {
					text: "设置"
					trigger: function() {
						stackView.push(Qt.createComponent("./SettingsPage.qml", stackView))
					}
				}
			}
		}
	}

	Controls.StackView {
		id: stackView
		anchors.fill: parent
		initialItem: homePage	//指定使用什么控件作为初始界面
		onDepthChanged: {
			if (depth > 1) {
				menuBtn.icon.source = "../images/icons/left-144.png"
			}
			else menuBtn.icon.source = "../images/icons/menu-144.png"
		}

		App.HomePage {id: homePage}
	}
}
