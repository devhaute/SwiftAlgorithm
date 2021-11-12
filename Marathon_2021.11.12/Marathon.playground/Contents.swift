import Foundation

func main(_ participant: [String], _ completion: [String]) -> Void {
    var dropouts = participant
    
    for aCompletion in completion {
        if let removeIndex = dropouts.firstIndex(of: aCompletion) {
            dropouts.remove(at: removeIndex)
        }
    }
    
    print("탈락자들: \(dropouts)")
}

let participant = ["mislav", "stanko", "mislav", "ana"]
let completion = ["stanko", "ana", "mislav"]

main(participant, completion)
