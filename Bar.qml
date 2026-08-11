import Quickshell 
import QtQuick
import Quickshell.Wayland

Scope {
  Variants {
    model: Quickshell.screens

	PanelWindow {
		required property var modelData
		screen: modelData

      		anchors {
	        	top: true
			right: true 
			left: true 
		}
	  implicitHeight: 30
		color: "green"
		Rectangle {
			id: clock
			color: "purple" 
			anchors.centerIn: parent
			implicitWidth: 200
			radius: 20;		
      			ClockWidget {
        			anchors.centerIn: parent
			}
		}
		Rectangle {
			id: battery
			color: "purple"
			anchors.verticalCenter: parent.verticalCenter
			anchors.left: clock.right
			implicitWidth:50
			radius: 20
			BatWdg {
				anchors.centerIn: parent
			}
		}
  }
  }
}

