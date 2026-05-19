import Quickshell
import Quickshell.Wayland
import QtQuick
import Quickshell.Io

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
        topMargin: 7
      }
      font {
        family: "_0xproto"
        pixelSize: 16
      }
      color: "#5e6587"
      text: Qt.formatDateTime(clock.date, "hh\nmm")
      horizontalAlignment: Text.AlignHCenter
    }

    /* FileView {
      id: ram
      path: "/proc/meminfo"
    }

    Timer {
        interval: 5000
        running: true
        repeat: true
        onTriggered: {
          ram.reload()
          const contents = ram.text()
          const total = parseInt(contents.match(/MemTotal:\s+(\d+)/)[1])
          const avail = parseInt(contents.match(/MemAvailable:\s+(\d+)/)[1])
          someText.usedgb = (total - avail) / 1048576
        }
    }

      Text {
        anchors {
          horizontalCenter: parent.horizontalCenter
        }
        font {
            family: "_0xproto"
            pixelSize: 16
        }
        color: "#5e5687"
        property real usedgb: 0
        text: usedgb.toFixed(2)
      } */
  }

  Warp {}
  Space {}
}

