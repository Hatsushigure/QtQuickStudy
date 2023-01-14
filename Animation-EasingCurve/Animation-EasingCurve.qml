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
			columns: 5; rows: 2
			anchors.top: linerImage.bottom; anchors.horizontalCenter: parent.horizontalCenter

			ClickableEasingType {
				prefix: "In"; generalType: "Quad"
			}

			ClickableEasingType {
				prefix: "In"; generalType: "Cubic"
			}

			ClickableEasingType {
				prefix: "In"; generalType: "Quart"
			}

			ClickableEasingType {
				prefix: "In"; generalType: "Quint"
			}

			ClickableEasingType {
				prefix: "In"; generalType: "Sine"
			}

			ClickableEasingType {
				prefix: "In"; generalType: "Expo"
			}

			ClickableEasingType {
				prefix: "In"; generalType: "Circ"
			}

			ClickableEasingType {
				prefix: "In"; generalType: "Elastic"
			}

			ClickableEasingType {
				prefix: "In"; generalType: "Back"
			}

			ClickableEasingType {
				prefix: "In"; generalType: "Bounce"
			}
		}
	}
}
