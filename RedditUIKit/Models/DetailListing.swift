// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let listing = try? newJSONDecoder().decode(Listing.self, from: jsonData)

import Foundation

// MARK: - ListingElement
struct ListingElement: Codable {
    let kind: String
    let data: ListingData
}

// MARK: - ListingData
struct ListingData: Codable {
    let modhash: String
    let dist: Int?
    let children: [PurpleChild]
    let after, before: JSONNull?
}

// MARK: - PurpleChild
struct PurpleChild: Codable {
    let kind: String
    let data: PurpleData
}

// MARK: - PurpleData
struct PurpleData: Codable {
    let approvedAtUTC: JSONNull?
    let subreddit: String
    let selftext: String?
    let userReports: [JSONAny]
    let saved: Bool
    let modReasonTitle: JSONNull?
    let gilded: Int
    let clicked: Bool?
    let title: String?
    let linkFlairRichtext: [JSONAny]?
    let subredditNamePrefixed: String
    let hidden: Bool?
    let pwls: Int?
    let linkFlairCSSClass: JSONNull?
    let downs: Int
    let thumbnailHeight: Int?
    let parentWhitelistStatus: String?
    let hideScore: Bool?
    let name: String
    let quarantine: Bool?
    let linkFlairTextColor: String?
    let upvoteRatio: Double?
    let authorFlairBackgroundColor: JSONNull?
    let subredditType: String
    let ups, totalAwardsReceived: Int
    let mediaEmbed: Gildings?
    let thumbnailWidth: Int?
    let authorFlairTemplateID: JSONNull?
    let isOriginalContent: Bool?
    let authorFullname: String
    let secureMedia: JSONNull?
    let isRedditMediaDomain, isMeta: Bool?
    let category: JSONNull?
    let secureMediaEmbed: Gildings?
    let linkFlairText: JSONNull?
    let canModPost: Bool
    let numDuplicates: Int?
    let approvedBy: JSONNull?
    let thumbnail: String?
    let edited: Bool
    let authorFlairCSSClass: JSONNull?
    let stewardReports, authorFlairRichtext: [JSONAny]
    let gildings: Gildings
    let postHint: String?
    let contentCategories: JSONNull?
    let isSelf: Bool?
    let modNote: JSONNull?
    let created: Int
    let linkFlairType: String?
    let wls: Int?
    let bannedBy: JSONNull?
    let authorFlairType: String
    let domain: String?
    let allowLiveComments: Bool?
    let selftextHTML: JSONNull?
    let likes: JSONNull?
    let suggestedSort: JSONNull?
    let bannedAtUTC: JSONNull?
    let viewCount: JSONNull?
    let archived: Bool
    let score: Int
    let noFollow: Bool
    let isCrosspostable, pinned, over18: Bool?
    let preview: Preview?
    let allAwardings, awarders: [JSONAny]
    let mediaOnly: Bool?
    let canGild: Bool
    let spoiler: Bool?
    let locked: Bool
    let authorFlairText: JSONNull?
    let visited: Bool?
    let numReports, distinguished: JSONNull?
    let subredditID: String
    let modReasonBy, removalReason: JSONNull?
    let linkFlairBackgroundColor: String?
    let id: String
    let isRobotIndexable: Bool?
    let reportReasons: JSONNull?
    let author: String
    let discussionType: JSONNull?
    let numComments: Int?
    let sendReplies: Bool
    let media: JSONNull?
    let contestMode: Bool?
    let authorPatreonFlair: Bool
    let authorFlairTextColor: JSONNull?
    let permalink: String
    let whitelistStatus: String?
    let stickied: Bool
    let url: String?
    let subredditSubscribers: Int?
    let createdUTC: Int
    let numCrossposts: Int?
    let modReports: [JSONAny]
    let isVideo: Bool?
    let linkID: String?
    let replies: IndigoReplies?
    let parentID, body: String?
    let isSubmitter: Bool?
    let bodyHTML: String?
    let collapsedReason: JSONNull?
    let scoreHidden, collapsed: Bool?
    let controversiality, depth: Int?

