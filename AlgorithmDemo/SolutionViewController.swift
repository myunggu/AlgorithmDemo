//
//  SolutionViewController.swift
//  AlgorithmDemo
//
//  Created by Myunggu Kim on 18/03/2019.
//  Copyright © 2019 Myunggu Kim. All rights reserved.
//

import UIKit

class SolutionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //let result = A1(participant: ["mislav", "stanko", "mislav", "ana"], completion: ["stanko", "ana", "mislav"])
        //let result = A2(["12","123","1235","567,88"])
        //let result = A3(["classic", "pop", "classic", "classic", "pop"], [500, 600, 150, 800, 2500])
        //let result = A4("()(((()())(())()))(())")
        //let result = A5([1, 1, 9, 1, 1, 1], 0)
//        var result = A6(2, 10, [7,4,5,6])
//        print("결과 : \(result)")
//        result = A6(100, 100, [10])
//        print("결과 : \(result)")
//        result = A6(100, 100, [10,10,10,10,10,10,10,10,10,10])
//        print("결과 : \(result)")
        
//        let result = A7([3, 30, 34, 5, 9])
//        let result = A8([3, 0, 6, 1, 5])
//        let result = A9([1,3,2,4,2])
//        let result = A10("123")
        let result = A11([[123, 1, 1], [356, 1, 0], [327, 2, 0], [489, 0, 1]])
        print("결과 : \(result)")
    }
    

    /*
     완주하지 못한 선수
     
     -문제 설명
     수많은 마라톤 선수들이 마라톤에 참여하였습니다. 단 한 명의 선수를 제외하고는 모든 선수가 마라톤을 완주하였습니다.
     마라톤에 참여한 선수들의 이름이 담긴 배열 participant와 완주한 선수들의 이름이 담긴 배열 completion이 주어질 때, 완주하지 못한 선수의 이름을 return 하도록 solution 함수를 작성해주세요.
     
     -제한사항
     마라톤 경기에 참여한 선수의 수는 1명 이상 100,000명 이하입니다.
     completion의 길이는 participant의 길이보다 1 작습니다.
     참가자의 이름은 1개 이상 20개 이하의 알파벳 소문자로 이루어져 있습니다.
     참가자 중에는 동명이인이 있을 수 있습니다.
     
     -입출력 예
     participant    completion    return
     [leo, kiki, eden]    [eden, kiki]    leo
     [marina, josipa, nikola, vinko, filipa]    [josipa, filipa, marina, nikola]    vinko
     [mislav, stanko, mislav, ana]    [stanko, ana, mislav]    mislav
     
     -입출력 예 설명
     예제 #1
     leo는 참여자 명단에는 있지만, 완주자 명단에는 없기 때문에 완주하지 못했습니다.
     예제 #2
     vinko는 참여자 명단에는 있지만, 완주자 명단에는 없기 때문에 완주하지 못했습니다.
     예제 #3
     mislav는 참여자 명단에는 두 명이 있지만, 완주자 명단에는 한 명밖에 없기 때문에 한명은 완주하지 못했습니다.
     */
    func A1(participant: [String], completion: [String]) -> String {
        let sortedParticipant = participant.sorted()
        let sortedCompletion = completion.sorted()
        
        for (index, element) in sortedCompletion.enumerated() {
            if element != sortedParticipant[index] {
                return sortedParticipant[index]
            }
        }
        return sortedParticipant[sortedParticipant.count-1]
    }
    
    /*
     전화번호 목록
     
     -문제 설명
     전화번호부에 적힌 전화번호 중, 한 번호가 다른 번호의 접두어인 경우가 있는지 확인하려 합니다.
     전화번호가 다음과 같을 경우, 구조대 전화번호는 영석이의 전화번호의 접두사입니다.
     구조대 : 119
     박준영 : 97 674 223
     지영석 : 11 9552 4421
     전화번호부에 적힌 전화번호를 담은 배열 phone_book 이 solution 함수의 매개변수로 주어질 때, 어떤 번호가 다른 번호의 접두어인 경우가 있으면 false를 그렇지 않으면 true를 return 하도록 solution 함수를 작성해주세요.
     
     -제한 사항
     phone_book의 길이는 1 이상 1,000,000 이하입니다.
     각 전화번호의 길이는 1 이상 20 이하입니다.
     
     -입출력 예제
     phone_book    return
     [119, 97674223, 1195524421]    false
     [123,456,789]    true
     [12,123,1235,567,88]    false
     
     -입출력 예 설명
     입출력 예 #1
     앞에서 설명한 예와 같습니다.
     입출력 예 #2
     한 번호가 다른 번호의 접두사인 경우가 없으므로, 답은 true입니다.
     입출력 예 #3
     첫 번째 전화번호, “12”가 두 번째 전화번호 “123”의 접두사입니다. 따라서 답은 false입니다.
    */
    func A2(_ phoneBook: [String]) -> Bool {
        let sortedPhoneBook = phoneBook.sorted()
        for (index, item) in sortedPhoneBook.enumerated() {
            if index < sortedPhoneBook.count-2, sortedPhoneBook[index+1].starts(with: item) {
                return false
            }
        }
        return true
    }
    
    /*
     
     베스트앨범
     
     -문제 설명
     스트리밍 사이트에서 장르 별로 가장 많이 재생된 노래를 두 개씩 모아 베스트 앨범을 출시하려 합니다. 노래는 고유 번호로 구분하며, 노래를 수록하는 기준은 다음과 같습니다.
     속한 노래가 많이 재생된 장르를 먼저 수록합니다.
     장르 내에서 많이 재생된 노래를 먼저 수록합니다.
     장르 내에서 재생 횟수가 같은 노래 중에서는 고유 번호가 낮은 노래를 먼저 수록합니다.
     노래의 장르를 나타내는 문자열 배열 genres와 노래별 재생 횟수를 나타내는 정수 배열 plays가 주어질 때, 베스트 앨범에 들어갈 노래의 고유 번호를 순서대로 return 하도록 solution 함수를 완성하세요.
     
     - 제한사항
     genres[i]는 고유번호가 i인 노래의 장르입니다.
     plays[i]는 고유번호가 i인 노래가 재생된 횟수입니다.
     genres와 plays의 길이는 같으며, 이는 1 이상 10,000 이하입니다.
     장르 종류는 100개 미만입니다.
     장르에 속한 곡이 하나라면, 하나의 곡만 선택합니다.
     모든 장르는 재생된 횟수가 다릅니다.
     
     - 입출력 예
     genres    plays    return
     [classic, pop, classic, classic, pop]    [500, 600, 150, 800, 2500]    [4, 1, 3, 0]
     
     - 입출력 예 설명
     classic 장르는 1,450회 재생되었으며, classic 노래는 다음과 같습니다.
     고유 번호 3: 800회 재생
     고유 번호 0: 500회 재생
     고유 번호 2: 150회 재생
     pop 장르는 3,100회 재생되었으며, pop 노래는 다음과 같습니다.
     고유 번호 4: 2,500회 재생
     고유 번호 1: 600회 재생
     따라서 pop 장르의 [4, 1]번 노래를 먼저, classic 장르의 [3, 0]번 노래를 그다음에 수록합니다.
    */
    func A3(_ genres:[String], _ plays:[Int]) -> [Int] {
        
        let dict = genres.enumerated().reduce(into: [String: [[Int]]]()) {
            let (index, genre) = $1
            $0[genre, default: []] += [[index, plays[index]]]
        }
        //dict : ["classic": [[0, 500], [2, 150], [3, 800]], "pop": [[1, 600], [4, 2500]]]
        
        let array = Array(dict.values)
        //array : [[[0, 500], [2, 150], [3, 800]], [[1, 600], [4, 2500]]]
        
        /*
            속한 노래가 많이 재생된 장르를 먼저 수록.
        */
        let sortedArray = array.sorted {
            return ($0.reduce(0) { $0 + $1[1] }) > ($1.reduce(0) { $0 + $1[1] })
        }
        //sortedArray : [[[1, 600], [4, 2500]], [[0, 500], [2, 150], [3, 800]]]
        
        /*
            장르 내에서 많이 재생된 노래를 먼저 수록.
        */
        let flat = sortedArray.flatMap {
            return $0.sorted { $0[1] > $1[1] }
                .map { $0[0] }
                .prefix(2) //최대 두 개씩 모아
        }
        //flat : [4, 1, 3, 0]
        
        return flat
    }
    
    /*
     
     쇠막대기
     
     -문제 설명
     
     여러 개의 쇠막대기를 레이저로 절단하려고 합니다. 효율적인 작업을 위해서 쇠막대기를 아래에서 위로 겹쳐 놓고, 레이저를 위에서 수직으로 발사하여 쇠막대기들을 자릅니다. 쇠막대기와 레이저의 배치는 다음 조건을 만족합니다.
     - 쇠막대기는 자신보다 긴 쇠막대기 위에만 놓일 수 있습니다.
     - 쇠막대기를 다른 쇠막대기 위에 놓는 경우 완전히 포함되도록 놓되, 끝점은 겹치지 않도록 놓습니다.
     - 각 쇠막대기를 자르는 레이저는 적어도 하나 존재합니다.
     - 레이저는 어떤 쇠막대기의 양 끝점과도 겹치지 않습니다.
     아래 그림은 위 조건을 만족하는 예를 보여줍니다. 수평으로 그려진 굵은 실선은 쇠막대기이고, 점은 레이저의 위치, 수직으로 그려진 점선 화살표는 레이저의 발사 방향입니다.
     
     이러한 레이저와 쇠막대기의 배치는 다음과 같이 괄호를 이용하여 왼쪽부터 순서대로 표현할 수 있습니다.
     (a) 레이저는 여는 괄호와 닫는 괄호의 인접한 쌍 '()'으로 표현합니다. 또한 모든 '()'는 반드시 레이저를 표현합니다.
     (b) 쇠막대기의 왼쪽 끝은 여는 괄호 '('로, 오른쪽 끝은 닫힌 괄호 ')'로 표현됩니다.
     위 예의 괄호 표현은 그림 위에 주어져 있습니다.
     쇠막대기는 레이저에 의해 몇 개의 조각으로 잘리는데, 위 예에서 가장 위에 있는 두 개의 쇠막대기는 각각 3개와 2개의 조각으로 잘리고, 이와 같은 방식으로 주어진 쇠막대기들은 총 17개의 조각으로 잘립니다.
     쇠막대기와 레이저의 배치를 표현한 문자열 arrangement가 매개변수로 주어질 때, 잘린 쇠막대기 조각의 총 개수를 return 하도록 solution 함수를 작성해주세요.
     
     -제한사항
     arrangement의 길이는 최대 100,000입니다.
     arrangement의 여는 괄호와 닫는 괄호는 항상 쌍을 이룹니다.
    */
    
