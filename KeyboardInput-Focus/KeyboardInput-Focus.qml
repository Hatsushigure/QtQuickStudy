import QtQuick

Window {
	width: 640; height: 480
	visible: true
	title: "KeyboardInput-Focus"

	Rectangle {
		anchors.fill: parent

		MyFocusIndecator {
			id: item1
			width: 80; height: 80
			focus: true
			KeyNavigation.tab: item2	//使用 KeyNavigation 进行快速焦点切换

			Keys.onPressed: (event)=>{	//也可以使用键盘事件切换焦点
								switch (event.key) {
									case Qt.Key_Right:
									focus = false;
									item2.focus = true;
									break;
								}
							}
		}

		MyFocusIndecator {
			id: item2
			x: item1.x + item1.width + 8
			width: 80; height: 80
			focus: !item1.focus
			KeyNavigation.tab: item1
		}
	}
}
