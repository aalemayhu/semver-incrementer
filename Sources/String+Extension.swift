import Foundation

extension String {
    func trim() -> String {
        
        let characterSet = NSCharacterSet.whitespacesAndNewlines()
        return self.trimmingCharacters(in: characterSet)
    }
}
