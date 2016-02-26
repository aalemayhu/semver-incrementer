//
//  main.swift
//  semver-incrementer
//
//  Created by Alexander Alemayhu on 26/02/16.
//  Copyright © 2016 A. Alemayhu. All rights reserved.
//

import Foundation

func usage() {
    print("usage: origin-version $incrementBy")
    print("e.g. semver-incrementer 0.6.6 9")
}

func run() {
    let args = Process.arguments
    guard args.count > 2 else {
        usage()
        return
    }

    let originVersion = args[1]
    let incrementBy = args[2]

    guard let version = Semver.fromString(originVersion) else {
        print("error:\(originVersion):not a valid version")
        return
    }

    guard let by = Int(incrementBy) else {
        print("error:\(incrementBy) is not a valid increment value")
        return
    }
    print(version.increment(by).short)
}
run()