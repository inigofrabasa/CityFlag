/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Feed : Codable {
	let author : Author?
	let entry : [Entry]?
	let updated : Updated?
	let rights : Rights?
	let title : Title?
	let icon : Icon?
	let link : [Link]?
	let id : Id?

	enum CodingKeys: String, CodingKey {

		case author = "author"
		case entry = "entry"
		case updated = "updated"
		case rights = "rights"
		case title = "title"
		case icon = "icon"
		case link = "link"
		case id = "id"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		author = try values.decodeIfPresent(Author.self, forKey: .author)
		entry = try values.decodeIfPresent([Entry].self, forKey: .entry)
		updated = try values.decodeIfPresent(Updated.self, forKey: .updated)
		rights = try values.decodeIfPresent(Rights.self, forKey: .rights)
		title = try values.decodeIfPresent(Title.self, forKey: .title)
		icon = try values.decodeIfPresent(Icon.self, forKey: .icon)
		link = try values.decodeIfPresent([Link].self, forKey: .link)
		id = try values.decodeIfPresent(Id.self, forKey: .id)
	}
}
