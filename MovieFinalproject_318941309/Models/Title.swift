//
//  Movie.swift
//  MovieFinalproject_318941309
//
//  Created by חן איפרגן on 24/05/2022.
//

import Foundation
struct TrendingTitleResponse: Codable {
    let results : [Title]
    
    
}

struct Title: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
    


    
}
/*
 
 {
adult = 0;
"backdrop_path" = "/qK7Ssnrfvrt65F66A1thvehfQg2.jpg";
"genre_ids" =             (
 16,
 10751,
 35,
 12,
 9648
);
id = 420821;
"media_type" = movie;
"original_language" = en;
"original_title" = "Chip 'n Dale: Rescue Rangers";
overview = "Decades after their successful television series was canceled, Chip and Dale must repair their broken friendship and take on their Rescue Rangers detective personas once again when a former cast mate mysteriously disappears.";
popularity = "241.144";
"poster_path" = "/7UGmn8TyWPPzkjhLUW58cOUHjPS.jpg";
"release_date" = "2022-05-20";
title = "Chip 'n Dale: Rescue Rangers";
video = 0;
"vote_average" = "7.3";
"vote_count" = 192;
},
 
 
 
 
 */
