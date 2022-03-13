    //
    //  User.swift
    //  LoginApp
    //
    //  Created by Konstantin Fomenkov on 12.03.2022.
    //

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
    let image: String

    var fullname: String {
        name + " " + surname
    }

    static func getPerson() -> Person {
        Person(
            name: "Konstantin",
            surname: "Fomenkov",
            personalInfo: """
            This field should contain information about me.
            Unfortunately, I did not have enough time to approach this task.
            """,
            image: "026"
        )
    }
}
