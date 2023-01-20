import QtQuick
import QtQuick.Controls as Controls
import QtQuick.Dialogs as Dialogs

Controls.ApplicationWindow {
	id: root
	width: 324; height: 576
	visible: true
	title: "Application-Mobile"
	background: Rectangle {color: "lightgray"}
	header: Controls.ToolBar {
		Controls.ToolButton {
			anchors.left: parent.left; anchors.verticalCenter: parent.verticalCenter
			icon.source: "images/icons/menu-144.png"
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

	Controls.Drawer {	//在移动平台上使用 Drawer 而非 Menu
		id: drawer
		width: Math.min(root.width, root.height) * 2 / 3; height: root.height

		ListView {
			id: theMenu
			anchors.fill: parent
			model: ListModel {
				ListElement {
					text: "打开..."
					trigger: function() {
						openDialog.open()
					}
				}

				ListElement {
					text: "关于"
					trigger: function() {
						aboutDial.open()
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

	Image {
		id: theImage
		anchors.fill: parent
		asynchronous: true	//异步加载，不会阻塞主线程
		fillMode: Image.PreserveAspectFit
	}

	Controls.Dialog {
		id: aboutDial
		title: "关于"
		standardButtons: Controls.Dialog.Ok
		modal: true
		anchors.centerIn: parent

		Text {
			anchors.fill: parent
			wrapMode: Text.WordWrap
			text: "Copyright(c) 2023 Hatsushigure, all rights reserved."
		}
	}

	Dialogs.FileDialog {
		id: openDialog
		nameFilters: ["图片文件(*.png *.jpg *.bmp)", "所有文件(*)"]
		onAccepted: theImage.source = openDialog.currentFile
	}
}
