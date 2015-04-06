//: Playground - noun: a place where people can play

import UIKit
import MapKit


var request = MKLocalSearchRequest()
request.naturalLanguageQuery = "Nashville"
var localSearch = MKLocalSearch(request: request)
localSearch.startWithCompletionHandler(myFoo)

func myFoo: MKLocalSearchCompletionHandler {
  "hi"
}