import Foundation

class Person: Identifiable, Comparable {
    var id = UUID()
    var weight: Double
    var height: Double
    var rank: Int = 0
    
    init(weight: Double, height: Double) {
        self.weight = weight
        self.height = height
    }
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.weight == rhs.weight && lhs.height == rhs.height
    }
    
    static func > (lhs: Person, rhs: Person) -> Bool {
        return lhs.weight >= rhs.weight && lhs.height >= rhs.height
    }
    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs.weight <= rhs.weight && lhs.height <= rhs.height
    }
}

func main(_ people: [Person]) {
    let peopleArr = people.sorted(by: { $0.weight >= $1.weight && $0.height >= $1.height })
    
    for (index, _) in peopleArr.enumerated() {
        if index == 0 {
            peopleArr[index].rank = index + 1
            continue
        }
        
        if (peopleArr[index - 1] > peopleArr[index]) {
            peopleArr[index].rank = index + 1
        } else {
            peopleArr[index].rank = peopleArr[index - 1].rank
        }
        
    }
}

func rankPrint(_ people: [Person]) {
    for person in people {
        print(person.rank)
    }
}

let people: [Person] = [
    Person(weight: 55, height: 185),
    Person(weight: 58, height: 183),
    Person(weight: 88, height: 186),
    Person(weight: 60, height: 175),
    Person(weight: 46, height: 155)
]

main(people)
rankPrint(people)
