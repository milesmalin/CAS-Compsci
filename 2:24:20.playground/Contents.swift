import UIKit

let x = 1

switch x {
case 0:
    print("x is zero")
case 1:
    print("x is one")
case 2:
    print("x is two")
default:
    print("x is something else")
}

enum SchoolDay {
    case aDay
    case bDay
    case cDay
}

var today: SchoolDay = .bDay

switch today {
case .aDay:
    print("CAS Com Sci is second period")
case .bDay:
    print("CAS Com Sci is first period")
case .cDay:
    print("CAS Com Sci doesn't meet today")
default:
    print("What day is it?")
}
