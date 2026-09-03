import Quickshell
import QtQuick
import QtQuick.Layouts

RowLayout {
    property var icon 
    property var data
    Text {
        id : iconSec 
        text: icon 
        font {
            family: "Material Symbols Rounded"
            pixelSize: 18
        }
    }
    Text {
        id: dataSec
        text: data
        font {
            family: "Terminess Nerd Font Proto"
            pixelSize: 14
        }
    }
}