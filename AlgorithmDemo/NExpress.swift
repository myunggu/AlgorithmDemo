//
//  NExpress.swift
//  AlgorithmDemo
//
//  Created by MyungGu Kim on 2021/04/23.
//  Copyright © 2021 Myunggu Kim. All rights reserved.
//

import UIKit

/*
 제목 : N으로 표현
 출제소스 : https://programmers.co.kr/learn/courses/30/lessons/42895?language=swift
 
 문제 설명

 아래와 같이 5와 사칙연산만으로 12를 표현할 수 있습니다.
 12 = 5 + 5 + (5 / 5) + (5 / 5)
 12 = 55 / 5 + 5 / 5
 12 = (55 + 5) / 5
 5를 사용한 횟수는 각각 6,5,4 입니다. 그리고 이중 가장 작은 경우는 4입니다.
 이처럼 숫자 N과 number가 주어질 때, N과 사칙연산만 사용해서 표현 할 수 있는 방법 중 N 사용횟수의 최솟값을 return 하도록 solution 함수를 작성하세요.
 제한사항
 N은 1 이상 9 이하입니다.
 number는 1 이상 32,000 이하입니다.
 수식에는 괄호와 사칙연산만 가능하며 나누기 연산에서 나머지는 무시합니다.
 최솟값이 8보다 크면 -1을 return 합니다.
 입출력 예
 N    number    return
 5    12    4
 2    11    3
 입출력 예 설명
 예제 #1
 문제에 나온 예와 같습니다.
 예제 #2
 11 = 22 / 2와 같이 2를 3번만 사용하여 표현할 수 있습니다.
 */
 
class NExpress: NSObject {

    // N과 ()+-*/ 만을 사용해서 number를 표현
    // 1 <= N <= 9
    // 1 <= number <= 32000
    // 최솟값이 8보다 크면 -1을 return 합니다.
    
    
    
    func doTest() {
        //let result = solution(5, 12) => 4
        //let result = solution(2, 11) => 3
        let result = solution(1,1121)
        print("result: \(result)")
    }
    
    func solution(_ N:Int, _ number:Int) -> Int {
        
        func dfs(_ countN:Int, _ sum : Int){
            if countN > 8 {return }
            if sum==number, (countN < answer || answer == -1) {
                print(countN)
                answer = countN
                return
            }
            var nn = 0
            for i in 0..<8 {
                nn = nn*10 + N
                dfs(countN + 1 + i, sum + nn)
                dfs(countN + 1 + i, sum - nn)
                dfs(countN + 1 + i, sum * nn)
                dfs(countN + 1 + i, sum / nn)
            }
        }
        
        var answer = -1
        dfs(0,0)
        return answer
    }
    
}
