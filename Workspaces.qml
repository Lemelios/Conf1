import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root
    implicitWidth : row.implicitWidth + 22
    implicitHeight : 33
    radius : height / 2
	color: '#aaffd2'

    RowLayout {
        id: row
        anchors.centerIn : parent
        spacing : 8

        Repeater {
            model : ScriptModel {
                values : Hyprland.workspaces.values.filter(n => n.id > 0)
            }   

            Rectangle {
                implicitWidth : modelData.active ? 11 : 8
                implicitHeight : implicitWidth
                radius : width / 2
                color : modelData.active ? "transparent" : '#6d29e2'
                border.width : modelData.active ? 2 : 0  
                border.color : '#6d29e2'

                Behavior on implicitWidth {
                    NumberAnimation { duration : 150 ; easing.type : Easing.OutCubic}
                }
            }
        }
    }
}
