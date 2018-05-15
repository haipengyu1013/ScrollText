import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.VirtualKeyboard 2.1

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    id: root

    Rectangle {
        id: rec
        width: 100
        height: 80
        color: "red"
        clip: true

        Text {
            id: test
            text: "ScrolltoScrolltoScroll"
            color: "black"
        }

        Text {
            id: testmirror
            x: -test.contentWidth
            text: test.text
            color: "black"
            visible: test.contentWidth > rec.width
        }

        XAnimator {
            id: animatorX
            target: test
            from: 0
            to: -test.contentWidth
            running: test.contentWidth > rec.width
            loops: Animator.Infinite
            duration: 3000
        }

        XAnimator {
            target: testmirror
            from: test.contentWidth
            to: test.contentWidth - test.contentWidth
            running: test.contentWidth > rec.width
            loops: Animator.Infinite
            duration: animatorX.duration
        }
    }
}
