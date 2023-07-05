//
// Copyright 2023 New Vector Ltd
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Foundation

struct MapTilerStyleBuilder: MapTilerStyleBuilderProtocol {
    private let lightURL: URL
    private let darkURL: URL
    private let key: String
    
    init(lightURL: URL, darkURL: URL, key: String) {
        self.lightURL = lightURL
        self.darkURL = darkURL
        self.key = key
    }
    
    func dynamicMapURL(for style: MapTilerStyle) -> URL? {
        var url: URL
        switch style {
        case .light:
            url = lightURL
        case .dark:
            url = darkURL
        }
        
        url.appendPathComponent("style.json", conformingTo: .json)
        let authorization = MapTilerAuthorization(key: key)
        return authorization.authorizeURL(url)
    }
}
