import QtQuick

Item {
	property alias duration: theAnima.duration
	property alias easingType: theAnima.easing.type

	id: root
	function toggle() {
		if (state === "left")
			state = "right"
		else state = "left"
	}

	state: "left"
	states: [
		State {
			name: "left"
			PropertyChanges {
				target: movingSquare
				x: width
			}
		},
		State {
			name: "right"
			PropertyChanges {
				target: movingSquare
				x: parent.width - width * 2
			}
		}
	]
	transitions: [
		Transition {
		from: "left"; to: "right"
		PropertyAnimation {id: theAnima; target: movingSquare; property: "x"}
	},
		Transition {
		from: "right"; to: "left"
		PropertyAnimation {target: movingSquare; property: "x"; duration: theAnima.duration; easing.type: theAnima.easing.type}
	}
	]
	Rectangle {
		id: container
		anchors.fill: parent
		color: "transparent"

		Rectangle {
			id: movingSquare
			height: root.height; width: height
			color: "#436ee4"
		}
	}
}
