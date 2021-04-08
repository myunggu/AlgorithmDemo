//
//  BestAlbum.swift
//  AlgorithmDemo
//
//  Created by MyungGu Kim on 2021/04/08.
//  Copyright © 2021 Myunggu Kim. All rights reserved.
//

import UIKit


/*
 출제소스 : https://programmers.co.kr/learn/courses/30/lessons/42579?language=swift
 
 문제 설명

 스트리밍 사이트에서 장르 별로 가장 많이 재생된 노래를 두 개씩 모아 베스트 앨범을 출시하려 합니다. 노래는 고유 번호로 구분하며, 노래를 수록하는 기준은 다음과 같습니다.
 속한 노래가 많이 재생된 장르를 먼저 수록합니다.
 장르 내에서 많이 재생된 노래를 먼저 수록합니다.
 장르 내에서 재생 횟수가 같은 노래 중에서는 고유 번호가 낮은 노래를 먼저 수록합니다.
 노래의 장르를 나타내는 문자열 배열 genres와 노래별 재생 횟수를 나타내는 정수 배열 plays가 주어질 때, 베스트 앨범에 들어갈 노래의 고유 번호를 순서대로 return 하도록 solution 함수를 완성하세요.
 제한사항
 genres[i]는 고유번호가 i인 노래의 장르입니다.
 plays[i]는 고유번호가 i인 노래가 재생된 횟수입니다.
 genres와 plays의 길이는 같으며, 이는 1 이상 10,000 이하입니다.
 장르 종류는 100개 미만입니다.
 장르에 속한 곡이 하나라면, 하나의 곡만 선택합니다.
 모든 장르는 재생된 횟수가 다릅니다.
 입출력 예
 genres    plays    return
 ["classic", "pop", "classic", "classic", "pop"]    [500, 600, 150, 800, 2500]    [4, 1, 3, 0]
 입출력 예 설명
 classic 장르는 1,450회 재생되었으며, classic 노래는 다음과 같습니다.
 고유 번호 3: 800회 재생
 고유 번호 0: 500회 재생
 고유 번호 2: 150회 재생
 pop 장르는 3,100회 재생되었으며, pop 노래는 다음과 같습니다.
 고유 번호 4: 2,500회 재생
 고유 번호 1: 600회 재생
 따라서 pop 장르의 [4, 1]번 노래를 먼저, classic 장르의 [3, 0]번 노래를 그다음에 수록합니다.
 ※ 공지 - 2019년 2월 28일 테스트케이스가 추가되었습니다.
*/

class BestAlbum: NSObject {
    
    func doTest() {
        let genres: Array<String> = ["classic", "pop", "classic", "classic", "pop"]
        let plays: Array<Int> = [500, 600, 150, 800, 2500];
        let result = solution(genres, plays)
        print(result)
    }

    func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
        //해싱
        let genresSet = Set(genres)
        var genresDic: Dictionary<String,[Int]> = [:]
        for genre in genresSet {
            genresDic[genre] = []
        }
        
        for (index, _) in plays.enumerated() {
            let genre: String = genres[index]
            genresDic[genre]?.append(index)
        }
        
        // 장르내 내림차순으로 정렬
        genresDic = genresDic.mapValues { (values) -> [Int] in
            return values.sorted { (playIndex1, playIndex2) -> Bool in
                let playIndex1Count = plays[playIndex1]
                let playIndex2Count = plays[playIndex2]
                //1. 장르 내에서 많이 재생된 노래를 먼저 수록합니다.
                //2. 장르 내에서 재생 횟수가 같은 노래 중에서는 고유 번호가 낮은 노래를 먼저 수록합니다.
                if playIndex1Count == playIndex2Count {
                    return playIndex1 < playIndex2
                } else {
                    return playIndex1Count > playIndex2Count
                }
            }
        }
        
        //장르별 내림차순 정렬
        let sortedGenres = genresDic.sorted { (first, second) -> Bool in
            let firstSum = first.value.reduce(0, { (result, playIndex) -> Int in
                return result + plays[playIndex]
            })
            let secondSum = second.value.reduce(0, { (result, playIndex) -> Int in
                return result + plays[playIndex]
            })
            return firstSum > secondSum
        }
        
        var albumList = Array<Int>()
        for genre in sortedGenres {
            for (index, element) in genre.value.enumerated() {
                if index < 2 {
                    albumList.append(element)
                } else {
                    break
                }
            }
        }
        
        return albumList
    }
}
