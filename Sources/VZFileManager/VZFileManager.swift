//
//  VZFileManager.swift
//  VZFileManager
//
//  Created by @verizxn on 19/07/23.
//

import Foundation

public struct VZFileManager {
    private let fileManager = FileManager()
    
    public var name: String?
    public var path: URL?
    
    public init(name: String) {
        self.name = name
        if let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            path = url.appendingPathComponent(name)
        }
    }
    
    public func exists() -> Bool {
        do {
            return try path!.checkResourceIsReachable()
        } catch {
            return false
        }
    }
    
    public func save(contents: Any) -> Bool {
        do {
            if let str = contents as? String {
                try str.write(to: path!, atomically: false, encoding: .utf8)
            } else if let data = contents as? Data {
                try data.write(to: path!)
            }
        } catch {
            return false
        }
        return exists()
    }
    
    public func getString() -> String? {
        do {return try String(contentsOf: path!)}
        catch {return nil}
    }
    
    public func getData() -> Data? {
        do {return try Data(contentsOf: path!)}
        catch {return nil}
    }
    
    public func delete() -> Bool {
        do {
            try FileManager.default.removeItem(at: path!)
            return !exists()
        } catch {}
        return false
    }
    
}
