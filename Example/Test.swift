import SwiftUI

struct Test: HTMLDocument {
    var title = "Test"
    var lang: String = "fr"
    
    var style: HTML {
        HTMLStyle { 
            Body { 
                ""
            }
        }
    }
    
    var body: HTML {
        HTMLStack {
            HTMLText("Bienvenue sur Test")
            HTMLNav(destination: Index()) {
                HTMLText("Retour à Index")
            }
        }
    }
    var script: HTML {
        HTMLScript {
            ""
        }
    }
}
