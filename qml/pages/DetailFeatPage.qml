import QtQuick 2.0
import Sailfish.Silica 1.0

import FeatLib 1.0

Page {
    property Feat feat : null
    id: detailPage

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height
        Column {
            PageHeader {
                title: feat.name
                id: header
                anchors.left: parent.left
            }
            IconButton {
                icon.source: "fav.png"
                icon.highlighted: feat.isFav
                anchors.right: header.right

                function setFav() {
                    if(!feat.isFav) {
                        feat.isFav = 1
                        icon.highlighted = true
                        pathFinderApp.updateIsFavFeat(feat)
                        console.log("Ajouté aux favoris !")
                    }
                    else {
                        feat.isFav = 0
                        icon.highlighted = false
                        pathFinderApp.updateIsFavFeat(feat)
                        console.log("Retiré des favoris !")
                    }
                }
                onClicked: setFav()
            }
            id: column
            //anchors.top: header.bottom
            width: page.width

            Label {
                id: lblUnlock
                text: "Débloque : "
                width: parent.width
                wrapMode: "WordWrap"
            }
            Label {
                id: lblSrc
                text: "Source : " + feat.source
                width: parent.width
                wrapMode: "WordWrap"
            }
            Label {
                id: lblCat
                text: "Catégorie : " + feat.category
                width: parent.width
                wrapMode: "WordWrap"
            }
            Label {
                id: lblCdt
                text: "Conditions : " + feat.conditions
                width: parent.width
                wrapMode: "WordWrap"
            }
            Label {
                id: lblDesc
                text: "Description : " + feat.description
                width: parent.width
                wrapMode: "WordWrap"
            }
        }
    }
}
