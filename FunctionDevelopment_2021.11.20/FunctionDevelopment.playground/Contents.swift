import Foundation

extension RangeReplaceableCollection {
    mutating func splice<R: RangeExpression>(range: R) -> SubSequence
    where R.Bound == Index {
        let result = self[range]
        self.removeSubrange(range)
        return result
    }
}

func solution(_ progresses: [Int], _ speeds: [Int]) -> [Int] {
    var deployCounts = [Int]()
    
    var todos = progresses
    var tempSpeeds = speeds
    
    while todos.count > 0 {
        let subDays = (100 - todos[0]) / tempSpeeds[0] == 0 ? 1 : (100 - todos[0]) / tempSpeeds[0]
        
        todos = todos.enumerated().map {
            let resultProgress = $1 + tempSpeeds[$0] * subDays
            return resultProgress > 100 ? 100 : resultProgress
        }
        
        var doneTodos = [Int]()
        
        for todo in todos {
            if todo == 100 {
                doneTodos.append(todo)
            } else {
                break
            }
        }
        
        deployCounts.append(doneTodos.count)
        todos.splice(range: 0...doneTodos.count - 1)
        tempSpeeds.splice(range: 0...doneTodos.count - 1)
    }
    
    return deployCounts
}

print(solution([99,99,99,99,99], [3,3,3,3,3]))




//[40, 93, 30, 55, 60, 65], [60, 1, 30, 5, 10, 7], [1, 2, 3] x 1
//[100, 94, 60, 60, 70, 72], [60, 1, 30, 5, 10, 7]
//[94, 60, 60, 70, 72], [1, 30, 5, 10, 7]
//[90, 100, 100], [5, 10, 7] X 2
// [100, 100, 100]
