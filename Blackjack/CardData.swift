////
////  CardData.swift
////  Blackjack
////
////  Created by Noshaba Cheema on 11/9/14.
////  Copyright (c) 2014 Noshaba Cheema. All rights reserved.
////
//
//import Foundation
//
//func getAces() -> Array<Dictionary<String,String>> {
//    var data = [
//        [
//            "suite"     : "♣",
//            "rank"      : "Ace",
//            "value"     : "11",
//            "image"     : "1",
//            "imageBack" : "b2fv"
//        ],
//        [
//            "suite"     : "♠",
//            "rank"      : "Ace",
//            "value"     : "11",
//            "image"     : "2",
//            "imageBack" : "b2fv"
//        ],
//        [
//            "suite"     : "♡",
//            "rank"      : "Ace",
//            "value"     : "11",
//            "image"     : "3",
//            "imageBack" : "b2fv"
//        ],
//        [
//            "suite"     : "♢",
//            "rank"      : "Ace",
//            "value"     : "11",
//            "image"     : "4",
//            "imageBack" : "b2fv"
//        ]
//    ]
////        [
////            "suite"     : "♣",
////            "rank"      : "King",
////            "value"     : "10",
////            "image"     : "5",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♠",
////            "rank"      : "King",
////            "value"     : "10",
////            "image"     : "6",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♡",
////            "rank"      : "King",
////            "value"     : "10",
////            "image"     : "7",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♢",
////            "rank"      : "King",
////            "value"     : "10",
////            "image"     : "8",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♣",
////            "rank"      : "Queen",
////            "value"     : "10",
////            "image"     : "9",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♠",
////            "rank"      : "Queen",
////            "value"     : "10",
////            "image"     : "10",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♡",
////            "rank"      : "Queen",
////            "value"     : "10",
////            "image"     : "11",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♢",
////            "rank"      : "Queen",
////            "value"     : "10",
////            "image"     : "12",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♣",
////            "rank"      : "Jack",
////            "value"     : "10",
////            "image"     : "13",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♠",
////            "rank"      : "Jack",
////            "value"     : "10",
////            "image"     : "14",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♡",
////            "rank"      : "Jack",
////            "value"     : "10",
////            "image"     : "15",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♢",
////            "rank"      : "Jack",
////            "value"     : "10",
////            "image"     : "16",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♣",
////            "rank"      : "Ten",
////            "value"     : "10",
////            "image"     : "17",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♠",
////            "rank"      : "Ten",
////            "value"     : "10",
////            "image"     : "18",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♡",
////            "rank"      : "Ten",
////            "value"     : "10",
////            "image"     : "19",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♢",
////            "rank"      : "Ten",
////            "value"     : "10",
////            "image"     : "20",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♣",
////            "rank"      : "Nine",
////            "value"     : "9",
////            "image"     : "21",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♠",
////            "rank"      : "Nine",
////            "value"     : "9",
////            "image"     : "22",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♡",
////            "rank"      : "Nine",
////            "value"     : "9",
////            "image"     : "23",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♢",
////            "rank"      : "Nine",
////            "value"     : "9",
////            "image"     : "24",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♣",
////            "rank"      : "Eight",
////            "value"     : "8",
////            "image"     : "25",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♠",
////            "rank"      : "Eight",
////            "value"     : "8",
////            "image"     : "26",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♡",
////            "rank"      : "Eight",
////            "value"     : "8",
////            "image"     : "27",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♢",
////            "rank"      : "Eight",
////            "value"     : "8",
////            "image"     : "28",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♣",
////            "rank"      : "Seven",
////            "value"     : "7",
////            "image"     : "29",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♠",
////            "rank"      : "Seven",
////            "value"     : "7",
////            "image"     : "30",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♡",
////            "rank"      : "Seven",
////            "value"     : "7",
////            "image"     : "31",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♢",
////            "rank"      : "Seven",
////            "value"     : "7",
////            "image"     : "32",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♣",
////            "rank"      : "Six",
////            "value"     : "6",
////            "image"     : "33",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♠",
////            "rank"      : "Six",
////            "value"     : "6",
////            "image"     : "34",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♡",
////            "rank"      : "Six",
////            "value"     : "6",
////            "image"     : "35",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♢",
////            "rank"      : "Six",
////            "value"     : "6",
////            "image"     : "36",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♣",
////            "rank"      : "Five",
////            "value"     : "5",
////            "image"     : "37",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♠",
////            "rank"      : "Five",
////            "value"     : "5",
////            "image"     : "38",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♡",
////            "rank"      : "Five",
////            "value"     : "5",
////            "image"     : "39",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♢",
////            "rank"      : "Five",
////            "value"     : "5",
////            "image"     : "40",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♣",
////            "rank"      : "Four",
////            "value"     : "4",
////            "image"     : "41",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♠",
////            "rank"      : "Four",
////            "value"     : "4",
////            "image"     : "42",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♡",
////            "rank"      : "Four",
////            "value"     : "4",
////            "image"     : "43",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♢",
////            "rank"      : "Four",
////            "value"     : "4",
////            "image"     : "44",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♣",
////            "rank"      : "Three",
////            "value"     : "3",
////            "image"     : "45",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♠",
////            "rank"      : "Three",
////            "value"     : "3",
////            "image"     : "46",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♡",
////            "rank"      : "Three",
////            "value"     : "3",
////            "image"     : "47",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♢",
////            "rank"      : "Three",
////            "value"     : "3",
////            "image"     : "48",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♣",
////            "rank"      : "Two",
////            "value"     : "2",
////            "image"     : "49",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♠",
////            "rank"      : "Two",
////            "value"     : "2",
////            "image"     : "50",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♡",
////            "rank"      : "Two",
////            "value"     : "2",
////            "image"     : "51",
////            "imageBack" : "b2fv"
////        ],
////        [
////            "suite"     : "♢",
////            "rank"      : "Two",
////            "value"     : "2",
////            "image"     : "52",
////            "imageBack" : "b2fv"
////        ]
//
//    return data
//}
//
//func getKings() -> Array<Dictionary<String,String>> {
//    var data = [
//        [
//            "suite"     : "♣",
//            "rank"      : "King",
//            "value"     : "10",
//            "image"     : "5",
//            "imageBack" : "b2fv"
//        ],
//        [
//            "suite"     : "♠",
//            "rank"      : "King",
//            "value"     : "10",
//            "image"     : "6",
//            "imageBack" : "b2fv"
//        ],
//        [
//            "suite"     : "♡",
//            "rank"      : "King",
//            "value"     : "10",
//            "image"     : "7",
//            "imageBack" : "b2fv"
//        ],
//        [
//            "suite"     : "♢",
//            "rank"      : "King",
//            "value"     : "10",
//            "image"     : "8",
//            "imageBack" : "b2fv"
//        ]
//    ]
//    return data
//}
//
//func getQueens() ->  Array<Dictionary<String,String>>{
//    var data = [
//        [
//            "suite"     : "♣",
//            "rank"      : "Queen",
//            "value"     : "10",
//            "image"     : "9",
//            "imageBack" : "b2fv"
//        ],
//        [
//            "suite"     : "♠",
//            "rank"      : "Queen",
//            "value"     : "10",
//            "image"     : "10",
//            "imageBack" : "b2fv"
//        ],
//        [
//            "suite"     : "♡",
//            "rank"      : "Queen",
//            "value"     : "10",
//            "image"     : "11",
//            "imageBack" : "b2fv"
//        ],
//        [
//            "suite"     : "♢",
//            "rank"      : "Queen",
//            "value"     : "10",
//            "image"     : "12",
//            "imageBack" : "b2fv"
//        ]
//    ]
//    return data
//}
//
//func getJacks() ->  Array<Dictionary<String,String>>{
//    var data = [
//        [
//            "suite"     : "♣",
//            "rank"      : "Jack",
//            "value"     : "10",
//            "image"     : "13",
//            "imageBack" : "b2fv"
//        ],
//        [
//            "suite"     : "♠",
//            "rank"      : "Jack",
//            "value"     : "10",
//            "image"     : "14",
//            "imageBack" : "b2fv"
//        ],
//        [
//            "suite"     : "♡",
//            "rank"      : "Jack",
//            "value"     : "10",
//            "image"     : "15",
//            "imageBack" : "b2fv"
//        ],
//        [
//            "suite"     : "♢",
//            "rank"      : "Jack",
//            "value"     : "10",
//            "image"     : "16",
//            "imageBack" : "b2fv"
//        ]
//    ]
//    return data
//}
//
//func getTens() ->  Array<Dictionary<String,String>> {
//    var data = [
//        [
//            "suite"     : "♣",
//            "rank"      : "Ten",
//            "value"     : "10",
//            "image"     : "17",
//            "imageBack" : "b2fv"
//        ],
//        [
//            "suite"     : "♠",
//            "rank"      : "Ten",
//            "value"     : "10",
//            "image"     : "18",
//            "imageBack" : "b2fv"
//        ],
//        [
//            "suite"     : "♡",
//            "rank"      : "Ten",
//            "value"     : "10",
//            "image"     : "19",
//            "imageBack" : "b2fv"
//        ],
//        [
//            "suite"     : "♢",
//            "rank"      : "Ten",
//            "value"     : "10",
//            "image"     : "20",
//            "imageBack" : "b2fv"
//        ]
//    ]
//    return data
//}
//
//func getNines() -> Array<Dictionary<String,String>>{
//    var data = [
//        [
//            "suite"     : "♣",
//            "rank"      : "Nine",
//            "value"     : "9",
//            "image"     : "21",
//            "imageBack" : "b2fv"
//        ],
//        [
//            "suite"     : "♠",
//            "rank"      : "Nine",
//            "value"     : "9",
//            "image"     : "22",
//            "imageBack" : "b2fv"
//        ],
//        [
//            "suite"     : "♡",
//            "rank"      : "Nine",
//            "value"     : "9",
//            "image"     : "23",
//            "imageBack" : "b2fv"
//        ],
//        [
//            "suite"     : "♢",
//            "rank"      : "Nine",
//            "value"     : "9",
//            "image"     : "24",
//            "imageBack" : "b2fv"
//        ]
//    ]
//    return data
//}
//
//    //        [
//    //            "suite"     : "♣",
//    //            "rank"      : "Nine",
//    //            "value"     : "9",
//    //            "image"     : "21",
//    //            "imageBack" : "b2fv"
//    //        ],
//    //        [
//    //            "suite"     : "♠",
//    //            "rank"      : "Nine",
//    //            "value"     : "9",
//    //            "image"     : "22",
//    //            "imageBack" : "b2fv"
//    //        ],
//    //        [
//    //            "suite"     : "♡",
//    //            "rank"      : "Nine",
//    //            "value"     : "9",
//    //            "image"     : "23",
//    //            "imageBack" : "b2fv"
//    //        ],
//    //        [
//    //            "suite"     : "♢",
//    //            "rank"      : "Nine",
//    //            "value"     : "9",
//    //            "image"     : "24",
//    //            "imageBack" : "b2fv"
//    //        ],
//    //        [
//    //            "suite"     : "♣",
//    //            "rank"      : "Eight",
//    //            "value"     : "8",
//    //            "image"     : "25",
//    //            "imageBack" : "b2fv"
//    //        ],
//    //        [
//    //            "suite"     : "♠",
//    //            "rank"      : "Eight",
//    //            "value"     : "8",
//    //            "image"     : "26",
//    //            "imageBack" : "b2fv"
//    //        ],
//    //        [
//    //            "suite"     : "♡",
//    //            "rank"      : "Eight",
//    //            "value"     : "8",
//    //            "image"     : "27",
//    //            "imageBack" : "b2fv"
//    //        ],
//    //        [
//    //            "suite"     : "♢",
//    //            "rank"      : "Eight",
//    //            "value"     : "8",
//    //            "image"     : "28",
//    //            "imageBack" : "b2fv"
//    //        ],
//    //        [
//    //            "suite"     : "♣",
//    //            "rank"      : "Seven",
//    //            "value"     : "7",
//    //            "image"     : "29",
//    //            "imageBack" : "b2fv"
//    //        ],
//    //        [
//    //            "suite"     : "♠",
//    //            "rank"      : "Seven",
//    //            "value"     : "7",
//    //            "image"     : "30",
//    //            "imageBack" : "b2fv"
//    //        ],
//    //        [
//    //            "suite"     : "♡",
//    //            "rank"      : "Seven",
//    //            "value"     : "7",
//    //            "image"     : "31",
//    //            "imageBack" : "b2fv"
//    //        ],
//    //        [
//    //            "suite"     : "♢",
//    //            "rank"      : "Seven",
//    //            "value"     : "7",
//    //            "image"     : "32",
//    //            "imageBack" : "b2fv"
//    //        ],
//    //        [
//    //            "suite"     : "♣",
//    //            "rank"      : "Six",
//    //            "value"     : "6",
//    //            "image"     : "33",
//    //            "imageBack" : "b2fv"
//    //        ],
//    //        [
//    //            "suite"     : "♠",
//    //            "rank"      : "Six",
//    //            "value"     : "6",
//    //            "image"     : "34",
//    //            "imageBack" : "b2fv"
//    //        ],
//    //        [
//    //            "suite"     : "♡",
//    //            "rank"      : "Six",
//    //            "value"     : "6",
//    //            "image"     : "35",
//    //            "imageBack" : "b2fv"
//    //        ],
//    //        [
//    //            "suite"     : "♢",
//    //            "rank"      : "Six",
//    //            "value"     : "6",
//    //            "image"     : "36",
//    //            "imageBack" : "b2fv"
//    //        ],
//    //        [
//    //            "suite"     : "♣",
//    //            "rank"      : "Five",
//    //            "value"     : "5",
//    //            "image"     : "37",
//    //            "imageBack" : "b2fv"
//    //        ],
//    //        [
//    //            "suite"     : "♠",
//    //            "rank"      : "Five",
//    //            "value"     : "5",
//    //            "image"     : "38",
//    //            "imageBack" : "b2fv"
//    //        ],
//    //        [
//    //            "suite"     : "♡",
//    //            "rank"      : "Five",
//    //            "value"     : "5",
//    //            "image"     : "39",
//    //            "imageBack" : "b2fv"
//    //        ],
//    //        [
//    //            "suite"     : "♢",
//    //            "rank"      : "Five",
//    //            "value"     : "5",
//    //            "image"     : "40",
//    //            "imageBack" : "b2fv"
//    //        ],
//    //        [
//    //            "suite"     : "♣",
//    //            "rank"      : "Four",
//    //            "value"     : "4",
//    //            "image"     : "41",
//    //            "imageBack" : "b2fv"
//    //        ],
//    //        [
//    //            "suite"     : "♠",
//    //            "rank"      : "Four",
//    //            "value"     : "4",
//    //            "image"     : "42",
//    //            "imageBack" : "b2fv"
//    //        ],
//    //        [
//    //            "suite"     : "♡",
//    //            "rank"      : "Four",
//    //            "value"     : "4",
//    //            "image"     : "43",
//    //            "imageBack" : "b2fv"
//    //        ],
//    //        [
//    //            "suite"     : "♢",
//    //            "rank"      : "Four",
//    //            "value"     : "4",
//    //            "image"     : "44",
//    //            "imageBack" : "b2fv"
//    //        ],
//    //        [
//    //            "suite"     : "♣",
//    //            "rank"      : "Three",
//    //            "value"     : "3",
//    //            "image"     : "45",
//    //            "imageBack" : "b2fv"
//    //        ],
//    //        [
//    //            "suite"     : "♠",
//    //            "rank"      : "Three",
//    //            "value"     : "3",
//    //            "image"     : "46",
//    //            "imageBack" : "b2fv"
//    //        ],
//    //        [
//    //            "suite"     : "♡",
//    //            "rank"      : "Three",
//    //            "value"     : "3",
//    //            "image"     : "47",
//    //            "imageBack" : "b2fv"
//    //        ],
//    //        [
//    //            "suite"     : "♢",
//    //            "rank"      : "Three",
//    //            "value"     : "3",
//    //            "image"     : "48",
//    //            "imageBack" : "b2fv"
//    //        ],
//    //        [
//    //            "suite"     : "♣",
//    //            "rank"      : "Two",
//    //            "value"     : "2",
//    //            "image"     : "49",
//    //            "imageBack" : "b2fv"
//    //        ],
//    //        [
//    //            "suite"     : "♠",
//    //            "rank"      : "Two",
//    //            "value"     : "2",
//    //            "image"     : "50",
//    //            "imageBack" : "b2fv"
//    //        ],
//    //        [
//    //            "suite"     : "♡",
//    //            "rank"      : "Two",
//    //            "value"     : "2",
//    //            "image"     : "51",
//    //            "imageBack" : "b2fv"
//    //        ],
//    //        [
//    //            "suite"     : "♢",
//    //            "rank"      : "Two",
//    //            "value"     : "2",
//    //            "image"     : "52",
//    //            "imageBack" : "b2fv"
//    //        ]