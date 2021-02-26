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
    @Published var pageInformation: AllPeopleQuery.Data.AllPerson.PageInfo?
    
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
    private let service: PeopleNetworkServiceType
    
    init(service: PeopleNetworkServiceType = PeopleNetworkService()) {
        self.service = service
        setupBindings()
    }
    
    private func setupBindings() {
        let resultList = requestNextPage
            .delay(for: .seconds(1), scheduler: RunLoop.main, options: .none)
            .withLatestFrom($pageInformation)
            .map { $0?.endCursor }
            .handleReceiveValue { [weak self] _ in self?.loading = true }
            .flatMapLatest { [service] cursor in
                service
                    .fetchPeopleList(after: cursor ?? "")
                    .materialize()
            }
            .handleReceiveValue { [weak self] _ in self?.loading = false }
            .share()
           
        resultList.values()
            .map {
                ($0?.people?.compactMap { $0 }.map { People(wrappedValue: $0) },
                 $0?.pageInfo)
            }
            .sink { [weak self] in
                self?.peopleList.append(contentsOf: $0 ?? [])
                self?.pageInformation = $1
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
