import Quickshell
import QtQuick
import QtQuick.Layouts

Rectangle {
	id: root 

	property string icon 
	property string value 
	property var iconColor: "purple" 
	property int maxLabelWidth : 400

	implicitWidth: row.implicitWidth + 22
	implicitHeight: 33

	radius: height / 2;
	color: '#aaffd2'

	RowLayout {
		id : row 
		anchors.centerIn: parent
		spacing: 10 

		Text {
			id : iconSec 
			text: root.icon 
				color: root.iconColor 
			font {
				family: "Terminess Nerd Font Proto"
				pixelSize: 18
			}
		}
		Text {
			id: dataSec
			text: root.value
			color: "purple" 
			font {
				family: "Terminess Nerd Font Proto"
				pixelSize: 14
			}
			elide: Text.ElideRight 
			Layout.maximumWidth: root.maxLabelWidth 
			visible: root.value !== "" 
		}
	}

}


