import UIKit


let xrds: [String: Any] = [
    "name": "Crossroads School",
    "foundingYear": 1971,
    "campuses": [
        "Norton",
        "21st street"
    ]
]

let name0 = xrds["name"]
let name1 = xrds["name"] as! String
let name2 = xrds["name"] as? String

if name2 != nil {
    let unwrappedOptional = name2!
    print("Hello \(unwrappedOptional)")
} else {
    print("oops guess not")
}

let Answer = name2 ?? "something else"
print("Hello again, \(Answer)")

if let unwrapped = name2 {
    print("Hello another time, \(unwrapped)")
} else{
    print("well, that didn't work")
}
