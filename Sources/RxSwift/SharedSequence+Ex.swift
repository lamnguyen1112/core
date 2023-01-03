//
//  SharedSequence+Extensions..swift
//  Components
//
//  Created by Lazyman on 1/2/23.
//

import RxSwift
import RxCocoa

public extension SharedSequence {
    func mapToVoid() -> SharedSequence<SharingStrategy, Void> { return map { _ in () } }
}
