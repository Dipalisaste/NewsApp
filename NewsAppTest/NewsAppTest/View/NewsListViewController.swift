//
//  NewsListViewController.swift
//  NewsAppTest
//
//  Created by ranjit dhumal on 11/04/23.
//

import UIKit
import CoreData
class NewsListViewController: UIViewController {

    @IBOutlet weak var newslistTableView: UITableView!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var newsArray:[NewsDataBase] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchNews()
    }
    func fetchNews() {
        do{
            newsArray = try context.fetch(NewsDataBase.fetchRequest())
            newslistTableView.reloadData()
        }catch let error{
            print(error.localizedDescription)
        }
    }
  
}
extension NewsListViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newscell") as! NewsListTableViewCell
        let obj = newsArray[indexPath.row]
        
        if let data = obj.value(forKey: "newimage") as? Data{
            cell.newslistImageView.image = UIImage(data: data)
        }else{
            cell.newslistImageView.image = UIImage(named: "news-icon")
        }
        
        cell.newslistLabel.text = obj.newstitle
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
    
    }

