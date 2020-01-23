import UIKit

struct Student {
    let givenName: String
    let familyName: String
    let gradYear: Int
}

var myList: [Student] = [
    Student(givenName: "Juan Jr", familyName: "Venegas", gradYear: 2021),
    Student(givenName: "Kobie", familyName: "Nikka", gradYear: 2021),
    Student(givenName: "Ryan", familyName: "Henick", gradYear: 2022),
    Student(givenName: "Matt", familyName: "Stilleti", gradYear: 2021),
]

func sortByFamilyName(a: Student, b:Student) -> Bool {
    if a.familyName == b.familyName {
        return a.givenName < b.givenName
    } else {
        return a.familyName < b.familyName
    }
}

let sortedList = myList.sorted(by: sortByFamilyName)
myList.sort(by: sortByFamilyName)

for item in sortedList {
    print("\(item.familyName), \(item.givenName) graduates  \(item.gradYear)")
}

let anotherSortedList = myList.sorted(by: {
    (a, b) in
    return a.givenName < b.givenName
})

for anotherItem in sortedList {
    print("\(anotherItem.familyName), \(anotherItem.givenName) graduates \(anotherItem.gradYear)")
}
