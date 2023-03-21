//
//  AUIViewConfigurationProcessorProtocol.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 07.12.2022.
//

import Foundation

public typealias VoidClosure = () -> Void
public typealias ResultClosure<T> = (T) -> Void

public protocol AUIViewConfigurationProcessorProtocol: AnyObject {
    var screenId: String { get }
    
    func download(completion: @escaping (Result<AUIConfiguration, Error>) -> Void)
}
