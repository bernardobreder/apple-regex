//
//  Regex.swift
//  codegenv
//
//  Created by Bernardo Breder on 27/11/16.
//  Copyright © 2016 Code Generator Environment. All rights reserved.
//

import Foundation

open class Regex {
    
    public let pattern: String
    
    public let groupCount: Int
    
    public var regex: regex_t
    
    public let success: Bool
    
    public init(_ pattern: String, groupCount: Int) {
        self.pattern = pattern
        self.groupCount = groupCount
        self.regex = regex_t()
        let result = regcomp(&regex, pattern, REG_EXTENDED)
        success = result == 0
    }
    
    deinit {
        regfree(&regex)
    }
    
    public func matches(_ string: String) -> [String]? {
        guard success else { return nil }
        var matches = [regmatch_t](repeating: regmatch_t(), count: groupCount + 1)
        let result = regexec(&regex, string, groupCount + 1, &matches, 0)
        guard result == 0 else { return nil }
        var array: [String] = []
        for i in 0 ..< matches.count {
            let s = Int(matches[i].rm_so)
            let e = Int(matches[i].rm_eo)
            let utf8 = string.utf8
            if let startStringIndex = utf8.index(utf8.startIndex, offsetBy: s).samePosition(in: string), let endStringIndex = utf8.index(utf8.startIndex, offsetBy: e).samePosition(in: string) {
                array.append(string.substring(with: startStringIndex ..< endStringIndex))
            }
        }
        return array
    }
    
}
