//
//  Queue+Ex.swift
//  CoreExtension
//
//  Created by Lazyman on 12/19/22.
//

import Foundation

public func runInMain(execute work: @escaping @convention(block) () -> Swift.Void) {
    DispatchQueue.main.async {
        work()
    }
}