    enum CodingKeys: String, CodingKey {
        case approvedAtUTC = "approved_at_utc"
        case subreddit, selftext
        case userReports = "user_reports"
        case saved
        case modReasonTitle = "mod_reason_title"
        case gilded, clicked, title
        case linkFlairRichtext = "link_flair_richtext"
        case subredditNamePrefixed = "subreddit_name_prefixed"
        case hidden, pwls
        case linkFlairCSSClass = "link_flair_css_class"
        case downs
        case thumbnailHeight = "thumbnail_height"
        case parentWhitelistStatus = "parent_whitelist_status"
        case hideScore = "hide_score"
        case name, quarantine
        case linkFlairTextColor = "link_flair_text_color"
        case upvoteRatio = "upvote_ratio"
        case authorFlairBackgroundColor = "author_flair_background_color"
        case subredditType = "subreddit_type"
        case ups
        case totalAwardsReceived = "total_awards_received"
        case mediaEmbed = "media_embed"
        case thumbnailWidth = "thumbnail_width"
        case authorFlairTemplateID = "author_flair_template_id"
        case isOriginalContent = "is_original_content"
        case authorFullname = "author_fullname"
        case secureMedia = "secure_media"
        case isRedditMediaDomain = "is_reddit_media_domain"
        case isMeta = "is_meta"
        case category
        case secureMediaEmbed = "secure_media_embed"
        case linkFlairText = "link_flair_text"
        case canModPost = "can_mod_post"
        case numDuplicates = "num_duplicates"
        case approvedBy = "approved_by"
        case thumbnail, edited
        case authorFlairCSSClass = "author_flair_css_class"
        case stewardReports = "steward_reports"
        case authorFlairRichtext = "author_flair_richtext"
        case gildings
        case postHint = "post_hint"
        case contentCategories = "content_categories"
        case isSelf = "is_self"
        case modNote = "mod_note"
        case created
        case linkFlairType = "link_flair_type"
        case wls
        case bannedBy = "banned_by"
        case authorFlairType = "author_flair_type"
        case domain
        case allowLiveComments = "allow_live_comments"
        case selftextHTML = "selftext_html"
        case likes
        case suggestedSort = "suggested_sort"
        case bannedAtUTC = "banned_at_utc"
        case viewCount = "view_count"
        case archived, score
        case noFollow = "no_follow"
        case isCrosspostable = "is_crosspostable"
        case pinned
        case over18 = "over_18"
        case preview
        case allAwardings = "all_awardings"
        case awarders
        case mediaOnly = "media_only"
        case canGild = "can_gild"
        case spoiler, locked
        case authorFlairText = "author_flair_text"
        case visited
        case numReports = "num_reports"
        case distinguished
        case subredditID = "subreddit_id"
        case modReasonBy = "mod_reason_by"
        case removalReason = "removal_reason"
        case linkFlairBackgroundColor = "link_flair_background_color"
        case id
        case isRobotIndexable = "is_robot_indexable"
        case reportReasons = "report_reasons"
        case author
        case discussionType = "discussion_type"
        case numComments = "num_comments"
        case sendReplies = "send_replies"
        case media
        case contestMode = "contest_mode"
        case authorPatreonFlair = "author_patreon_flair"
        case authorFlairTextColor = "author_flair_text_color"
        case permalink
        case whitelistStatus = "whitelist_status"
        case stickied, url
        case subredditSubscribers = "subreddit_subscribers"
        case createdUTC = "created_utc"
        case numCrossposts = "num_crossposts"
        case modReports = "mod_reports"
        case isVideo = "is_video"
        case linkID = "link_id"
        case replies
        case parentID = "parent_id"
        case body
        case isSubmitter = "is_submitter"
        case bodyHTML = "body_html"
        case collapsedReason = "collapsed_reason"
        case scoreHidden = "score_hidden"
        case collapsed, controversiality, depth
    }
}

// MARK: - Gildings
struct Gildings: Codable {
}

// MARK: - Preview
struct Preview: Codable {
    let images: [Image]
    let enabled: Bool
}

// MARK: - Image
struct Image: Codable {
    let source: Source
    let resolutions: [Source]
    let variants: Gildings
    let id: String
}

// MARK: - Source
struct Source: Codable {
    let url: String
    let width, height: Int
}

