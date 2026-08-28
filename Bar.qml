import Quickshell 
import QtQuick
import Quickshell.Hyprland
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
				id: left
				anchors {
					left : parent.left 
					verticalCenter : parent.verticalCenter
					leftMargin : 12
				}
				spacing: 15
				
				BatWdg {}
				AudioWdg {}
				WifiWdg {}
			}

			RowLayout {
				id: middle
				anchors.centerIn : parent
				spacing: 15
				Clock{}
			}
			RowLayout {
				id: right 
				anchors {
					right : parent.right 
					verticalCenter : parent.verticalCenter
					rightMargin : 12
				}
				spacing: 15
			}
		}	
	}
}

