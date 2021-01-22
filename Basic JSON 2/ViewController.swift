//
//  ViewController.swift
//  Basic JSON 2
//
//  Created by Jonathan Burnett on 22/01/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        parseJson()
    }
    
    private func parseJson() {
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else {
            return
        }
        let url = URL(fileURLWithPath: path)
        let result: Result?
        do {
            let jsonData = try Data(contentsOf: url)
            result = try JSONDecoder().decode(Result.self, from: jsonData)
            
            if let result = result {
                print(result)
            } else {
                print("Failed to parse")
            }
            return
        } catch {
    print("Error \(error)")
        }
    }
}


struct Result: Codable {
    let data: [ResultItem]
}

struct ResultItem: Codable {
    let title: String
    let items: [String]
}

