pragma Singleton
import Quickshell
import QtQuick

Singleton {
    id: root
    readonly property string time: "ᛤ " + Qt.formatDateTime(clock.date, "hh:mm")

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }
}