//
//  Semver.swift
//  semver-incrementer
//
//  Created by Alexander Alemayhu on 26/02/16.
//  Copyright © 2016 A. Alemayhu. All rights reserved.
//

struct Semver {
    var major: Int
    var minor: Int
    var patch: Int


    var description: String {
        return "The current version is \(major).\(minor).\(patch)"
    }

    mutating func increment(by: Int = 1) {
        var i = 0
        repeat {
            i += 1
            if patch < 9 {
                self.patch += 1
            } else {
                if minor < 9 {
                    self.minor += 1
                    self.patch = 0
                } else {
                    self.major += 1
                    self.minor = 0
                }
            }
        } while i < by
    }

    static func fromString(str: String) -> Semver? {
        let splitted = str.characters.split { $0 == "."}.map(String.init)
        if splitted.count > 2 {
            guard let ma = Int(splitted[0]),
                let mi = Int(splitted[1]),
                let pa = Int(splitted[2]) else {
                    return nil
            }
            return Semver(major: ma, minor: mi, patch: pa)
        }
        return nil
    }
}