enum IndigoReplies: Codable {
    case purpleReplies(PurpleReplies)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        if let x = try? container.decode(PurpleReplies.self) {
            self = .purpleReplies(x)
            return
        }
        throw DecodingError.typeMismatch(IndigoReplies.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for IndigoReplies"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .purpleReplies(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

// MARK: - PurpleReplies
struct PurpleReplies: Codable {
    let kind: String
    let data: FluffyData
}

// MARK: - FluffyData
struct FluffyData: Codable {
    let modhash: String
    let dist: JSONNull?
    let children: [FluffyChild]
    let after, before: JSONNull?
}

// MARK: - FluffyChild
struct FluffyChild: Codable {
    let kind: String
    let data: TentacledData
}

// MARK: - TentacledData
struct TentacledData: Codable {
    let totalAwardsReceived: Int
    let approvedAtUTC: JSONNull?
    let ups: Int
    let awarders: [JSONAny]
    let modReasonBy, bannedBy: JSONNull?
    let authorFlairType: String
    let removalReason: JSONNull?
    let linkID: String
    let authorFlairTemplateID, likes: JSONNull?
    let replies: FluffyReplies
    let userReports: [JSONAny]
    let saved: Bool
    let id: String
    let bannedAtUTC, modReasonTitle: JSONNull?
    let gilded: Int
    let archived, noFollow: Bool
    let author: String
    let canModPost, sendReplies: Bool
    let parentID: String
    let score: Int
    let authorFullname: String
    let reportReasons, approvedBy: JSONNull?
    let allAwardings: [JSONAny]
    let subredditID, body: String
    let edited: Bool
    let authorFlairCSSClass: JSONNull?
    let stewardReports: [JSONAny]
    let isSubmitter: Bool
    let downs: Int
    let authorFlairRichtext: [JSONAny]
    let authorPatreonFlair: Bool
    let bodyHTML: String
    let gildings: Gildings
    let collapsedReason: JSONNull?
    let stickied: Bool
    let subredditType: String
    let canGild: Bool
    let subreddit: String
    let authorFlairTextColor: JSONNull?
    let scoreHidden: Bool
    let permalink: String
    let numReports: JSONNull?
    let locked: Bool
    let name: String
    let created: Int
    let authorFlairText: JSONNull?
    let collapsed: Bool
    let createdUTC: Int
    let subredditNamePrefixed: String
    let controversiality, depth: Int
    let authorFlairBackgroundColor: JSONNull?
    let modReports: [JSONAny]
    let modNote, distinguished: JSONNull?

    enum CodingKeys: String, CodingKey {
        case totalAwardsReceived = "total_awards_received"
        case approvedAtUTC = "approved_at_utc"
        case ups, awarders
        case modReasonBy = "mod_reason_by"
        case bannedBy = "banned_by"
        case authorFlairType = "author_flair_type"
        case removalReason = "removal_reason"
        case linkID = "link_id"
        case authorFlairTemplateID = "author_flair_template_id"
        case likes, replies
        case userReports = "user_reports"
        case saved, id
        case bannedAtUTC = "banned_at_utc"
        case modReasonTitle = "mod_reason_title"
        case gilded, archived
        case noFollow = "no_follow"
        case author
        case canModPost = "can_mod_post"
        case sendReplies = "send_replies"
        case parentID = "parent_id"
        case score
        case authorFullname = "author_fullname"
        case reportReasons = "report_reasons"
        case approvedBy = "approved_by"
        case allAwardings = "all_awardings"
        case subredditID = "subreddit_id"
        case body, edited
        case authorFlairCSSClass = "author_flair_css_class"
        case stewardReports = "steward_reports"
        case isSubmitter = "is_submitter"
        case downs
        case authorFlairRichtext = "author_flair_richtext"
        case authorPatreonFlair = "author_patreon_flair"
        case bodyHTML = "body_html"
        case gildings
        case collapsedReason = "collapsed_reason"
        case stickied
        case subredditType = "subreddit_type"
        case canGild = "can_gild"
        case subreddit
        case authorFlairTextColor = "author_flair_text_color"
        case scoreHidden = "score_hidden"
        case permalink
        case numReports = "num_reports"
        case locked, name, created
        case authorFlairText = "author_flair_text"
        case collapsed
        case createdUTC = "created_utc"
        case subredditNamePrefixed = "subreddit_name_prefixed"
        case controversiality, depth
        case authorFlairBackgroundColor = "author_flair_background_color"
        case modReports = "mod_reports"
        case modNote = "mod_note"
        case distinguished
    }
}

// MARK: - FluffyReplies
struct FluffyReplies: Codable {
    let kind: String
    let data: StickyData
}

// MARK: - StickyData
struct StickyData: Codable {
    let modhash: String
    let dist: JSONNull?
    let children: [TentacledChild]
    let after, before: JSONNull?
}

// MARK: - TentacledChild
struct TentacledChild: Codable {
    let kind: String
    let data: IndigoData
}

// MARK: - IndigoData
struct IndigoData: Codable {
    let totalAwardsReceived: Int
    let approvedAtUTC: JSONNull?
    let ups: Int
    let awarders: [JSONAny]
    let modReasonBy, bannedBy: JSONNull?
    let authorFlairType: String
    let removalReason: JSONNull?
    let linkID: String
    let authorFlairTemplateID, likes: JSONNull?
    let replies: TentacledReplies
    let userReports: [JSONAny]
    let saved: Bool
    let id: String
    let bannedAtUTC, modReasonTitle: JSONNull?
    let gilded: Int
    let archived, noFollow: Bool
    let author: String
    let canModPost, sendReplies: Bool
    let parentID: String
    let score: Int
    let authorFullname: String
    let reportReasons, approvedBy: JSONNull?
    let allAwardings: [JSONAny]
    let subredditID, body: String
    let edited: Bool
    let authorFlairCSSClass: JSONNull?
    let stewardReports: [JSONAny]
    let isSubmitter: Bool
    let downs: Int
    let authorFlairRichtext: [JSONAny]
    let authorPatreonFlair: Bool
    let bodyHTML: String
    let gildings: Gildings
    let collapsedReason: JSONNull?
    let stickied: Bool
    let subredditType: String
    let canGild: Bool
    let subreddit: String
    let authorFlairTextColor: JSONNull?
    let scoreHidden: Bool
    let permalink: String
    let numReports: JSONNull?
    let locked: Bool
    let name: String
    let created: Int
    let authorFlairText: JSONNull?
    let collapsed: Bool
    let createdUTC: Int
    let subredditNamePrefixed: String
    let controversiality, depth: Int
    let authorFlairBackgroundColor: JSONNull?
    let modReports: [JSONAny]
    let modNote, distinguished: JSONNull?

    enum CodingKeys: String, CodingKey {
        case totalAwardsReceived = "total_awards_received"
        case approvedAtUTC = "approved_at_utc"
        case ups, awarders
        case modReasonBy = "mod_reason_by"
        case bannedBy = "banned_by"
        case authorFlairType = "author_flair_type"
        case removalReason = "removal_reason"
        case linkID = "link_id"
        case authorFlairTemplateID = "author_flair_template_id"
        case likes, replies
        case userReports = "user_reports"
        case saved, id
        case bannedAtUTC = "banned_at_utc"
        case modReasonTitle = "mod_reason_title"
        case gilded, archived
        case noFollow = "no_follow"
        case author
        case canModPost = "can_mod_post"
        case sendReplies = "send_replies"
        case parentID = "parent_id"
        case score
        case authorFullname = "author_fullname"
        case reportReasons = "report_reasons"
        case approvedBy = "approved_by"
        case allAwardings = "all_awardings"
        case subredditID = "subreddit_id"
        case body, edited
        case authorFlairCSSClass = "author_flair_css_class"
        case stewardReports = "steward_reports"
        case isSubmitter = "is_submitter"
        case downs
        case authorFlairRichtext = "author_flair_richtext"
        case authorPatreonFlair = "author_patreon_flair"
        case bodyHTML = "body_html"
        case gildings
        case collapsedReason = "collapsed_reason"
        case stickied
        case subredditType = "subreddit_type"
        case canGild = "can_gild"
        case subreddit
        case authorFlairTextColor = "author_flair_text_color"
        case scoreHidden = "score_hidden"
        case permalink
        case numReports = "num_reports"
        case locked, name, created
        case authorFlairText = "author_flair_text"
        case collapsed
        case createdUTC = "created_utc"
        case subredditNamePrefixed = "subreddit_name_prefixed"
        case controversiality, depth
        case authorFlairBackgroundColor = "author_flair_background_color"
        case modReports = "mod_reports"
        case modNote = "mod_note"
        case distinguished
    }
}

// MARK: - TentacledReplies
struct TentacledReplies: Codable {
    let kind: String
    let data: IndecentData
}

// MARK: - IndecentData
struct IndecentData: Codable {
    let modhash: String
    let dist: JSONNull?
    let children: [StickyChild]
    let after, before: JSONNull?
}

// MARK: - StickyChild
struct StickyChild: Codable {
    let kind: String
    let data: HilariousData
}

// MARK: - HilariousData
struct HilariousData: Codable {
    let totalAwardsReceived: Int
    let approvedAtUTC: JSONNull?
    let ups: Int
    let awarders: [JSONAny]
    let modReasonBy, bannedBy: JSONNull?
    let authorFlairType: String
    let removalReason: JSONNull?
    let linkID: String
    let authorFlairTemplateID, likes: JSONNull?
    let replies: IndecentReplies
    let userReports: [JSONAny]
    let saved: Bool
    let id: String
    let bannedAtUTC, modReasonTitle: JSONNull?
    let gilded: Int
    let archived, noFollow: Bool
    let author: String
    let canModPost, sendReplies: Bool
    let parentID: String
    let score: Int
    let authorFullname: String
    let reportReasons, approvedBy: JSONNull?
    let allAwardings: [JSONAny]
    let subredditID, body: String
    let edited: Edited
    let authorFlairCSSClass: JSONNull?
    let stewardReports: [JSONAny]
    let isSubmitter: Bool
    let downs: Int
    let authorFlairRichtext: [JSONAny]
    let authorPatreonFlair: Bool
    let bodyHTML: String
    let gildings: Gildings
    let collapsedReason: JSONNull?
    let stickied: Bool
    let subredditType: String
    let canGild: Bool
    let subreddit: String
    let authorFlairTextColor: JSONNull?
    let scoreHidden: Bool
    let permalink: String
    let numReports: JSONNull?
    let locked: Bool
    let name: String
    let created: Int
    let authorFlairText: JSONNull?
    let collapsed: Bool
    let createdUTC: Int
    let subredditNamePrefixed: String
    let controversiality, depth: Int
    let authorFlairBackgroundColor: JSONNull?
    let modReports: [JSONAny]
    let modNote, distinguished: JSONNull?

    enum CodingKeys: String, CodingKey {
        case totalAwardsReceived = "total_awards_received"
        case approvedAtUTC = "approved_at_utc"
        case ups, awarders
        case modReasonBy = "mod_reason_by"
        case bannedBy = "banned_by"
        case authorFlairType = "author_flair_type"
        case removalReason = "removal_reason"
        case linkID = "link_id"
        case authorFlairTemplateID = "author_flair_template_id"
        case likes, replies
        case userReports = "user_reports"
        case saved, id
        case bannedAtUTC = "banned_at_utc"
        case modReasonTitle = "mod_reason_title"
        case gilded, archived
        case noFollow = "no_follow"
        case author
        case canModPost = "can_mod_post"
        case sendReplies = "send_replies"
        case parentID = "parent_id"
        case score
        case authorFullname = "author_fullname"
        case reportReasons = "report_reasons"
        case approvedBy = "approved_by"
        case allAwardings = "all_awardings"
        case subredditID = "subreddit_id"
        case body, edited
        case authorFlairCSSClass = "author_flair_css_class"
        case stewardReports = "steward_reports"
        case isSubmitter = "is_submitter"
        case downs
        case authorFlairRichtext = "author_flair_richtext"
        case authorPatreonFlair = "author_patreon_flair"
        case bodyHTML = "body_html"
        case gildings
        case collapsedReason = "collapsed_reason"
        case stickied
        case subredditType = "subreddit_type"
        case canGild = "can_gild"
        case subreddit
        case authorFlairTextColor = "author_flair_text_color"
        case scoreHidden = "score_hidden"
        case permalink
        case numReports = "num_reports"
        case locked, name, created
        case authorFlairText = "author_flair_text"
        case collapsed
        case createdUTC = "created_utc"
        case subredditNamePrefixed = "subreddit_name_prefixed"
        case controversiality, depth
        case authorFlairBackgroundColor = "author_flair_background_color"
        case modReports = "mod_reports"
        case modNote = "mod_note"
        case distinguished
    }
}

enum Edited: Codable {
    case bool(Bool)
    case integer(Int)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Bool.self) {
            self = .bool(x)
            return
        }
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        throw DecodingError.typeMismatch(Edited.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Edited"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let x):
            try container.encode(x)
        case .integer(let x):
            try container.encode(x)
        }
    }
}

