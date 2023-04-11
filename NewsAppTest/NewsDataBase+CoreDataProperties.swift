//
//  NewsDataBase+CoreDataProperties.swift
//  NewsAppTest
//
//  Created by ranjit dhumal on 11/04/23.
//
//

import Foundation
import CoreData


extension NewsDataBase {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewsDataBase> {
        return NSFetchRequest<NewsDataBase>(entityName: "NewsDataBase")
    }

    @NSManaged public var newstitle: String?
    @NSManaged public var newimage: Data?

}

extension NewsDataBase : Identifiable {

}
