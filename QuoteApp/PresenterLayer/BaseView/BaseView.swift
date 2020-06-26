//
//  BaseView.swift
//  QuoteApp
//
//  Created by hammam abdulaziz on 05/11/1441 AH.
//  Copyright © 1441 randomQuote. All rights reserved.
//

import UIKit
import CoreData

protocol BaseViewProtocol {
    func didFailWithError(_ error: String)
    func didFailWithError(_ error: NSError, isNetwork: Bool)
    func loading(_ start: Bool)
    func successFetchingData()
}

class BaseView: UIViewController {
    
    func loadView(_ start: Bool) -> Void {
        let loading = loadingView()
        start ? loading.startAnimation() : loading.stopAnimation()
    }
    
    var context: NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        return context
    }
    
    func getLocalQuote() -> QuoteModel? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Quote")
        request.predicate = NSPredicate(format: "local = %@", NSNumber.init(booleanLiteral: true))
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            if let result = result as? [NSManagedObject]{
                for data in result {
                    if let id = data.value(forKey: "id") as? String,
                        let author = data.value(forKey: "author") as? String,
                        let en = data.value(forKey: "en") as? String{
                        let quote = QuoteModel(id: id, en: en, author: author)
                        return quote
                    }
                }
            }
        } catch {
            return nil
        }
        return nil
    }
    
    func getFavoriteQuotes() -> [QuoteModel]? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Quote")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            if let result = result as? [NSManagedObject]{
                var quotes: [QuoteModel] = []
                for data in result {
                    if let id = data.value(forKey: "id") as? String,
                        let author = data.value(forKey: "author") as? String,
                        let en = data.value(forKey: "en") as? String, let local = data.value(forKey: "local") as? Bool{
                        if !local{
                            let quote = QuoteModel(id: id, en: en, author: author)
                            quotes.append(quote)
                        }
                    }
                }
                return quotes
            }
        } catch {
            return nil
        }
        return nil
    }
    
    func saveFavorite(_ data: QuoteModel?, locally: Bool = false) -> Void {
        let entity = NSEntityDescription.entity(forEntityName: "Quote", in: context)
        let newQuote = NSManagedObject(entity: entity!, insertInto: context)
        if locally{
            deleteOldQuoteIfFound()
        }
        if let data = data{
            newQuote.setValue(data.id, forKey: "id")
            newQuote.setValue(data.author, forKey: "author")
            newQuote.setValue(data.en, forKey: "en")
            newQuote.setValue(locally, forKey: "local")
            do {
               try context.save()
              } catch {
               print("Failed saving")
            }
        }
    }
    
    func deleteOldQuoteIfFound() -> Void {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Quote")
        request.predicate = NSPredicate(format: "local = %@", NSNumber.init(booleanLiteral: true))
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            if let result = result as? [NSManagedObject]{
                for data in result {
                    context.delete(data)
                }
                try context.save()
            }
        } catch {
            print("error")
        }
    }
}
