//
//  ViewController.swift
//  NewsAppTest
//
//  Created by ranjit dhumal on 10/04/23.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    var news:Welcome?
    var articles:[Article]=[]
    
    @IBOutlet weak var newsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fetchAPI()
    }
    
    //fetch data form api
    func fetchAPI(){
        let str =   "https://newsapi.org/v2/everything?q=apple&from=2023-04-10&to=2023-04-10&sortBy=popularity&apiKey=cc2325e0238744ea8d5c391f02cdd029"
        
        let url = URL(string: str)
        
        URLSession.shared.dataTask(with: url!) { [unowned self] (data, response, error) in
            if error == nil {
                do{
                    self.news = try JSONDecoder().decode(Welcome.self, from: data!)
                    self.articles = self.news!.articles
                    
                    DispatchQueue.main.async {
                        self.newsTableView.reloadData()
                    }
                } catch let error{
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }

    @IBAction func showNews(_ sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewController(identifier: "NewsListViewController") as! NewsListViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTableView.dequeueReusableCell(withIdentifier: "cell") as! NewsTableViewCell
        let obj = articles[indexPath.row]
        cell.newsTitleLabel.text = obj.title!
        if obj.urlToImage != nil{
        cell.newsImageView.kf.setImage(with: URL(string: obj.urlToImage!))
        }else{
            cell.newsImageView.image = UIImage(named: "news-icon")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "NewsDetailsViewController") as! NewsDetailsViewController
        vc.newsDetails = articles[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
}
