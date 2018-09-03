

import UIKit

class BundleUtil {
    
    static func getCurrentBundle() -> Bundle{
        let podBundle = Bundle(for: CLLib.self)
        let bundleURL = podBundle.url(forResource: "CLLib", withExtension: "bundle")
        if bundleURL != nil {
            let bundle = Bundle(url: bundleURL!)!
            return bundle
        }else{
            return Bundle.main
        }
    }

}
