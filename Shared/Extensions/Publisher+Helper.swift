//
//  Publisher+Helper.swift
//  Ravn-Challenge-V2 (iOS)
//
//  Created by emartinez on 2/24/21.
//

import Combine

extension Publisher {
    func handleReceiveValue(action: @escaping (Self.Output) -> ()) -> AnyPublisher<Self.Output, Self.Failure> {
        handleEvents(receiveOutput: { value in action(value) })
        .eraseToAnyPublisher()
    }
}
