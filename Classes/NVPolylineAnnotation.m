//
//  NVPolylineAnnotation.m
//  nvpolyline
//
//  Created by William Lachance on 10-03-31.
//  Inspired by code and ideas from Craig Spitzkoff and Nicolas Neubauer 2009.
//

#import "NVPolylineAnnotation.h"


@interface NVPolylineAnnotation ()

@property (strong) MKMapView *mapView;
@property (strong) NSMutableArray* points_marray;

@end

@implementation NVPolylineAnnotation

-(id) initWithPoints:(NSArray*) points mapView:(MKMapView *)mapView {
	
    if (self = [super init]) {
        _points_marray = [[NSMutableArray alloc] initWithArray:points];
        _mapView = mapView;
    }
		
	return self;
}

- (CLLocationCoordinate2D) coordinate {
	return [_mapView centerCoordinate];
}

#pragma mark - Property methods

- (NSArray *)points
{
    return [NSArray arrayWithArray:self.points_marray];
}

@end
