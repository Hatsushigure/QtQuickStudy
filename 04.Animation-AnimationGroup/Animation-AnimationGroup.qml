import QtQuick
import "../Utils" as Utils

Window {
	width: 640; height: 480
	visible: true
	title: "Animation-AnimationGroup"

	Rectangle {
		id: root
		anchors.fill: parent

		Utils.ClickableImage {	//顺序动画, 按顺序一个个播放
			id: img1
			text: "SequentialAnimation"
			source: "../images/Picture.png"
			x: 20; y: root.height - height - 20
			onClicked: anima1.start()

			SequentialAnimation {
				id: anima1
				PropertyAnimation {target: img1; property: "x"; duration: 500; easing.type: Easing.OutBack; to: root.width - img1.width - 20}
				PropertyAnimation {target: img1; property: "y"; duration: 500; easing.type: Easing.OutBack; to: 20}
			}
		}
	}

	Utils.ClickableImage {	//并行动画, 同时播放
		id: img2
		text: "ParallelAnimation"
		source: "../images/Picture.png"
		x: root.width - img2.width - 20; y: root.height - height - 20
		onClicked: anima2.start()

		ParallelAnimation {
			id: anima2
			PropertyAnimation {target: img2; property: "x"; duration: 500; easing.type: Easing.OutExpo; to: 20}
			PropertyAnimation {target: img2; property: "y"; duration: 500; easing.type: Easing.OutExpo; to: 20}
		}
	}
}
