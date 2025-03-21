# HtmlUI

HtmlUI est une librairie Swift permettant de générer du HTML via Swift. Vous pouvez trouver le dépôt sur GitHub [(HtmlUI)](https://github.com/HautotQ/HtmlUI)

## Installation

Ajoutez cette librairie via Package.swift :

```swift
dependencies: [
    .package(url: "https://github.com/HautotQ/HtmlUI.git", from: "1.0.0")
]
```

Ou bien, utilisez l'URL dans "Ajouter un paquet" comme ceci:

```plain text
https://github.com/HautotQ/HtmlUI.git
```

## Utilisation

Pour commencer, assurez-vous d'avoir importé le framework correctement:

```swift
import HtmlUI
```

Par la suite, vous devez savoir que pour construire un fichier html(sous forme de structure SwiftUI), il faut que votre structure SwiftUI obéisse au protocole `HTMLDocument`. C'est à dire, il faut qu'il contienne ces variables:
```swift
var title: String
var lang: String
var style: HTML
var body: HTML
var script: HTML
```
(Vous aurez facilement reconnu les principales données variables d'un fichier html original)

### Décripter les requirements d'`HTMLDocument` (recommandé si vous ne connaissez pas trop l'écosystème html)

À présent, nous allons expliquer les utilisations des variables dites précédemment

`title` indique le nom de la page. Il peut différer du nom de la structure, mais je vous recommande de mettre le même afin de ne pas vous embrouiller.
> var title: String = "Index"
`lang` indique à l'utilisateur qui lira le contenu de la page html brute(= non graphique) dans quelle langue vous avez écrit le fichier. Utilisez le raccourci(fr = français, en = anglais,...)
> var lang: String = "fr"
`style` définit le style CSS de votre fichier. Par défaut, un fichier html sans style n'est pas très attractif, alors utilisez-le, surtout pour des projets sérieux.
```swift
var style: HTML {
        HTMLStyle {
            Body {
                "font-family: Menlo;"
            }
            .addClassName("title") {
                "font-size: 30px;"
            }
            .addClassName("header") {
                "font-family: Arial, sans-serif;"
            }
        }
    }
```
`body` est le corps principal de votre fichier. C'est surtout là que se situera le contenu et l'aperçu de votre fichier.
```swift
var body: HTML {
        HTMLStack {
            HTMLDiv(className: "title") {
                HTMLText(title)
            }
            HTMLDiv(className: "header") {
                HTMLText("Yipeeeee !")
            }
            HTMLImage(src: "https://raw.githubusercontent.com/HautotQ/Database_for_HtmlUI/refs/heads/main/IMG_2947.webp?token=GHSAT0AAAAAADAUQINX6PGUQRX53CIJJXMOZ65BYIA")
            HTMLNav(destination: Test()) {
                HTMLText("Aller à Test")
            }
        }
    }
```
Pour finir, `script` est la variable qui va acueillir toutes vos fonctions JavaScript.
```swift
var script: HTML {
        HTMLScript {
            """
               function print(message) {
                  console.log(message)
               }
            """
        }
    }
```
P.S.: je ne suis pas doué en JavaScript, donc si j'ai fait une erreur, n'hésitez pas à me le faire parvenir ;)

## Exemple
Voici une première application pour vous montrer une idée de ce qu'est capable le framework.
```swift
import SwiftUI
import HtmlUI
import WebKit

struct ContentView: View {
    @State private var currentURL: URL?
    @State private var isError: Bool = false
    
    var body: some View {
        VStack {
            if isError {
                VStack {
                    Text("Impossible de charger la page")
                        .foregroundColor(.red)
                }
            } else if let currentURL = currentURL {
                WebView(url: currentURL)
                    .edgesIgnoringSafeArea(.all)
                ShareLink(item: currentURL)
            } else {
                Text("Génération en cours...")
                    .onAppear {
                        generateHTMLFiles()
                    }
            }
        }
        .onAppear {
            generateHTMLFiles()
        }
    }
    
    func generateHTMLFiles() {
        let fileManager = FileManager.default
        if let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            do {
                let indexPath = documentsDirectory.appendingPathComponent("index.html")
                let testPath = documentsDirectory.appendingPathComponent("test.html")
                
                try Index().render().write(to: indexPath, atomically: true, encoding: .utf8)
                try Test().render().write(to: testPath, atomically: true, encoding: .utf8)
                
                DispatchQueue.main.async {
                    self.currentURL = indexPath
                }
                
                print("Fichier HTML généré: \(indexPath.path)")
            } catch {
                print("Erreur de génération des fichiers HTML : \(error.localizedDescription)")
                isError = true
            }
        }
    }
}

struct WebView: UIViewRepresentable {
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    public func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.configuration.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs")
        return webView
    }
    
    public func updateUIView(_ webView: WKWebView, context: Context) {
        webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
    }
}
struct Index: HTMLDocument {
    var title: String = "Index"
    var lang: String = "fr"
    
    var style: HTML {
        HTMLStyle {
            Body {
                "font-family: Menlo;"
            }
            .addClassName("title") {
                "font-size: 30px;"
            }
            .addClassName("header") {
                "font-family: Arial, sans-serif;"
            }
        }
    }
    
    var body: HTML {
        HTMLStack {
            HTMLDiv(className: "title") {
                HTMLText(title)
            }
            HTMLDiv(className: "header") {
                HTMLText("Hello World !")
            }
            HTMLImage(src: "https://raw.githubusercontent.com/HautotQ/Database_for_HtmlUI/refs/heads/main/IMG_2947.webp?token=GHSAT0AAAAAADAUQINX6PGUQRX53CIJJXMOZ65BYIA")
            HTMLNav(destination: Test()) {
                HTMLText("Aller à Test")
            }
        }
    }
    
    var script: HTML {
        HTMLScript {
            ""
        }
    }
}
struct Test: HTMLDocument {
    var title: String = "Test"
    var lang: String = "fr"
    
    var style: HTML {
        HTMLStyle {
            Body {
                "font-family: Futura;"
            }
            .addClassName("return") {
                "font-size: 10px;"
            }
        }
    }
    
    var body: HTML {
        HTMLStack {
            HTMLText("Ceci est une page secondaire, pour l'exemple")
            HTMLDiv(className: "return") {
                HTMLNav(destination: Index()) {
                    HTMLText("Retour à Index")
                }
            }
        }
    }
    
    var script: HTML {
        HTMLScript {
            ""
        }
    }
}
```
**J'èspère que ce didacticiel vous aura été utile!**
## Info !
HtmlUI est un projet en cours de construction, donc **Actuellement toute les balises html ne sont pas encore implémentées!**
