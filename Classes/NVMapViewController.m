//
//  NVMapViewController.m
//  nvpolyline
//
//  Created by William Lachance on 10-03-30.
//  Inspired by code and ideas from Craig Spitzkoff and Nicolas Neubauer 2009.
//

#import "NVMapViewController.h"
#import "NVPolylineAnnotationView.h"


@implementation NVMapViewController

- (void)loadView {
	[super loadView];
	
	_mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
	[_mapView setDelegate:self];
	[self.view addSubview:_mapView];

	// a drive from Dorval to Westmount, Quebec, Canada... as generated by Google Earth
	NSArray *points = @[[[CLLocation alloc] initWithLatitude:45.43894 longitude:-73.7396],
					   [[CLLocation alloc] initWithLatitude:45.44073 longitude:-73.73998],
					   [[CLLocation alloc] initWithLatitude:45.44082000000001 longitude:-73.73992],
					   [[CLLocation alloc] initWithLatitude:45.44382 longitude:-73.74069],
					   [[CLLocation alloc] initWithLatitude:45.44612 longitude:-73.74122],
					   [[CLLocation alloc] initWithLatitude:45.44612 longitude:-73.74122],
					   [[CLLocation alloc] initWithLatitude:45.44628 longitude:-73.74119],
					   [[CLLocation alloc] initWithLatitude:45.44649 longitude:-73.74106999999999],
					   [[CLLocation alloc] initWithLatitude:45.44665999999999 longitude:-73.7409],
					   [[CLLocation alloc] initWithLatitude:45.44665999999999 longitude:-73.7409],
					   [[CLLocation alloc] initWithLatitude:45.44676 longitude:-73.74073],
					   [[CLLocation alloc] initWithLatitude:45.44707999999999 longitude:-73.73990000000001],
					   [[CLLocation alloc] initWithLatitude:45.44748 longitude:-73.73856000000001],
					   [[CLLocation alloc] initWithLatitude:45.44748 longitude:-73.73856000000001],
					   [[CLLocation alloc] initWithLatitude:45.44834 longitude:-73.73581],
					   [[CLLocation alloc] initWithLatitude:45.44857999999999 longitude:-73.73475999999999],
					   [[CLLocation alloc] initWithLatitude:45.44863000000001 longitude:-73.73417000000001],
					   [[CLLocation alloc] initWithLatitude:45.44863000000001 longitude:-73.73300999999999],
					   [[CLLocation alloc] initWithLatitude:45.44795 longitude:-73.7008],
					   [[CLLocation alloc] initWithLatitude:45.44784 longitude:-73.69398],
					   [[CLLocation alloc] initWithLatitude:45.44775 longitude:-73.69092000000001],
					   [[CLLocation alloc] initWithLatitude:45.44743999999999 longitude:-73.68584],
					   [[CLLocation alloc] initWithLatitude:45.44728 longitude:-73.68165999999999],
					   [[CLLocation alloc] initWithLatitude:45.44726 longitude:-73.67901999999999],
					   [[CLLocation alloc] initWithLatitude:45.44713000000001 longitude:-73.67238],
					   [[CLLocation alloc] initWithLatitude:45.44691 longitude:-73.67075],
					   [[CLLocation alloc] initWithLatitude:45.44662 longitude:-73.66947],
					   [[CLLocation alloc] initWithLatitude:45.44555 longitude:-73.66679000000001],
					   [[CLLocation alloc] initWithLatitude:45.44460999999999 longitude:-73.66426],
					   [[CLLocation alloc] initWithLatitude:45.443 longitude:-73.65927000000001],
					   [[CLLocation alloc] initWithLatitude:45.44249000000001 longitude:-73.65730000000001],
					   [[CLLocation alloc] initWithLatitude:45.44229 longitude:-73.6563],
					   [[CLLocation alloc] initWithLatitude:45.44211 longitude:-73.65433],
					   [[CLLocation alloc] initWithLatitude:45.44192 longitude:-73.65125999999999],
					   [[CLLocation alloc] initWithLatitude:45.44196999999999 longitude:-73.65013999999999],
					   [[CLLocation alloc] initWithLatitude:45.44213000000001 longitude:-73.64919],
					   [[CLLocation alloc] initWithLatitude:45.44232000000001 longitude:-73.64847],
					   [[CLLocation alloc] initWithLatitude:45.44268999999999 longitude:-73.64754000000001],
					   [[CLLocation alloc] initWithLatitude:45.44527000000001 longitude:-73.64261],
					   [[CLLocation alloc] initWithLatitude:45.44895 longitude:-73.63585999999999],
					   [[CLLocation alloc] initWithLatitude:45.44991 longitude:-73.63379],
					   [[CLLocation alloc] initWithLatitude:45.45045 longitude:-73.63251],
					   [[CLLocation alloc] initWithLatitude:45.4542 longitude:-73.62442],
					   [[CLLocation alloc] initWithLatitude:45.4547 longitude:-73.62327000000001],
					   [[CLLocation alloc] initWithLatitude:45.45536000000001 longitude:-73.62194],
					   [[CLLocation alloc] initWithLatitude:45.46158 longitude:-73.61073],
					   [[CLLocation alloc] initWithLatitude:45.46158 longitude:-73.61073],
					   [[CLLocation alloc] initWithLatitude:45.4634 longitude:-73.60753],
					   [[CLLocation alloc] initWithLatitude:45.4634 longitude:-73.60753],
					   [[CLLocation alloc] initWithLatitude:45.46362 longitude:-73.60720999999999],
					   [[CLLocation alloc] initWithLatitude:45.46447 longitude:-73.60558],
					   [[CLLocation alloc] initWithLatitude:45.46541 longitude:-73.60393000000001],
					   [[CLLocation alloc] initWithLatitude:45.46653000000001 longitude:-73.60204],
					   [[CLLocation alloc] initWithLatitude:45.46685 longitude:-73.60166],
					   [[CLLocation alloc] initWithLatitude:45.46720000000001 longitude:-73.60137],
					   [[CLLocation alloc] initWithLatitude:45.46754 longitude:-73.60120000000001],
					   [[CLLocation alloc] initWithLatitude:45.4682 longitude:-73.60108],
					   [[CLLocation alloc] initWithLatitude:45.46870000000001 longitude:-73.60115],
					   [[CLLocation alloc] initWithLatitude:45.46922 longitude:-73.60138000000001],
					   [[CLLocation alloc] initWithLatitude:45.46972999999999 longitude:-73.60173],
					   [[CLLocation alloc] initWithLatitude:45.46996 longitude:-73.60209],
					   [[CLLocation alloc] initWithLatitude:45.4703 longitude:-73.60287],
					   [[CLLocation alloc] initWithLatitude:45.47117999999999 longitude:-73.60565],
					   [[CLLocation alloc] initWithLatitude:45.47163 longitude:-73.60674],
					   [[CLLocation alloc] initWithLatitude:45.47163 longitude:-73.60674],
					   [[CLLocation alloc] initWithLatitude:45.47236 longitude:-73.60812],
					   [[CLLocation alloc] initWithLatitude:45.47339000000001 longitude:-73.6103],
					   [[CLLocation alloc] initWithLatitude:45.47339000000001 longitude:-73.6103],
					   [[CLLocation alloc] initWithLatitude:45.47407 longitude:-73.60908000000001],
					   [[CLLocation alloc] initWithLatitude:45.47581000000001 longitude:-73.60705],
					   [[CLLocation alloc] initWithLatitude:45.47895 longitude:-73.60353000000001],
					   [[CLLocation alloc] initWithLatitude:45.48116 longitude:-73.60088],
					   [[CLLocation alloc] initWithLatitude:45.48517 longitude:-73.59635],
					   [[CLLocation alloc] initWithLatitude:45.48679000000001 longitude:-73.59443]];
					   
	NVPolylineAnnotation *annotation = [[NVPolylineAnnotation alloc] initWithPoints:points mapView:_mapView];
    annotation.routeColor = [UIColor colorWithRed:1.000 green:0.035 blue:0.000 alpha:1.000];
	[_mapView addAnnotation:annotation];
	
	// use some magic numbers to create a map region
	MKCoordinateRegion region;
	region.span.longitudeDelta = 0.219727;
	region.span.latitudeDelta = 0.221574;
	region.center.latitude = 45.452424;
	region.center.longitude = -73.662643;
	[_mapView setRegion:region];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {

	if ([annotation isKindOfClass:[NVPolylineAnnotation class]]) {
		return [[NVPolylineAnnotationView alloc] initWithAnnotation:annotation mapView:_mapView];
	}
		 
	return nil;
}


@end
