//
//  NewsDetailsViewController.swift
//  NewsAppTest
//
//  Created by ranjit dhumal on 10/04/23.
//

import UIKit
import Kingfisher
import CoreData



class NewsDetailsViewController: UIViewController {
    
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsDetailsLabel: UILabel!
    var newsDetails:Article?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsTitleLabel.text = newsDetails?.title
        if newsDetails?.urlToImage != nil{
        newsImageView.kf.setImage(with: URL(string: (newsDetails?.urlToImage)!))
        }else{
            newsImageView.image = UIImage(named: "news-icon")
        }
        newsDetailsLabel.text = newsDetails?.description
        
    }
    
    @IBAction func saveBtn(_ sender: UIButton) {
        let newsList = NewsDataBase(context: context)
       
        newsList.newimage = newsImageView.image?.jpegData(compressionQuality: 0.1)
        
        newsList.newstitle = newsTitleLabel.text
        do{
            try context.save()
            let alert = UIAlertController(title: "Message", message: "News Save Successfully", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { [unowned self](act) in
                let vc = self.storyboard?.instantiateViewController(identifier: "NewsListViewController") as! NewsListViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }))
            self.present(alert, animated: true, completion: nil)
        }catch let error{
            print(error.localizedDescription)
        }
        
      
    }
    
   

}