//    func A4(_ arrangement: String) -> Int {
//        var stack = Stack<Character>()
//        var answer = 0
//        for (index, char) in arrangement.enumerated() {
//            if char == "(" {
//                stack.push(char)
//            } else {
//                _ = stack.pop()
//                let previusCharIndex = arrangement.index(arrangement.startIndex, offsetBy: index-1)
//                if arrangement[previusCharIndex] == "(" {
//                    // 스택에 남아있는 갯수를 더함
//                    answer += stack.count
//                } else {
//                    // 1을 더함
//                    answer += 1
//                }
//            }
//        }
//        return answer
//    }
    
    /*
     
     프린터
     
     문제 설명
     
     일반적인 프린터는 인쇄 요청이 들어온 순서대로 인쇄합니다. 그렇기 때문에 중요한 문서가 나중에 인쇄될 수 있습니다. 이런 문제를 보완하기 위해 중요도가 높은 문서를 먼저 인쇄하는 프린터를 개발했습니다. 이 새롭게 개발한 프린터는 아래와 같은 방식으로 인쇄 작업을 수행합니다.
     1. 인쇄 대기목록의 가장 앞에 있는 문서(J)를 대기목록에서 꺼냅니다.
     2. 나머지 인쇄 대기목록에서 J보다 중요도가 높은 문서가 한 개라도 존재하면 J를 대기목록의 가장 마지막에 넣습니다.
     3. 그렇지 않으면 J를 인쇄합니다.
     예를 들어, 4개의 문서(A, B, C, D)가 순서대로 인쇄 대기목록에 있고 중요도가 2 1 3 2 라면 C D A B 순으로 인쇄하게 됩니다.
     내가 인쇄를 요청한 문서가 몇 번째로 인쇄되는지 알고 싶습니다. 위의 예에서 C는 1번째로, A는 3번째로 인쇄됩니다.
     현재 대기목록에 있는 문서의 중요도가 순서대로 담긴 배열 priorities와 내가 인쇄를 요청한 문서가 현재 대기목록의 어떤 위치에 있는지를 알려주는 location이 매개변수로 주어질 때, 내가 인쇄를 요청한 문서가 몇 번째로 인쇄되는지 return 하도록 solution 함수를 작성해주세요.
     제한사항
     현재 대기목록에는 1개 이상 100개 이하의 문서가 있습니다.
     인쇄 작업의 중요도는 1~9로 표현하며 숫자가 클수록 중요하다는 뜻입니다.
     location은 0 이상 (현재 대기목록에 있는 작업 수 - 1) 이하의 값을 가지며 대기목록의 가장 앞에 있으면 0, 두 번째에 있으면 1로 표현합니다.
     입출력 예
     priorities    location    return
     [2, 1, 3, 2]    2    1
     [1, 1, 9, 1, 1, 1]    0    5
     입출력 예 설명
     예제 #1
     문제에 나온 예와 같습니다.
     예제 #2
     6개의 문서(A, B, C, D, E, F)가 인쇄 대기목록에 있고 중요도가 1 1 9 1 1 1 이므로 C D E F A B 순으로 인쇄합니다.
    */
    func A5(_ priorities:[Int], _ location:Int) -> Int {
        var arr: [(Int, Int)] = priorities.enumerated().map { ($0, $1) }
        var sortedArr: [(Int, Int)] = []
       
        while arr.isEmpty == false {
            let item = arr[0]
            if let maxItem = (arr.max(by: { $0.1 < $1.1})) {
                let maxPriority = maxItem.1
                
                if item.1 >= maxPriority {
                    sortedArr.append(item)
                } else {
                    arr.append(item)
                }
            }
            arr.remove(at: 0)
        }
        
        let answer = sortedArr.firstIndex(where: { $0.0 == location })
        return (answer! + 1)
    }
    
    /*
     다리를 지나는 트럭
     
     -문제 설명
     트럭 여러 대가 강을 가로지르는 일 차선 다리를 정해진 순으로 건너려 합니다. 모든 트럭이 다리를 건너려면 최소 몇 초가 걸리는지 알아내야 합니다. 트럭은 1초에 1만큼 움직이며, 다리 길이는 bridge_length이고 다리는 무게 weight까지 견딥니다.
     ※ 트럭이 다리에 완전히 오르지 않은 경우, 이 트럭의 무게는 고려하지 않습니다.
     예를 들어, 길이가 2이고 10kg 무게를 견디는 다리가 있습니다. 무게가 [7, 4, 5, 6]kg인 트럭이 순서대로 최단 시간 안에 다리를 건너려면 다음과 같이 건너야 합니다.
     경과 시간    다리를 지난 트럭    다리를 건너는 트럭    대기 트럭
     0    []    []    [7,4,5,6]
     1~2    []    [7]    [4,5,6]
     3    [7]    [4]    [5,6]
     4    [7]    [4,5]    [6]
     5    [7,4]    [5]    [6]
     6~7    [7,4,5]    [6]    []
     8    [7,4,5,6]    []    []
     따라서, 모든 트럭이 다리를 지나려면 최소 8초가 걸립니다.
     solution 함수의 매개변수로 다리 길이 bridge_length, 다리가 견딜 수 있는 무게 weight, 트럭별 무게 truck_weights가 주어집니다. 이때 모든 트럭이 다리를 건너려면 최소 몇 초가 걸리는지 return 하도록 solution 함수를 완성하세요.
     
     -제한 조건
     bridge_length는 1 이상 10,000 이하입니다.
     weight는 1 이상 10,000 이하입니다.
     truck_weights의 길이는 1 이상 10,000 이하입니다.
     모든 트럭의 무게는 1 이상 weight 이하입니다.
     
     -입출력 예
     bridge_length    weight    truck_weights    return
     2    10    [7,4,5,6]    8
     100    100    [10]    101
     100    100    [10,10,10,10,10,10,10,10,10,10]    110
     출처
    */
    func A6(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
        
        var answer = 0
        var arr: [Int] = []
        var index = 0
        
        while index != truck_weights.count {
        
            let truck = truck_weights[index]
            
            arr.append(truck)
            
            // check sum
            let sum = arr.suffix(bridge_length).reduce(0, { $0 + $1 })
            if sum > weight {
                arr.removeLast()
                arr.append(0)
                continue
            }
            
            index += 1
        }
        
        answer = arr.count + bridge_length
        
        return answer
    }
    
    func A7(_ numbers:[Int]) -> String {
        let sortedNumbers = numbers.sorted {
            Int("\($0)\($1)")! > Int("\($1)\($0)")!
        }
        
        let answer = sortedNumbers.map { String($0) }.reduce("") { $0 + $1 }
        return sortedNumbers.first == 0 ? "0" : answer
    }
    
    func A8(_ citations:[Int]) -> Int {
        let citations = citations.sorted() { $0 > $1 }
        var result = 0
        
        for i in 0..<citations.count {
            if i + 1 <= citations[i] {
                result = i + 1
            } else {
                break
            }
        }
        
        return result
    }
    
    func A9(_ answers:[Int]) -> [Int] {
        let answer = (
            a: [1, 2, 3, 4, 5], // index % 5
            b: [2, 1, 2, 3, 2, 4, 2, 5], // index % 8
            c: [3, 3, 1, 1, 2, 2, 4, 4, 5, 5] // index % 10
        )
        var point = [1:0, 2:0, 3:0]
        
        for (i, v) in answers.enumerated() {
            if v == answer.a[i % 5] { point[1] = point[1]! + 1 }
            if v == answer.b[i % 8] { point[2] = point[2]! + 1 }
            if v == answer.c[i % 10] { point[3] = point[3]! + 1 }
        }
        
        let sorted = point.sorted{ $0.key < $1.key }
        let filtered = sorted.filter{ $0.value == point.values.max() }
        let mapped = filtered.map{ $0.key }
        return mapped
        
    }
    
    
    func combinations(_ array: [Character]) -> [String] {
        if array.count == 0 { return [] }
        
        return (0..<array.count).flatMap { i -> [String] in
            var removedArray = array
            let elem = String(removedArray.remove(at: i))
            let combi = combinations(removedArray).map { elem + $0 }
            //print(elem, combi, [elem] + combi)
            return [elem] + combi
        }
    }
    
    func isPrime(_ number: Int) -> Bool {
        if number < 2 { return false }
        for i in 2..<number {
            if number % i == 0 { return false }
        }
        return true
    }
    
    func A10(_ numbers: String) -> Int {
        let array = numbers.flatMap{ String($0) }
        let com = combinations(array)
        print(com)
        let intSet = Set(com.compactMap { Int($0) })
        return intSet.filter{ isPrime($0) }.count
    }
    
    func A11(_ baseball:[[Int]]) -> Int {
        var result = Array(123 ..< 1000)
        
        for score in baseball {
            let scoreArr: [Character] = String(score[0]).map { $0 }
            var filteredArr: Array<Int> = []
            
            for input in result {
                var strike = 0
                var ball = 0
                let inputArr = String(input).map { $0 }
                
                if inputArr[0] == inputArr[1] || inputArr[0] == inputArr[2] || inputArr[1] == inputArr[2] || inputArr.contains("0") {
                    continue
                }
                
                for index in 0...2 {
                    if inputArr[index] == scoreArr[index] {
                        strike += 1
                    } else if scoreArr.contains(inputArr[index]) {
                        ball += 1
                    }
                }
                
                if strike == score[1], ball == score[2] {
                    filteredArr.append(input)
                }
            }
            
            result = filteredArr
        }
        
        return result.count
    }
    
}


