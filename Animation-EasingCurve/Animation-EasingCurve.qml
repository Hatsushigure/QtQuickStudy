//缓动曲线
import QtQuick
import "../Utils" as Utils

Window {
	width: 640; height: 480
	visible: true
	title: "Animation-EasingCurve"

	Rectangle {
		id: root
		anchors.fill: parent
		gradient: Gradient {
			GradientStop {position: 0.00; color: "#86ffd9"}
			GradientStop {position: 1.00; color: "#89e8f7"}
		}

		Utils.ClickableImage {
			id: linerImage
			anchors.horizontalCenter: parent.horizontalCenter
			source: "../images/EasingCurve/Liner.png"
			imageWidth: 100; imageHeight: 100
			showText: false
		}

		Grid {
			id: inGroup
		}
	}
}
