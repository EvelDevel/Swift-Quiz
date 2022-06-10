
//  Created by Евгений Никитин on 13.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

class RecordsCaretaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "records"
    
    func saveRecordsList(records: [Record]) {
        do {
            let data = try self.encoder.encode(records)
            
            UserDefaults.standard.set(
                data,
                forKey: key
            )
        } catch {
            print("We have some problems with saving the records")
        }
    }
    
    func getRecordsList() -> [Record] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try self.decoder.decode(
                [Record].self,
                from: data
            )
        } catch {
            print("We have some problems with retrieving data from memory")
            return []
        }
    }
}
