import QtQuick 1.1

import qb.base 1.0
import qb.components 1.0

Widget {
	id: tscSettingsFrame

	property TscSettingsApp app

	function updateRotateTiles() {
		switch(globals.tsc["rotateTiles"]) {
			case 0: rotateTilesLabel.rightText = "Disabled"; break;
			case 1: rotateTilesLabel.rightText = "Mode 1"; break;
			case 2: rotateTilesLabel.rightText = "Mode 2"; break;
			case 3: rotateTilesLabel.rightText = "Mode 3"; break;
			default: rotateTilesLabel.rightText = "unknown"; break;
		}
	}

	function updateHideToonLogo() {
		switch(globals.tsc["hideToonLogo"]) {
			case 0: hideToonLogoLabel.rightText = "Disabled"; break;
			case 1: hideToonLogoLabel.rightText = "Only during dim"; break;
			case 2: hideToonLogoLabel.rightText = "Always"; break;
			default: hideToonLogoLabel.rightText = "unknown"; break;
		}
	}

        function updateCustomToonLogo() {
                switch(globals.tsc["customToonLogo"]) {
                        case 0: customToonLogoLabel.rightText = "Disabled"; break;
                        case 1: customToonLogoLabel.rightText = "Enabled"; break;
                        default: customToonLogoLabel.rightText = "unknown"; break;
                }
        }

	onShown: {
		updateRotateTiles();
		updateHideToonLogo();
                updateCustomToonLogo();
	}

	anchors.fill: parent

	Item {
		id: labelContainer
		anchors {
			top: parent.top
			topMargin: 25
			left: parent.left
			leftMargin: Math.round(44 * 1.28)
			right: parent.right
			rightMargin: Math.round(27 * 1.28)
		}

		SingleLabel {
			id: rotateTilesLabel
			anchors {
				left: parent.left
				right: rotateTilesButton.left
				rightMargin: 8
			}
			leftText: qsTr("Rotate tiles")
			rightText: ""

		}

		IconButton {
			id: rotateTilesButton

			width: 45
			height: rotateTilesLabel.height

			iconSource: "qrc:/images/edit.svg" 

			anchors {
				top: rotateTilesLabel.top
				right: parent.right
			}

			topClickMargin: 3
			onClicked: {
				stage.openFullscreen(app.rotateTilesScreenUrl);
			}
		}

		SingleLabel {
			id: hideToonLogoLabel
			anchors {
				top: rotateTilesLabel.bottom
				topMargin: Math.round(30 * 1.25)
				left: parent.left
				right: hideToonLogoButton.left
				rightMargin: 8
			}
			leftText: qsTr("Hide Toon logo")
			rightText: ""

		}

		IconButton {
			id: hideToonLogoButton

			width: 45
			height: hideToonLogoLabel.height

			iconSource: "qrc:/images/edit.svg" 

			anchors {
				top: hideToonLogoLabel.top
				right: parent.right
			}

			topClickMargin: 3
			onClicked: {
				stage.openFullscreen(app.hideToonLogoScreenUrl);
			}
		}

                SingleLabel {
                        id: customToonLogoLabel
                        anchors {
                                top: hideToonLogoButton.bottom
                                topMargin: Math.round(30 * 1.25)
                                left: parent.left
                                right: hideToonLogoButton.left
                                rightMargin: 8
                        }
                        leftText: qsTr("Custom Toon logo")
                        rightText: ""

                }

                IconButton {
                        id: customToonLogoButton

                        width: 45
                        height: customToonLogoLabel.height

                        iconSource: "qrc:/images/edit.svg"

                        anchors {
                                top: customToonLogoLabel.top
                                right: parent.right
                        }

                        topClickMargin: 3
                        onClicked: {
                                stage.openFullscreen(app.customToonLogoScreenUrl);
                        }
                }


		StandardButton {
			id: restartGuiButton

			text: qsTr("Restart GUI")

			height: 40 

			anchors {
				left: parent.left
				top: customToonLogoLabel.bottom
				topMargin: Math.round(30 * 1.25)
			}

			topClickMargin: 2
			onClicked: {
				Qt.quit();	
			}
		}


	}
}
