import Foundation

//: ## URL & URLComponents
//: ### URL from String
//: It's easy to create a `URL` object from a String:
let urlString = "https://itunes.apple.com/search?media=music&entity=song&term=abba"
let url = URL(string: urlString)
//: Let's look at some of the properties of `url`:
url?.absoluteString
url?.scheme
url?.host
url?.path
url?.query
url?.baseURL
//: You can start with a `baseURL`, then add to it. 
//: This is useful for building REST API urls.
let baseURL = URL(string: "https://itunes.apple.com")
let relativeURL = URL(string: "search", relativeTo: baseURL)
relativeURL?.absoluteString
relativeURL?.scheme
relativeURL?.host
relativeURL?.path
relativeURL?.query
relativeURL?.baseURL
//: ### URLComponents
//: URLs sent over the Internet can only contain characters that are letters or digits 
//: on an English-language keyboard, plus a very few punctuation marks, like '-' and '_'.
//: Strings that represent URLs can contain many other characters, including other alphabets.
//: An app must URL-encode any "unsafe" characters before sending the URL.
//: This is also called *percent-encoding*, because unsafe characters are encoded as 
//: one or more pairs of hexadecimal digits, each preceded by '%'.
//: The space character is encoded as `%20` or +.
//: '%' itself is `%25`, and '+' is `%2B`.
//:
//: The easiest way to ensure your URLs are URL-encoded is to build them with `URLComponents`:
var urlComponents = URLComponents(string: "https://itunes.apple.com/search?media=music&entity=song")
var queryItem = URLQueryItem(name: "term", value: "crowded house")
urlComponents?.queryItems?.append(queryItem)
urlComponents?.url
urlComponents?.string
urlComponents?.queryItems
//: You can even URL-encode an emoji, like "smiling cat face with heart-shaped eyes" —
//: it's `%F0%9F%98%BB`
queryItem = URLQueryItem(name: "emoji", value: "😻")
urlComponents?.queryItems?.append(queryItem)
urlComponents?.url
urlComponents?.string
urlComponents?.queryItems


//: ## URLSession Challenge
//: Now we'll look more closely at `URLSessionConfiguration`.
//: ### Session Configurations & Sessions
//: The quickest way to get a session is to use the shared singleton session object:
let sharedSession = URLSession.shared
//: The shared singleton session object uses the __default configuration__,
//: for example, its `allowsCellularAccess` property has the default value `true`:
sharedSession.configuration.allowsCellularAccess
//: You cannot change this value in the session:
sharedSession.configuration.allowsCellularAccess = false
// check the value:
sharedSession.configuration.allowsCellularAccess
//: DONE: To create a session that doesn't allow cellular access,
//: first create a configuration object:
let myDefaultConfiguration = URLSessionConfiguration.default
// check the value:
myDefaultConfiguration.allowsCellularAccess
//: DONE: Then change its `allowsCellularAccess` property to `false`:
myDefaultConfiguration.allowsCellularAccess = false
// check the value:
myDefaultConfiguration.allowsCellularAccess
//: DONE: Now create a session with this configuration:
let myDefaultSession = URLSession(configuration: myDefaultConfiguration)
// check the value:
myDefaultSession.configuration.allowsCellularAccess
//: You can also create a session with the default configuration,
//: if you don't need to change any properties:
let defaultSession = URLSession(configuration: .default)
//: And the value of `allowsCellularAccess` is the default value `true`:
defaultSession.configuration.allowsCellularAccess
//: ### Customize the Cache
//: The disk capacity of the default configuration is 10 million bytes:
myDefaultConfiguration.urlCache?.diskCapacity
//: DONE: Look at the memory capacity of the cache:
myDefaultConfiguration.urlCache?.memoryCapacity
//: DONE: Create a new ephemeral configuration, and check the disk and memory capacity of its cache:
let ephemeralConfiguration = URLSessionConfiguration.ephemeral
ephemeralConfiguration.urlCache?.diskCapacity
ephemeralConfiguration.urlCache?.memoryCapacity
//: An ephemeral configuration has no persistent storage for cache, cookies or credentials,
//: but there might be a situation where you want a persistent cache,
//: and are happy with not persisting cookies or credentials.
//:
//: DONE: Create a URLCache object with `memoryCapacity` 512000 and `diskCapacity` 10000000, and
//: assign it to the configuration's `urlCache` property:
let cache = URLCache(memoryCapacity: 512000, diskCapacity: 10000000, diskPath: nil)
ephemeralConfiguration.urlCache = cache
// check the value of diskCapacity:
ephemeralConfiguration.urlCache?.diskCapacity





