import SwiftUI
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
                
                print("Fichiers HTML générés : \(indexPath.path), \(testPath.path)")
            } catch {
                print("Erreur de génération des fichiers HTML : \(error.localizedDescription)")
                isError = true
            }
        }
    }
}

// Preview SwiftUI
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
