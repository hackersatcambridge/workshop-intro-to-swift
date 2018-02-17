import Darwin

struct Location {
  let latitude: Double
  let longitude: Double

  // TODO #6:
  // Using what you know about argument labels, Add a function to `Location` 
  // that can be called like this: `locationA.distance(to: locationB)`.
  // This should utilise the existing `distanceBetween` function below.
}

/// Takes an angle in degrees and returns the angle converted to radians
private func degreesToRadians(_ degrees: Double) -> Double {
  return degrees * .pi / 180
}

/// Math function to give the distance in km between two sets of lat/long co-ordinates
/// Uses the 'great circle' distance formula
private func distanceBetween(lat1: Double, long1: Double, lat2: Double, long2: Double) -> Double {
  let earthRadius = 6371.0 // in km
  let deltaLat = degreesToRadians(lat2 - lat1)
  let deltaLong = degreesToRadians(long2 - long1)
  let a = 
    sin(deltaLat/2) * sin(deltaLat/2) +
    cos(degreesToRadians(lat1)) * cos(degreesToRadians(lat2)) * 
    sin(deltaLong/2) * sin(deltaLong/2)
  let c = 2 * atan2(sqrt(a), sqrt(1-a)); 
  let d = earthRadius * c; // Distance in km
  return d;
}