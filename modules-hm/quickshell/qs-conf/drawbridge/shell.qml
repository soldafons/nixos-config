import Quickshell
import Quickshell.Wayland
import QtQuick

ShellRoot {
  PanelWindow {
    anchors {
      left: true
    }
    implicitWidth: 36
    implicitHeight: screen.height - 14
    color: "#252a41"

    SystemClock {
      id: clock
      precision: SystemClock.Seconds
    }

    Text {
      anchors {
        horizontalCenter: parent.horizontalCenter
        top: parent.top
        topMargin: 20
      }
      font {
        family: "_0xproto"
        pixelSize: 16
      }
      color: "#5e6587"
      text: Qt.formatDateTime(clock.date, "hh\nmm")
      horizontalAlignment: Text.AlignHCenter
    }
  }

  Warp {}
  Space {}
}

