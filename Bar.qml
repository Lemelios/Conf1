import Quickshell 
import QtQuick
import Quickshell.Wayland
import QtQuick.Layouts

Scope {
  Variants {
    model: Quickshell.screens

		PanelWindow {
			required property var modelData
			screen: modelData
			implicitHeight: 30
			color: "#baffaa"
      	anchors {
			  	top: true
					right: true 
					left: true 
			}

			RowLayout {
				id: items
				anchors.centerIn: parent
				height : 10
				spacing: 25
				ClockWidget{
					color: "purple"
				}
				BatWdg{
					color: "purple"
				}
			
				Text {
					text: Wifi.stat + " " + Wifi.name
					color: "purple"
				}
			}
		}
  }
}

