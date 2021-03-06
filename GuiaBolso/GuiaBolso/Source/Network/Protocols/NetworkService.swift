//
//  NetworkService.swift
//  GuiaBolso
//
//  Created by Pedro Henrique Guedes Silveira on 09/01/21.
//

import Foundation

/// The service responsible for performing network requests.
protocol NetworkService {
    
    /**
     This function creates a DataTask from a URL request, and when resumed, triggers a completion handler with its answer.

     - Warning: This method is asyncronous.

     - Parameter url: The URL Request.
     - Parameter completionHandler: The block of code that will execute after the get request is executed.
     */
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}
