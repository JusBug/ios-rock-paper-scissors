//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by 박종화 on 2023/05/03.
//

struct RockPaperScissors {
    var isFirstGame: Bool = true
    var isSecondGame: Bool = false
    var isUserTurn: Bool = true
    var isComputerTurn: Bool = false
    var turnDictionary: [Bool: String]
    = [isUserTurn: "사용자", isComputerTurn: "컴퓨터"]
    var whoseTurn: String?
    
    mutating func start() {
        while isFirstGame {
            do {
                try startFirstGame()
            } catch UserCardsError.invalidinputError {
                print("잘못된 입력입니다. 다시 시도해주세요.")
            } catch {
                print("알 수 없는 오류가 발생했습니다.")
            }
        }
        
        while isSecondGame {
            do {
                try startSecondGame()
            } catch UserCardsError.invalidinputError {
                print("잘못된 입력입니다. 다시 시도해주세요.")
            } catch {
                print("알 수 없는 오류가 발생했습니다.")
            }
        }
    }

    mutating func startFirstGame() throws {
        print("가위(1), 바위(2), 보(3)! <종료 : 0>: ", terminator: "")
        let input = readLine()
        guard let inputString = input,
              let user = Int(inputString),
              let userCards = UserCards(rawValue: user) else { throw UserCardsError.invalidinputError}
            
        switch userCards {
        case .rock, .scissors, .paper:
            compareFirstCard(user, createRandomNumber())
        case .exit:
            print("게임 종료")
            isFirstGame = false
        }
    }
    
    mutating func compareFirstCard (_ user: Int, _ computer: Int) {
        let difference = user - computer
        
        switch difference {
        case 0:
            print("비겼습니다!")
        case 1, -2:
            print("이겼습니다!")
            self.whoseTurn = turnDictionary[isUserTurn]
            isFirstGame = false
            isSecondGame = true
        case -1, 2:
            print("졌습니다!")
            self.whoseTurn = turnDictionary[isComputerTurn]
            isFirstGame = false
            isSecondGame = true
        default:
            return
        }
    }
    
    mutating func startSecondGame() throws {
        print("[\(self.whoseTurn ?? "오류2") 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0>: ", terminator: "")
        let input = readLine()
        guard let inputString = input,
              let user = Int(inputString),
              let userCards = UserCards(rawValue: user) else { throw UserCardsError.invalidinputError}
            
        switch userCards {
        case .rock, .scissors, .paper:
            compareSecondCard(user, createRandomNumber())
        case .exit:
            print("게임 종료")
            isSecondGame = false
        }
    }
    
    mutating func compareSecondCard (_ user: Int, _ computer: Int) {
        let difference = user - computer
        
        switch difference {
        case 0:
            print("\(self.whoseTurn ?? "오류3")의 승리!")
            isSecondGame = false
        case -1, 2:
            if whoseTurn != self.turnDictionary[isUserTurn] {
                changeTurn()
            }
            printTurn()
        case 1, -2:
            if whoseTurn != self.turnDictionary[isComputerTurn] {
                changeTurn()
            }
            printTurn()
        default:
            return
        }
    }
    
    func createRandomNumber() -> Int {
        let randomNumber = Int.random(in: 1...3)
        return randomNumber
    }
    
    mutating func changeTurn() {
        if self.whoseTurn == self.turnDictionary[isUserTurn]  {
            self.whoseTurn = self.turnDictionary[isComputerTurn]
        } else {
            self.whoseTurn = self.turnDictionary[isUserTurn]
        }
    }
    
    mutating func printTurn() {
        print("\(self.whoseTurn ?? "오류5")의 턴입니다.")
    }
}
