import Foundation

func main(_ bowls: [String]) -> Int {
    var weight = 10
    
    for (index, _) in bowls.enumerated() {
        guard index > 0 else {
            continue
        }
        
        if bowls[index-1] == bowls[index] {
            weight += 5
        } else {
            weight += 10
        }
    }
    
    
    return weight
}

let bowls = ["(", ")", "(", ")", "(", ")", ")", ")", "("]
print(main(bowls))

