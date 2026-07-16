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
		}
		implicitWidth: 200 
	      	implicitHeight: 30
		color: "transparent"; 
		Rectangle {
			anchors.fill: parent
			radius: 20;		
			color: "#3FAB30";
      			ClockWidget {
        			anchors.centerIn: parent
			}
		}
    	}
  }
}

