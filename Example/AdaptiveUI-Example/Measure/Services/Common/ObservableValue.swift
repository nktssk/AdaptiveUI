//
//  ObservableValue.swift
//  Benchmark
//
//  Created by Nikita Sosyuk on 7.12.22.
//

import Foundation
import Combine

///workaround for protocols to be able to have @Published properties
final class ObservableValue<T> {

    @Published var value: T

    init(_ value: T) {
        self.value = value
    }
}
