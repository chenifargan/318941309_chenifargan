//
//  DataPersistenceManager.swift
//  MovieFinalproject_318941309
//
//  Created by חן איפרגן on 26/05/2022.
//

import Foundation
import UIKit
import CoreData
class DataPersistenceManager {
    
    enum DatabasError : Error {
        case failedToSaveData
        case faildToFetchData
        case faildToDeleteData
    }
    static let shared = DataPersistenceManager()
    
    
    func downloadTitleWith(model: Title, completion : @escaping (Result<Void,Error>)->Void){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
            
        }
        let context = appDelegate.persistentContainer.viewContext
        let item = TitleItem(context: context)
        
        item.original_title = model.original_title
        item.id = Int64(model.id)
        item.original_name = model.original_name
        item.overview = model.overview
        item.media_type = model.media_type
        item.poster_path = model.poster_path
        item.release_date = model.release_date
        item.vote_count = Int64(model.vote_count)
        item.vote_average = model.vote_average
        
        do {
            try context.save()
            completion(.success(()))
        }catch {
            completion(.failure(DatabasError.failedToSaveData))
        }
        
    }
    func fetchingTitlesFromeDataBase(completion: @escaping (Result<[TitleItem],Error>)->Void){
        
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
            
        }
        let context = appDelegate.persistentContainer.viewContext
        
        let request : NSFetchRequest <TitleItem>
        
        request = TitleItem.fetchRequest()
        do {
            let title = try context.fetch(request)
            completion(.success(title))
        }catch{
            completion(.failure(DatabasError.faildToFetchData))
            
        }
    }
    func deletTitleWith(model : TitleItem , completion : @escaping(Result<Void,Error>) ->Void){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
            
        }
        let context = appDelegate.persistentContainer.viewContext
        
        
        context.delete(model)
        
        do {
            try context.save()
            completion(.success(()))
            
        }catch{
            completion(.failure(DatabasError.faildToDeleteData))
        }
        
    }
}


