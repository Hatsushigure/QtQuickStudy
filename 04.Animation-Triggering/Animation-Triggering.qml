//触发动画
import QtQuick
import "../Utils" as Utils

Window {
	id: root
	width: 640; height: 480
	visible: true
	title: "Animation-Triggering"

	Utils.ClickableImage {
		id: img1
		x: 40; y: root.height - height
		source: "../Picture.png"
		text: "animation on property"

		PropertyAnimation on y {	//使用 on 的动画会在元素创建完成后自动播放
			to: 40
			duration: 3000
		}
	}

	Utils.ClickableImage {
		id: img2
		x: img1.x + 20 + width; y: root.height - height
		source: "../Picture.png"
		text: "animation on behavior"

		Behavior on y {	// Behavior 中的动画会随目标值的改变而触发
			PropertyAnimation {duration: 3000}
		}

		onClicked: y = 40
	}

	Utils.ClickableImage {
		id: img3
		x: img2.x + 20 + width; y: root.height - height
		source: "../Picture.png"
		text: "animation triggered manually"

		PropertyAnimation {
			id: anima1
			property: "y"
			target: img3
			to: 40
			duration: 3000
		}

		onClicked: anima1.start()	//使用 start() 方法可以直接播放
	}

	Utils.ClickableImage {
		id: img4
		x: img3.x + 20 + width; y: root.height - height
		source: "../Picture.png"
		text: "animation associated with state"

		states: State {
			name: "pressed"
			when: mouseArea2.pressed
			PropertyChanges {
				target: img4
				y: 40
			}
		}

		transitions: Transition {
			reversible: true
			from: ""
			to: "pressed"
			PropertyAnimation {duration: 3000; target: img4; property: "y"}
		}

		MouseArea {
			id: mouseArea2
			anchors.fill: parent
		}
	}

	MouseArea {
		id: mouseArea
		z: -5
		anchors.fill: parent
	}

	PropertyAnimation {
		id: anima2
		property: "y"
		target: img3
		to: 40
		duration: 3000
		running: mouseArea.pressed	//也可以修改 running 属性来控制播放
	}

}
