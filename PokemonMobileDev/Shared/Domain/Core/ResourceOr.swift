//
//  ResourceOr.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 22/01/25.
//

import Foundation

enum ResourceOr<T, F: Error > {
    case initial
    case loading
    case success(T)
    case failure(Error)
    
    
    static func initial() -> ResourceOr<T, F> {
        .initial
    }
    
    static func loading() -> ResourceOr<T, F> {
            .loading
        }
    
    static func successResource(_ value: T) -> ResourceOr<T, F> {
        .success(value)
    }
    
    static func failureResource(_ error: Error) -> ResourceOr<T, F> {
        .failure(error)
    }
    
    var isInitial: Bool {
        if case .initial = self { return true }
        return false
    }
       
    var isLoading: Bool {
        if case .loading = self { return true }
        return false
    }
       
    var isSuccess: Bool {
        if case .success = self { return true }
        return false
    }
       
    var isFailure: Bool {
        if case .failure = self { return true }
        return false
    }
       
      
    /// Returns the associated success value if the current state is `.success`, otherwise `nil`.
    var successValue: T? {
        if case .success(let value) = self {
            return value
        }
        return nil
    }
       
    /// Returns the associated error if the current state is `.failure`, otherwise `nil`.
    var failureError: F? {
        if case .failure(let error) = self {
            return (error as! F)
        }
        return nil
    }
}
