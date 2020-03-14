/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Entry : Codable {
	let name : Name?
	let image : [Image]?
	let summary : Summary?
	let price : Price?
	let contentType : ContentType?
	let rights : Rights?
	let title : Title?
	let link : [Link]?
	let id : Id?
	let artist: Artist?
	let category: Category?
	let releaseDate: ReleaseDate?

	enum CodingKeys: String, CodingKey {

		case name = "im:name"
		case image = "im:image"
		case summary = "summary"
		case price = "im:price"
		case contentType = "im:contentType"
		case rights = "rights"
		case title = "title"
		case link = "link"
		case id = "id"
		case artist = "im:artist"
		case category = "category"
		case releaseDate = "im:releaseDate"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(Name.self, forKey: .name)
        image = try values.decodeIfPresent([Image].self, forKey: .image)
		summary = try values.decodeIfPresent(Summary.self, forKey: .summary)
		price = try values.decodeIfPresent(Price.self, forKey: .price)
		contentType = try values.decodeIfPresent(ContentType.self, forKey: .contentType)
		rights = try values.decodeIfPresent(Rights.self, forKey: .rights)
		title = try values.decodeIfPresent(Title.self, forKey: .title)
		link = try values.decodeIfPresent([Link].self, forKey: .link)
		id = try values.decodeIfPresent(Id.self, forKey: .id)
		artist = try values.decodeIfPresent(Artist.self, forKey: .artist)
		category = try values.decodeIfPresent(Category.self, forKey: .category)
		releaseDate = try values.decodeIfPresent(ReleaseDate.self, forKey: .releaseDate)
	}

}
