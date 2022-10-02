Feature: Consultar personajes

    Background:
        Given url ambiente.url
        And path 'characters'
        * def character_json =  read ('../response/character.json')

    @breaking_bad @run
    Scenario Outline: Obtener a <name> de Breaking Bad
        Given path <id>
        When method get
        Then status 200
        * character_json[0].char_id = <id>
        * character_json[0].name = <name>
        * character_json[0].birthday = <birthday>
        * character_json[0].occupation = <occupation>
        * character_json[0].status = <status>
        * character_json[0].nickname = <nickname>
        Then match response == character_json
        And match each response[0].appearance == "#number"

        Examples:
            | id | name            | birthday     | occupation     | status          | nickname       |
            | 1  | "Walter White"  | "09-07-1958" | "#[2] #string" | "Presumed dead" | "Heisenberg"   |
            | 2  | "Jesse Pinkman" | "09-24-1984" | "#[1] #string" | "Alive"         | "Cap n' Cook"  |
            | 8  | "Saul Goodman"  | "Unknown"    | "#[1] #string" | "Alive"         | "Jimmy McGill" |