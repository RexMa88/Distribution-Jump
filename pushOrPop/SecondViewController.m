//
//  SecondViewController.m
//  pushOrPop
//
//  Created by RexMa on 15/11/26.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import "SecondViewController.h"
#import <AMapSearchKit/AMapSearchKit.h>
#import <MAMapKit/MAMapKit.h>

#define mapViewZoomLevel    16.1f

@interface SecondViewController ()<MAMapViewDelegate, AMapSearchDelegate>

@property (nonatomic, strong) AMapSearchAPI *search;

@property (nonatomic, strong) MAMapView *mapView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self configureMapView];
}

#pragma mark - life Cycle

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    [self.view addSubview:self.mapView];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

#pragma mark - custom UI

- (void)configureMapView{
    self.mapView = [[MAMapView alloc] initWithFrame:kScreenBounds];
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
    self.mapView.showsCompass = YES;
    self.mapView.pausesLocationUpdatesAutomatically = NO;
    self.mapView.allowsBackgroundLocationUpdates = YES;
    [self.mapView setUserTrackingMode:MAUserTrackingModeFollow animated:YES];
    [self.mapView setZoomLevel:mapViewZoomLevel animated:YES];
    
    //在地图上添加目的地
    MAPointAnnotation *destination = [[MAPointAnnotation alloc] init];
    destination.coordinate = CLLocationCoordinate2DMake(_poi.location.latitude, _poi.location.longitude);
    destination.title = _poi.name;
    destination.subtitle = _poi.address;
    [self.mapView addAnnotation:destination];
    
    //设置路径
    AMapWalkingRouteSearchRequest *walkRequest = [[AMapWalkingRouteSearchRequest alloc] init];
    walkRequest.origin = [AMapGeoPoint locationWithLatitude:self.mapView.userLocation.location.coordinate.latitude longitude:self.mapView.userLocation.location.coordinate.longitude];
    walkRequest.destination = [AMapGeoPoint locationWithLatitude:_poi.location.latitude longitude:_poi.location.longitude];
    
    //初始化检索
    self.search = [[AMapSearchAPI alloc] init];
    self.search.delegate = self;
    [self.search AMapWalkingRouteSearch:walkRequest];
}

#pragma mark - setter

- (void)setPoi:(AMapPOI *)poi{
    _poi = poi;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
