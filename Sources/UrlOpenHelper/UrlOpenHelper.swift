
import UIKit

protocol UrlOpenHelper: AnyObject {
    func canOpenUrl(_ url: URL) -> Bool
    func openUrl(_ url: URL)
    func openUrlIfPossible(_ rawUrlValue: String)
}

final private class UrlOpenHelperImpl {

    private func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(
        _ input: [String: Any]
    ) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
        return Dictionary(uniqueKeysWithValues: input
            .map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value) }
        )
    }
}

extension UrlOpenHelperImpl: UrlOpenHelper {
    
    /// Check if url can be opened
    /// - Parameter url: Foundation URL
    /// - Returns: If URL is openable
    func canOpenUrl(_ url: URL) -> Bool {
        UIApplication.shared.canOpenURL(url)
    }
    
    /// Open URL
    /// - Parameter url: Foundation URL
    func openUrl(_ url: URL) {
        UIApplication.shared.open(
            url,
            options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]),
            completionHandler: nil
        )
    }
    
    /// Create URL from RAW string if possible & can be opened
    /// - Parameter rawUrlValue: Raw string for create URL
    func openUrlIfPossible(_ rawUrlValue: String) {
        guard
            let url = URL(string: rawUrlValue),
            canOpenUrl(url) == true
        else {  return print("Can't convert raw string: \(rawUrlValue) to URL or open") }
        openUrl(url)
    }
}
