import QtQuick

Window {
	width: 640; height: 480
	visible: true
	title: "Animation-GettingStarted"

	Image {
		property int padding: 40
		property bool running: false

		id:root
		source: "../images/Colorful.png"
		anchors.fill:parent

		Image {
			id: thePic
			source: "../images/Picture.png"
			x: root.padding; y: (root.height - height) / 2

			//PropertyAnimation 适用于所有类型的目标值
			PropertyAnimation on x {	//可以用 on 指定目标, 也可以用 property 属性指定
				to: root.width - thePic.width - root.padding	//目标值, from 为起始值, 留空代表当前值
				duration: 3000	//时长, 以毫秒为单位
				running: root.running	//此属性指定动画是否在播放
			}

			PropertyAnimation on rotation {
				to: 360
				duration: 3000
				running: root.running
			}

			MouseArea {
				anchors.fill: parent
				onClicked: root.running = true
			}
		}

		PropertyAnimation on opacity {	//当动画不在目标对象内部时 on 无效, 需用 property 属性或换成 OpacityAnimator 等类型
			target: thePic	//指定目标
			property: "opacity"
			to: 0
			duration: 3000
			running: root.running
		}
	}
}
