import QtQuick
import QtQuick.Window

Window {
	width: 800; height: 480
	visible: true
	title: "Model-View-GridView"

	GridView {
		id: view
		focus: true
		anchors.fill: parent
		cellWidth: 48; cellHeight: 48	//GridView 没有 spacing 属性, 且用这种方法指定单元格的大小
		//		flow: GridView.FlowTopToBottom	//指定排列方向是追平还是竖直
		model: 100
		delegate: Item {	//元素在单元格内左上对齐, 故再套一层 Item
			id: deleg
			width: view.cellWidth; height: view.cellHeight
			Rectangle {
				anchors.centerIn: parent
				radius: 8
				border.color: "black"
				color: "transparent"
				width: 40; height: 40
			}
			Text {
				anchors.centerIn: parent
				text: model.index
				font.pointSize: 10
				//				color: "white"
				color: "black"
			}
		}
		highlight: Component {
			Item {	//元素在单元格内左上对齐, 故再套一层 Item
				width: view.cellWidth; height: view.cellHeight
				Rectangle {
					anchors.centerIn: parent
					radius: 8
					color: "#49f1e6"
					width: 40; height: 40
				}
			}
		}
	}
}
