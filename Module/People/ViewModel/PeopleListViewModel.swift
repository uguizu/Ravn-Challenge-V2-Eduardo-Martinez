//
//  PeopleListViewModel.swift
//  Ravn-Challenge-V2 (iOS)
//
//  Created by emartinez on 2/24/21.
//

import Foundation
import Combine
import CombineExt

class PeopleListViewModel: ObservableObject {
    // Binding
    @Published var loading = false
    @Published var peopleList: [People] = []
    @Published var pageInformation: PageInformation?
    
    // Input
    let requestNextPage = PassthroughSubject<Void, Never>()
    
    // Output
    let result = PassthroughSubject<Void, Error>()
    @Published var error: Bool = false
    var hasNextPage: Bool {
        loading == false
            && ((peopleList.isEmpty && pageInformation == nil) || pageInformation?.hasNextPage == true)
    }
    
    private var cancellables = Set<AnyCancellable>()
    private let service: PeopleServiceType
    
    init(service: PeopleServiceType = PeopleService()) {
        self.service = service
        setupBindings()
    }
    
    private func setupBindings() {
        let resultList = requestNextPage
            .delay(for: .seconds(1), scheduler: RunLoop.main, options: .none)
            .withLatestFrom($pageInformation)
            .map { $0?.cursor }
            .handleReceiveValue { [weak self] _ in self?.loading = true }
            .flatMapLatest { [service] cursor in
                service
                    .fetchPeopleList(after: cursor ?? "")
                    .materialize()
            }
            .handleReceiveValue { [weak self] _ in self?.loading = false }
            .share()
           
        resultList.values()
            .sink { [weak self] in
                self?.peopleList.append(contentsOf: $0.value)
                self?.pageInformation = $0.pageInformation
                self?.error = false
            }
            .store(in: &cancellables)
        
        resultList
            .failures()
            .map { _ in true }
            .assign(to: \.error, on: self, ownership: .weak)
            .store(in: &cancellables)
    }
}
