import QtQuick
import QtQuick.Controls

ApplicationWindow {
	id: root
	width: 640; height: 480
	visible: true
	menuBar: MenuBar {
		Menu {
			title: "文件(&F)"

			MenuItem {
				text: "新建(&N)"
				onTriggered: root.createNewWindow()
			}

			MenuItem {
				text: "打开(&O)"
			}

			MenuItem {
				text: "保存(&S)"
			}

			MenuItem {
				text: "另存为(&A)"
			}

			MenuSeparator {}

			MenuItem {
				text: "关闭窗口(&C)"
				onTriggered: root.close()
			}
		}
	}

	function createNewWindow() {
		var tmp = Qt.createComponent("DocumentWindow.qml");
		tmp.createObject();
		return tmp
	}
}
