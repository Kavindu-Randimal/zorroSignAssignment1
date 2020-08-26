//
//  ListViewController.swift
//  ShowFacts
//
//

import UIKit

class ListViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    var facts = AllFact.init(all: [FactList]())

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJSON{
            self.tableView.reloadData()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return facts.all.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        guard let FactCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCell else{
            return UITableViewCell()
        }
        let fact = facts.all[indexPath.row]
        
        FactCell.typeLabel.text = fact.type
        FactCell.descriptionLabel.text = fact.text
        FactCell.upvotesLabel.text = "up votes: \(fact.upvotes.map(String.init) ?? "")"
        return FactCell
    }
    
    
    func downloadJSON(completed: @escaping() -> () ){
        let url = URL(string : "https://cat-fact.herokuapp.com/facts")
        URLSession.shared.dataTask(with: url!){(data,response,error) in
            if error == nil {
                do {
                    self.facts = try JSONDecoder().decode(AllFact.self, from: data!)
                    DispatchQueue.main.async {
                        completed()                    }
                } catch {
                    print("JSON error", error)
                }
            }
        }.resume()
    }
}
