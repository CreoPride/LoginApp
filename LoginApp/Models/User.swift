
struct User {
    let name: String
    let password: String
    let person: Person

    static func getUser() -> User {
        User(
            name: "admin",
            password: "123",
            person: .getPerson()
        )
    }
}
struct Person {
    let name: String
    let surname: String
    let personalInfo: String
    let image: Character

    static func getPerson() -> Person {
        Person(
            name: "Konstantin",
            surname: "Fomenkov",
            personalInfo: "this field should contain information about me.",
            image: "👨🏻‍🦲"
        )
    }
}
