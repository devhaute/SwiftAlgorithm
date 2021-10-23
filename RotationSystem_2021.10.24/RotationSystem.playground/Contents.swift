import Foundation

extension Date {
    var day: Int {
        Calendar.current.component(.day, from: self)
    }
}

func main(_ cars: [Int]) -> Int {
    let date = Date()
    let units = date.day % 10 // 오늘 날짜 일의 자리수
    
    let tickets = cars.filter { $0 % 10 == units }

    return tickets.count
}

let cars = [1423, 5024, 1102, 5502, 1406, 3057, 1001, 3034]
print(main(cars))
