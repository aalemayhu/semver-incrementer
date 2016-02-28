//
//  main.swift
//  semver-incrementer
//
//  Created by Alexander Alemayhu on 26/02/16.
//  Copyright © 2016 A. Alemayhu. All rights reserved.
//

import Foundation

let app = SemverIncrementer()
let args = Process.arguments
app.run(args)
