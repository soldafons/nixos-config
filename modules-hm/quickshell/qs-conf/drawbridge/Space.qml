import Quickshell
import Quickshell.Wayland
import QtQuick

ShellRoot {
  PanelWindow {
    anchors {
      right: true
    }
    implicitWidth: 7
    implicitHeight: screen.height - 14
    color: "#252a41"
    focusable: false
    mask: Region {}
  }
  PanelWindow {
    anchors {
      top: true
      left: true
      right: true
    }
    implicitHeight: 7
    color: "#252a41"
    focusable: false
    mask: Region {}
  }
  PanelWindow {
    anchors {
      bottom: true
      left: true
      right: true
    }
    implicitHeight: 7
    color: "#252a41"
    focusable: false
    mask: Region {}
  }
}




