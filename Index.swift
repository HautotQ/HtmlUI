import SwiftUI

struct Index: HTMLDocument {
    var title = "Tetris en html"
    var lang: String = "fr"
    
    var style: HTML {
        HTMLStyle {
            Body {
                "text-align: center;"
                "font-family: Menlo, sans-serif;"
                "background-color: #1e1e1e;"
                "color: white;"
            }
            .addClassName("canvas") {
                "background-color: black;"
                "border: 2px solid white;"
            }
            .addClassName("controls") {
                "margin-top: 20px;"
            }
            HTMLStyleButton {
                "font-size: 30px;"
                "margin: 10px;"
                "padding: 10px;"
                "cursor: pointer;"
            }
        }
    }
    
    var body: HTML {
        HTMLStack {
            HTMLImage(src: "https://raw.githubusercontent.com/HautotQ/Database_for_HtmlUI/refs/heads/main/IMG_2947.webp?token=GHSAT0AAAAAADAUQINXDYL6QSEAVXX2MSLKZ6YKQRQ")
            HTMLText("Hello World!")
        }
    }
    
    var script: HTML {
        HTMLScript {
            ""//Script JavaScript ici
        }
    }
}
