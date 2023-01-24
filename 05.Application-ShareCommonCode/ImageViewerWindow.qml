import QtQuick
import QtQuick.Controls as Controls
import "." as App

Controls.ApplicationWindow {
	id: root
	width: 800; height: 480
	visible: true
	background: Rectangle {color: "lightgray"}
	header: Controls.ToolBar {
		Controls.ToolButton {
			icon.source: "../images/icons/opened-folder.png"
			onClicked: imageViewerCore.openFileDialog.open()
		}
	}
	menuBar: Controls.MenuBar {
		Controls.Menu {
			title: "文件(&F)"

			Controls.MenuItem {
				text: "打开(&O)"
				onTriggered: imageViewerCore.openFileDialog.open()
			}

			Controls.MenuItem {
				text: "退出(&E)"
				onTriggered: root.close()
			}
		}

		Controls.Menu {
			title: "帮助(&H)"

			Controls.MenuItem {
				text: "关于(&A)"
				onTriggered: imageViewerCore.aboutDial.open()
			}
		}
	}

	App.CommonPart {
		id: imageViewerCore
		anchors.fill: parent
	}
}
