//
//  MKPolyline+WBExtension.swift
//  Pods
//
//  Created by 文波 on 2019/12/5.
//

#if canImport(MapKit) && !os(watchOS)
import MapKit

// MARK: - Initializers
@available(tvOS 9.2, *)
public extension MKPolyline {
    
    /// Create a new MKPolyline from a provided Array of coordinates.
    /// - Parameter coordinates:  Array of CLLocationCoordinate2D(s).
    convenience init(wb_coordinates: [CLLocationCoordinate2D]) {
        var refCoordinates = wb_coordinates
        self.init(coordinates: &refCoordinates, count: refCoordinates.count)
    }
}

// MARK: - Properties
@available(tvOS 9.2, *)
public extension MKPolyline {
    
    /// Return an Array of coordinates representing the provided polyline.
    var wb_coordinates: [CLLocationCoordinate2D] {
        var coords = [CLLocationCoordinate2D](repeating: kCLLocationCoordinate2DInvalid, count: pointCount)
        getCoordinates(&coords, range: NSRange(location: 0, length: pointCount))
        return coords
    }
    
}

#endif
