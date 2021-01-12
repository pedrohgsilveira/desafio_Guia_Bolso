//
//  JokeViewModel.swift
//  GuiaBolso
//
//  Created by Pedro Henrique Guedes Silveira on 11/01/21.
//

import Foundation
import UIKit

final class JokeViewModel: JokeViewModeling {    
    
    var delegate: ViewModelDelegate?
    
    let cache = NSCache<NSString, UIImage>()
    
    var jokeResponse: JokeResponse
    
    var chuckImage: UIImage? {
        didSet {
            DispatchQueue.main.async { [unowned self] in
                self.delegate?.updateUI()
            }
        }
    }
    
    private let requestManager: RequestManager
    
    init(requestManager: RequestManager, jokeResponse: JokeResponse) {
        self.requestManager = requestManager
        self.jokeResponse = jokeResponse
        fetchJokeImage()
    }
    
    func fetchJokeImage() {
        let url = URL(string: jokeResponse.icon_url)
        let nsString = NSString(string: jokeResponse.icon_url)
        
        if let cachedVersion = cache.object(forKey: nsString) {
            self.chuckImage = cachedVersion
        } else {
            DispatchQueue.global().async {  [weak self] in
                if let url = url, let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.chuckImage = image  
                            self?.cache.setObject(image, forKey: nsString)
                        }
                    }
                }
            }
        }
    }
    
    func getJokeString() -> String {
        return jokeResponse.value
    }
    
}
