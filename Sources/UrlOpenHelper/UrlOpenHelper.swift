
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

    func canOpenUrl(_ url: URL) -> Bool {
        UIApplication.shared.canOpenURL(url)
    }

    func openUrl(_ url: URL) {
        UIApplication.shared.open(
            url,
            options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]),
            completionHandler: nil
        )
    }

    func openUrlIfPossible(_ rawUrlValue: String) {
        guard
            let url = URL(string: rawUrlValue),
            canOpenUrl(url) == true
        else {  return print("Can't convert raw string: \(rawUrlValue) to URL or open") }
        openUrl(url)
    }
}
