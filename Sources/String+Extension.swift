import Foundation

extension String {
    func trim() -> String {
        let characterSet = NSCharacterSet.whitespaceAndNewlineCharacterSet()
        return self.stringByTrimmingCharactersInSet(characterSet)
    }
}
