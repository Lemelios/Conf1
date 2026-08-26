import Quickshell 
import QtQuick
import Quickshell.Wayland
import QtQuick.Layouts
import Quickshell.Services.UPower

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
					text: UPower.displayDevice.ready ? "bat : " + UPower.displayDevice.percentage * 100 + "%" : "problème !"
					color: "purple"
				}
			
				Text {
					text: ""
					color: "purple"
				}
				Text {
					text: Wifi.stat + " " + Wifi.name
					color: "purple"
				}
			}

			RowLayout {
				id: middle
				anchors.centerIn : parent
				Text {
					text: Qt.formatDateTime(clock.date, "hh:mm")
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