enum IndecentReplies: Codable {
    case stickyReplies(StickyReplies)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        if let x = try? container.decode(StickyReplies.self) {
            self = .stickyReplies(x)
            return
        }
        throw DecodingError.typeMismatch(IndecentReplies.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for IndecentReplies"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .stickyReplies(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

// MARK: - StickyReplies
struct StickyReplies: Codable {
    let kind: String
    let data: AmbitiousData
}

// MARK: - AmbitiousData
struct AmbitiousData: Codable {
    let modhash: String
    let dist: JSONNull?
    let children: [IndigoChild]
    let after, before: JSONNull?
}

// MARK: - IndigoChild
struct IndigoChild: Codable {
    let kind: String
    let data: CunningData
}

// MARK: - CunningData
struct CunningData: Codable {
    let totalAwardsReceived: Int
    let approvedAtUTC: JSONNull?
    let ups: Int
    let awarders: [JSONAny]
    let modReasonBy, bannedBy: JSONNull?
    let authorFlairType: String
    let removalReason: JSONNull?
    let linkID: String
    let authorFlairTemplateID, likes: JSONNull?
    let replies: String
    let userReports: [JSONAny]
    let saved: Bool
    let id: String
    let bannedAtUTC, modReasonTitle: JSONNull?
    let gilded: Int
    let archived, noFollow: Bool
    let author: String
    let canModPost, sendReplies: Bool
    let parentID: String
    let score: Int
    let authorFullname: String
    let reportReasons, approvedBy: JSONNull?
    let allAwardings: [JSONAny]
    let subredditID, body: String
    let edited: Bool
    let authorFlairCSSClass: JSONNull?
    let stewardReports: [JSONAny]
    let isSubmitter: Bool
    let downs: Int
    let authorFlairRichtext: [JSONAny]
    let authorPatreonFlair: Bool
    let bodyHTML: String
    let gildings: Gildings
    let collapsedReason: JSONNull?
    let stickied: Bool
    let subredditType: String
    let canGild: Bool
    let subreddit: String
    let authorFlairTextColor: JSONNull?
    let scoreHidden: Bool
    let permalink: String
    let numReports: JSONNull?
    let locked: Bool
    let name: String
    let created: Int
    let authorFlairText: JSONNull?
    let collapsed: Bool
    let createdUTC: Int
    let subredditNamePrefixed: String
    let controversiality, depth: Int
    let authorFlairBackgroundColor: JSONNull?
    let modReports: [JSONAny]
    let modNote, distinguished: JSONNull?

    enum CodingKeys: String, CodingKey {
        case totalAwardsReceived = "total_awards_received"
        case approvedAtUTC = "approved_at_utc"
        case ups, awarders
        case modReasonBy = "mod_reason_by"
        case bannedBy = "banned_by"
        case authorFlairType = "author_flair_type"
        case removalReason = "removal_reason"
        case linkID = "link_id"
        case authorFlairTemplateID = "author_flair_template_id"
        case likes, replies
        case userReports = "user_reports"
        case saved, id
        case bannedAtUTC = "banned_at_utc"
        case modReasonTitle = "mod_reason_title"
        case gilded, archived
        case noFollow = "no_follow"
        case author
        case canModPost = "can_mod_post"
        case sendReplies = "send_replies"
        case parentID = "parent_id"
        case score
        case authorFullname = "author_fullname"
        case reportReasons = "report_reasons"
        case approvedBy = "approved_by"
        case allAwardings = "all_awardings"
        case subredditID = "subreddit_id"
        case body, edited
        case authorFlairCSSClass = "author_flair_css_class"
        case stewardReports = "steward_reports"
        case isSubmitter = "is_submitter"
        case downs
        case authorFlairRichtext = "author_flair_richtext"
        case authorPatreonFlair = "author_patreon_flair"
        case bodyHTML = "body_html"
        case gildings
        case collapsedReason = "collapsed_reason"
        case stickied
        case subredditType = "subreddit_type"
        case canGild = "can_gild"
        case subreddit
        case authorFlairTextColor = "author_flair_text_color"
        case scoreHidden = "score_hidden"
        case permalink
        case numReports = "num_reports"
        case locked, name, created
        case authorFlairText = "author_flair_text"
        case collapsed
        case createdUTC = "created_utc"
        case subredditNamePrefixed = "subreddit_name_prefixed"
        case controversiality, depth
        case authorFlairBackgroundColor = "author_flair_background_color"
        case modReports = "mod_reports"
        case modNote = "mod_note"
        case distinguished
    }
}

typealias DetialListing = [ListingElement]

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
