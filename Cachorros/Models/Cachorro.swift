//
//  Cachorro.swift
//  Cachorros
//
//  Created by Maria Eduarda Tupich on 27/10/21.
//

//item da  api

struct Cachorro: Codable {
    
    enum CodingKeys: String, CodingKey {
        case _id = "id"
        case name
        case wikilink
        case image
        case note
    }
    
    var _id         : String?
    var name        : String?
    var wikilink    : String?
    var image       : String?
    var note        : String?
    
    init(_id        : String? = nil,
        name        : String? = nil,
        wikilink    : String? = nil,
        image       : String? = nil,
        note        : String? = nil
    ) {
        self._id        = _id
        self.name       = name
        self.wikilink   = wikilink
        self.image      = image
        self.note       = note
    }
}

