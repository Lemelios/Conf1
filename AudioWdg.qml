import Quickshell
import Quickshell.Services.Pipewire
import QtQuick.Layouts
import QtQuick

Text {
    property var speaker: Pipewire.defaultAudioSink?.audio;
    property var level: Math.round((speaker?.volume ?? 0) * 100)
    property var mute: speaker?.muted;
    readonly property string icon : {
      if (mute) return String.fromCodePoint("0xeee8")
      let icon = level >= 66 ? "0xf028"
                : level >= 33 ? "0xf027"
                : "0xf026"
      return String.fromCodePoint(icon)
    }
    text: icon + "  " + level
    color: "purple";
    font {
      family:"Terminess Nerd Font Proto"
      pixelSize : 15
		}	 
    PwObjectTracker { objects: [Pipewire.defaultAudioSink]}
}


