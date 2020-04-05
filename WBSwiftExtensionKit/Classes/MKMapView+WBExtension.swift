//
//  MKMapView+WBExtension.swift
//  Pods
//
//  Created by 文波 on 2019/12/5.
//

#if canImport(MapKit)
import MapKit

#if !os(watchOS)
@available(tvOS 9.2, *)
public extension MKMapView {
    
    /// Dequeue reusable MKAnnotationView using class type
    /// - Parameter name: MKAnnotationView type.
    func wb_dequeueReusableAnnotationView<T:MKAnnotationView>(withClass name: T.Type) -> T? {
        return dequeueReusableAnnotationView(withIdentifier: String(describing: name)) as? T
    }
    
    /// Register MKAnnotationView using class type
    /// - Parameter name: MKAnnotationView type.
    @available(iOS 11.0, tvOS 11.0, macOS 10.13, *)
    func wb_register<T: MKAnnotationView>(annotationViewWithClass name: T.Type) {
        register(T.self, forAnnotationViewWithReuseIdentifier: String(describing: name))
    }
    
    /// Dequeue reusable MKAnnotationView using class type
    /// - Parameters:
    ///   - name: MKAnnotationView type.
    ///   - annotation: annotation of the mapView.
    @available(iOS 11.0, tvOS 11.0, macOS 10.13, *)
    func wb_dequeueReusableAnnotationView<T: MKAnnotationView>(withClass name: T.Type, for annotation: MKAnnotation) -> T? {
        guard let annotationView = dequeueReusableAnnotationView(withIdentifier: String(describing: name), for: annotation) as? T else {
            fatalError("Couldn't find MKAnnotationView for \(String(describing: name))")
        }
        return annotationView
    }
}

#endif

#endif
