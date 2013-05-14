//
//  NVPolylineAnnotation.h
//  nvpolyline
//
//  Created by William Lachance on 10-03-31.
//  Inspired by code and ideas from Craig Spitzkoff and Nicolas Neubauer 2009.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface NVPolylineAnnotation : NSObject <MKAnnotation>

-(id) initWithPoints:(NSArray*)points mapView:(MKMapView *)mapView;

@property (readonly) NSArray *points;

/**
 Route line color.
 */

@property (strong) UIColor *routeColor;

@end
