import Quickshell
import Quickshell.Wayland
import QtQuick

PanelWindow {
  anchors {
    top: true
    bottom: true
    left: true
    right: true
  }
  color: "transparent"
  focusable: false
  mask: Region {}
  exclusionMode: ExclusionMode.Ignore
  Rectangle {
    color: "transparent"
    anchors {
      fill: parent
      leftMargin: 31
      rightMargin: 0
      topMargin: 0
      bottomMargin: 0
    }
    border {
      color: "#252a41"
      width: 7
    }
    topLeftRadius: 20
    bottomLeftRadius: 20
    topRightRadius: 20
    bottomRightRadius: 20
    antialiasing: true
  }
}

