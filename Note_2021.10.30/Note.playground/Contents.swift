import Foundation

enum NoteType: String {
    case ascending, descending, mixed
}

func main(_ notes: [Int]) -> String {
    var noteType: NoteType
    
    if notes[0] - notes[1] == 1 {
        noteType = .descending
    } else if notes[0] - notes[1] == -1 {
        noteType = .ascending
    } else {
        noteType = .mixed
    }
    
    
    for (index, note) in notes.enumerated() {
        guard index > 0 else {
            continue
        }
        
        if (noteType == .descending && notes[index - 1] - note != 1)
            || (noteType == .ascending && notes[index - 1] - note != -1){
            noteType = .mixed
            return noteType.rawValue
        }
    }
    
    return noteType.rawValue
}

//let notes = [1,2,3,4,5,6,7,8]
let notes = [8,7,6,5,4,3,2,1]
//let notes = [8,1,7,2,6,3,5,4]
print(main(notes))
