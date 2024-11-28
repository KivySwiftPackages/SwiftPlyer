import Foundation

import PythonCore
import PySwiftCore
import PyEncode

fileprivate extension FileManager {
    func url(for directory: FileManager.SearchPathDirectory, in domainMask: FileManager.SearchPathDomainMask = .allDomainsMask) -> PyPointer {
        urls(for: directory, in: domainMask).first?.pyPointer ?? .None
    }

}


public class StoragePath {
    let defaultManager = FileManager.default
    
    func get_home_dir() -> PyPointer {
        (try? defaultManager.url(for: .userDirectory, in: .userDomainMask, appropriateFor: nil, create: false))?.pyPointer ?? .None
    }
    
    func get_external_storage_dir() -> PyPointer {
        return PyExc_NotImplementedError.xINCREF
    }
    
    func get_sdcard_dir() -> PyPointer {
        return PyExc_NotImplementedError.xINCREF
    }
    
    func get_root_dir() -> PyPointer {
        return PyExc_NotImplementedError.xINCREF
    }
    
    func get_documents_dir() -> PyPointer {
        defaultManager.url(for: .documentDirectory)
    }
    
    func get_downloads_dir() -> PyPointer {
        defaultManager.url(for: .downloadsDirectory)
    }
    
    func get_videos_dir() -> PyPointer {
        defaultManager.url(for: .moviesDirectory)
    }
    
    func get_music_dir() -> PyPointer {
        defaultManager.url(for: .musicDirectory)
    }
    
    func get_pictures_dir() -> PyPointer {
        defaultManager.url(for: .picturesDirectory)
    }
    
    func get_application_dir() -> PyPointer {
        defaultManager.url(for: .applicationDirectory)
    }
}
