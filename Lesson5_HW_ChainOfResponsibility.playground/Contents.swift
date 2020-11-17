import UIKit

func getData(from file: String) -> Data {
    let path1 = Bundle.main.path(forResource: file, ofType: "json")!
    let url = URL(fileURLWithPath: path1)
    let data = try! Data(contentsOf: url)
    return data
}

let data1 = getData(from: "1")
let data2 = getData(from: "2")
let data3 = getData(from: "3")

class Person : Codable , CustomStringConvertible{
    var description: String {
        return "Name: \(self.name); Age: \(self.age); " + (self.isDeveloper ? "is a developer" : "")
    }
    
    var name : String = ""
    var age : Int = 0
    var isDeveloper : Bool = false
    
    enum CodingKeys: String, CodingKey {
        case name, age, isDeveloper
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try values.decode(String.self, forKey: .name)
        self.age = try values.decode(Int.self, forKey: .age)
        self.isDeveloper = try values.decode(Bool.self, forKey: .isDeveloper)
    }

}

class DataPersons : Decodable {
    var data : [Person]
}

class ResultPersons : Decodable {
    var result : [Person]
}

protocol Parser {
    var nextParser : Parser? {get set}
    func parseData (data: Data)-> [Person]
}

class DataParser : Parser {
    
    var nextParser: Parser?
    
    func parseData(data: Data) -> [Person] {
        do {
            let persons = try JSONDecoder().decode(DataPersons.self, from: data).data
            return persons
        } catch {
            let persons = nextParser?.parseData(data: data)
            return persons ?? []
        }
    }
}

class ResultParser : Parser {
    
    var nextParser: Parser?
    
    func parseData(data: Data) -> [Person] {
        do {
            let persons = try JSONDecoder().decode(ResultPersons.self, from: data).result
            return persons
        } catch {
            let persons = nextParser?.parseData(data: data)
            return persons ?? []
        }
    }
}

class PersonsParser : Parser {
    
    var nextParser: Parser?
    
    func parseData(data: Data) -> [Person] {
        do {
            let persons = try JSONDecoder().decode([Person].self, from: data)
            return persons
        } catch {
            let persons = nextParser?.parseData(data: data)
            return persons ?? []
        }
    }
}

func parseData(from file: String) -> [Person] {
    let data = getData(from: file)
    return dataParser.parseData(data: data)
}

let dataParser = DataParser()
let resultParser = ResultParser()
let personsParser = PersonsParser()

dataParser.nextParser = resultParser
resultParser.nextParser = personsParser
personsParser.nextParser = nil

print ("File1:")
let persons1 = parseData(from: "1")
persons1.forEach { (Person) in
    print(Person)
}
print ("-------------------------")
print ("File2:")
let persons2 = parseData(from: "2")
persons2.forEach { (Person) in
    print(Person)
}
print ("-------------------------")
print ("File3:")
let persons3 = parseData(from: "3")
persons3.forEach { (Person) in
    print(Person)
}
