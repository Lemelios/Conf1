import Quickshell 
import QtQuick
import Quickshell.Hyprland
import Quickshell.Wayland
import QtQuick.Layouts
import Quickshell.Services.UPower
import Quickshell.Services.Pipewire

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
				height : 10
				spacing: 15
				Text {
					property string capacity : Math.round((UPower.displayDevice.percentage ?? 0) * 100) + "%"
					text: (UPower.displayDevice.state === UPowerDeviceState.Charging ? "ᛪ " :  "ᛃ " ) + capacity	
					color: "purple"
				}
			
				Text {
					text: "ᛰ " + Math.round((Pipewire.defaultAudioSink?.audio?.volume ?? 0)* 100) 
					color: "purple"
				} PwObjectTracker { objects: [Pipewire.defaultAudioSink]}

				Text {
					text: "ᛠ " + Wifi.stat + (Wifi.stat == "connecté" ? " : " : " ")+Wifi.name
					color: "purple"
				}
			}

			RowLayout {
				id: middle
				anchors.centerIn : parent
				Text {
					text: "ᛤ " + Qt.formatDateTime(clock.date, "hh:mm")
					color: "purple"
				}

			}
			RowLayout {
				id: right 
				anchors {
					right : parent.right 
					verticalCenter : parent.verticalCenter
					rightMargin : 12
				}
			}
		}	
	}
	SystemClock {
			id: clock 
			precision: SystemClock.Minutes
	}
}

