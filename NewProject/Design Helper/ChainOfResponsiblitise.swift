//
//  ChainOfResponsiblitise.swift
//  NewProject
//
//  Created by Adam on 1/21/19.
//  Copyright © 2019 Adam. All rights reserved.
//


/*
 *
 
 For a real life scenario, in order to understand this pattern, suppose you got a problem to solve. If you are able to handle it on your own, you will do so, otherwise you will tell your friend to solve it. If he’ll able to solve he will do that, or he will also forward it to some other friend. The problem would be forwarded until it gets solved by one of your friends or all your friends have seen the problem, but no one is able to solve it, in which case the problem stays unresolved
 
 When to use
 When there are Multiple objects and the handler will be determined at runtime
 When you don’t want to specify handlers explicitly in your code
 Advantages
 To reduce the coupling degree.Decoupling it will request the sender and receiver
 Simplified object. The object does not need to know the chain structure
 Disadvantages
 The request must be received not guarantee
 The performance of the system will be affected, but also in the code debugging is not easy may cause cycle call.
 It may not be easy to observe the characteristics of operation, due to debug.
 *
 */

import Foundation
protocol Chain{
    func process(_ file: File)
    func nextChain(_ nextHadler: Chain)
    func className() -> String
}

extension Chain{
    func className() -> String{
        return String(describing: String(describing: self).split(separator: ".").last!)
    }
}

enum FileType{
    case audio
    case video
    case excel
    case text
}

class File{
    var name: String!
    var type: FileType!
}

class TextFileHanlder: Chain{
    
    private var nextHandler: Chain!
    
    func process(_ file: File){
        if file.type == .text{
            print("Proccess \(file.name!) with extension \(file.type!) with handlder " + self.className())
        }else if nextHandler != nil{
            print("Forward \(file.name!) with extension \(file.type!) for handlder " + nextHandler.className())
            nextHandler.process(file)
        }else{
            print("\(file.name!) not supported")
        }
    }
    
    func nextChain(_ nextHadler: Chain){
        self.nextHandler = nextHadler
    }
}


class ExcelFileHanlder: Chain{
    
    private var nextHandler: Chain!
    
    func process(_ file: File){
        if file.type == .excel{
            print("Proccess \(file.name!) with extension \(file.type!) with handlder " + self.className())
        }else if nextHandler != nil{
            print("Forward \(file.name!) with extension \(file.type!) for handlder " + nextHandler.className())
            nextHandler.process(file)
        }else{
            print("\(file.name!) not supported")
        }
    }
    
    func nextChain(_ nextHadler: Chain){
        self.nextHandler = nextHadler
    }
}


class VideoFileHanlder: Chain{
    
    private var nextHandler: Chain!
    
    func process(_ file: File){
        if file.type == .video{
            print("Proccess \(file.name!) with extension \(file.type!) with handlder " + self.className())
        }else if nextHandler != nil{
            print("Forward \(file.name!) with extension \(file.type!) for handlder " + nextHandler.className())
            nextHandler.process(file)
        }else{
            print("\(file.name!) not supported")
        }
    }
    
    func nextChain(_ nextHadler: Chain){
        self.nextHandler = nextHadler
    }
}


class AudioFileHanlder: Chain{
    
    private var nextHandler: Chain!
    
    func process(_ file: File){
        if file.type == .audio{
            print("Proccess \(file.name!) with extension \(file.type!) with handlder " + self.className())
        }else if nextHandler != nil{
            print("Forward \(file.name!) with extension \(file.type!) for handlder " + nextHandler.className())
            nextHandler.process(file)
        }else{
            print("\(file.name!) not supported")
        }
    }
    
    func nextChain(_ nextHadler: Chain){
        self.nextHandler = nextHadler
    }
}

class TestPattern{
        private func getSoundFile() -> File{
            let file = File()
            file.name = "Sound"
            file.type = .audio
            return file
        }
    
    private func getExcelFile() -> File{
        let file = File()
        file.name = "Excel"
        file.type = .excel
        return file
    }
        private func getVideoFile() -> File{
            let file = File()
            file.name = "Excel"
            file.type = .video
            return file
        }
        private func gettextFile() -> File{
            let file = File()
            file.name = "Excel"
            file.type = .text
            return file
        }
    
    func test(){
        let audioHandler = AudioFileHanlder()
        let videoHandler = VideoFileHanlder()
        let textHandler = TextFileHanlder()
        let excelHandler = ExcelFileHanlder()
        
        audioHandler.nextChain(videoHandler)
        videoHandler.nextChain(textHandler)
        textHandler.nextChain(excelHandler)
        excelHandler.nextChain(audioHandler)
        
        audioHandler.process(getExcelFile())
    }
}
//Forward Excel with extension excel for handlder VideoFileHanlder
//    Forward Excel with extension excel for handlder TextFileHanlder
//Forward Excel with extension excel for handlder ExcelFileHanlder
//    Proccess Excel with extension excel with handlder ExcelFileHanlder
