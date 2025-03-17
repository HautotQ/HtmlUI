import XCTest
@testable import HtmlUI

final class HtmlUITests: XCTestCase {
    func testRender() {
        let html = HtmlUI().render()
        XCTAssertTrue(html.contains("<html>"))
        XCTAssertTrue(html.contains("</html>"))
    }
}
