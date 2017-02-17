<!DOCTYPE html>
<html lang="en" ng-app="AssortmentApp">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>elevate</title>
    <link rel="shortcut icon" href="http://i3.sdlcdn.com/img/icons/favicon.ico" type="image/x-icon" />
    <link rel=icon type=image/ico href="http://i3.sdlcdn.com/img/icons/favicon.ico" />
    <link rel="stylesheet" type="text/css" href="css/libs/jqcloud.min.css">
    <link rel="stylesheet" type="text/css" href="css/libs/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/libs/angucomplete-alt.css" />
    <link rel="stylesheet" type="text/css" href="css/libs/c3.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-select/0.18.1/select.css" />
    <link rel="stylesheet" type="text/css" href="css/libs/typeahead.css" />
    <link rel="stylesheet" type="text/css" href="css/app.css">
    <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.9/angular.js"></script>
</head>

<body ng-controller="WebChatAppCtrl" ng-cloak>
    <div class="container">
        <!--{{isLoading ? 'hidden' : ''}}-->
        <nav class="navbar navbar-default" ng-show="user && user.hasOwnProperty('userName') && isAuthenticated" style="border-top-left-radius: 0;border-top-right-radius: 0;background: #fff;margin-bottom: 10px;">
            <div class="">
                <div class="navbar-header">
                    <a class="navbar-brand elevate"> elevate
                    </a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li class="dropdown {{nav.navParent.disabled ? 'disabled' : ''}} {{nav.navParent.active ? 'active' : ''}}" ng-if="nav.navParent.navChilds && nav.navParent.navChilds.length !== 0" ng-repeat="nav in navBarData"><a href="" class="dropdown-toggle" data-toggle="dropdown" role="button">
                            {{nav.navParent.name}}
                        <span class="caret" ></span></a>
                            <ul class="dropdown-menu pad_0">
                                <li ng-repeat="navChild in nav.navParent.navChilds" class="{{navChild.disabled ? 'disabled' : ''}} {{navChild.active ? 'active' : ''}}" style="border-bottom: 1px solid #efefef;">
                                    <a href='{{"#"+navChild.value}}'>{{navChild.name}}</a>
                                </li>
                            </ul>
                        </li>
                        <li ng-if="nav.navParent.navChilds && nav.navParent.navChilds.length === 0" ng-click="setActive(nav.navParent.name)" class="dropdown {{nav.navParent.disabled ? 'disabled' : ''}} {{nav.navParent.active ? 'active' : ''}}" ng-repeat="nav in navBarData"><a href="#{{nav.navParent.value}}" class="dropdown-toggle">{{nav.navParent.name}}</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown"><a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">{{user.name}} <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="" ng-click="logoutUser()">Logout</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>
        <div class="clearfix"></div>
        <!--class="{{isLoading ? 'hidden' : ''}}"-->
        <div id="main">
            <div ng-view class="view-animate"></div>
        </div>
    </div>
    <div id="preloaderdiv" ng-show="isLoading">
        <img src="images/ajax-loader.gif" class="ajax-loader" />
    </div>
    <div id="PopUpMessage">
        <div id="popUpMessage" class="modal fade" role="dialog">
            <div class="modal-dialog ">
                <!-- Modal content-->
                <div class="modal-content {{popUpMessageDetails.typeOfMessage === 'error' ? 'bg-danger' : ''}}">
                    <div class="modal-header">
                        <button type="button" class="close" ng-click="hidePopupMessage()">&times;</button>
                        <h4 class="modal-title {{popUpMessageDetails.typeOfMessage === 'error' ? 'text-danger' : ''}}">{{popUpMessageDetails.tittle}}</h4>
                    </div>
                    <div class="modal-body {{popUpMessageDetails.typeOfMessage === 'error' ? 'text-danger' : ''}}">
                        <div style="overflow-y: auto;max-height: 200px;overflow-x:hidden;">
                            <p ng-bind-html="popUpMessageDetails.message"></p>
                            <!-- <p>{{popUpMessageDetails.statusCode}}</p> -->
                        </div>
                        <!-- <p ng-bind-html="popUpMessageDetails.message">{{popUpMessageDetails.message}}</p> -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" ng-click="hidePopupMessage()">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="js/libs/jquery.min.js" type="text/javascript"></script>
    <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.9/angular-animate.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.9/angular-aria.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.9/angular-route.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.9/angular-sanitize.min.js"></script>
    <script src="js/libs/bootstrap.min.js"></script>
    <script src="//angular-ui.github.io/bootstrap/ui-bootstrap-tpls-1.3.3.js"></script>
    <script src="js/libs/jqcloud.js"></script>
    <!--<script src="//code.highcharts.com/stock/highstock.js"></script>-->
    <!--<script src="//code.highcharts.com/modules/exporting.src.js"></script>-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-select/0.18.1/select.js"></script>
    <script src="js/libs/jquery.elevatezoom.js" type="text/javascript"></script>
    <script src="js/libs/angucomplete-alt.js"></script>
    <script src="js/libs/checklist-model.js"></script>
    <script src="js/libs/ng-infinite-scroll.js"></script>
    <script src="js/libs/d3.min.js"></script>
    <script src="js/libs/c3.min.js"></script>
    <!--<script src="https://unpkg.com/masonry-layout@4.1/dist/masonry.pkgd.js"></script>-->
    <!--<script src="js/libs/angular-masonry.js"></script>-->
    <!-- @if NODE_ENV == 'DEVELOPMENT' -->
    <!-- angular app, config and run time config -->
    <script type="text/javascript" src="js/app.js"></script>
    <script type="text/javascript" src="js/app_run.js"></script>
    <script type="text/javascript" src="js/app_route_config.js"></script>
    <!-- angular directives -->
    <script type="text/javascript" src="js/directives/cat_subcat_bucket_brand_directive.js"></script>
    <script type="text/javascript" src="js/directives/category_label_directive.js"></script>
    <!--  <script type="text/javascript" src="js/directives/when_scroll_ends_directive.js"></script> -->
    <!-- angular controllers -->
    <script type="text/javascript" src="js/app_controller.js"></script>
    <script type="text/javascript" src="js/controllers/login.js"></script>
    <script type="text/javascript" src="js/controllers/signup.js"></script>
    <script type="text/javascript" src="js/controllers/keywordAndConversionCtrl.js"></script>
    <script type="text/javascript" src="js/controllers/search/diversityCtrl.js"></script>
    <script type="text/javascript" src="js/controllers/nullSearchCtrl.js"></script>
    <script type="text/javascript" src="js/controllers/mappingPanel.js"></script>
    <script type="text/javascript" src="js/controllers/brandGapCtrl.js"></script>
    <script type="text/javascript" src="js/controllers/assortmentGapCtrl.js"></script>
    <script type="text/javascript" src="js/controllers/leadershipReportCtrl.js"></script>
    <script type="text/javascript" src="js/controllers/gapSummaryCtrl.js"></script>
    <script type="text/javascript" src="js/controllers/subcatLevelGapCtrl.js"></script>
    <script type="text/javascript" src="js/controllers/LMHReportCtrl.js"></script>
    <script type="text/javascript" src="js/controllers/discoverabilityReport.js"></script>
    <script type="text/javascript" src="js/controllers/filterCoverageCtrl.js"></script>
    <script type="text/javascript" src="js/controllers/metrics/postOrderMetricsCtrl.js"></script>
    <script type="text/javascript" src="js/controllers/InventoryCtrl.js"></script>
    <script type="text/javascript" src="js/controllers/jiraPopupCtrl.js"></script>
    <script type="text/javascript" src="js/controllers/attribute/attributeCoverageCtrl.js"></script>
    <script type="text/javascript" src="js/controllers/attribute/attributeMappingCtrl.js"></script>
    <script type="text/javascript" src="js/controllers/attribute/attributeMappingListCtrl.js"></script>
    <script type="text/javascript" src="js/controllers/attribute/attributeConflictResolveCtrl.js"></script>
    <script type="text/javascript" src="js/controllers/attribute/attributeConflictSummaryCtrl.js"></script>
    <script type="text/javascript" src="js/controllers/aquaPopUpCtrl.js"></script>
    <script type="text/javascript" src="js/controllers/bounty/clusterBounty.js"></script>
    <script type="text/javascript" src="js/controllers/bulkUploadCtrl.js"></script>
    <script type="text/javascript" src="js/controllers/bounty/createCluster.js"></script>
    <script type="text/javascript" src="js/controllers/bounty/azListingCtrl.js"></script>
    <script type="text/javascript" src="js/controllers/bounty/clusterProductCountCtrl.js"></script>
    <script type="text/javascript" src="js/controllers/brandGap/brandProductList.js"></script>
    <script type="text/javascript" src="js/controllers/brandGap/brandGapCatalog.js"></script>
    <script type="text/javascript" src="js/controllers/brandGap/brandTrendPopUp.js"></script>
    <script type="text/javascript" src="js/controllers/brandGap/brandGapSellerCtrl.js"></script>
    <script type="text/javascript" src="js/controllers/brandGap/sdAzAttributeMapping.js"></script>
    <script type="text/javascript" src="js/controllers/brandGap/productReviewPage.js"></script>
    <!-- <script type="text/javascript" src="js/controllers/bounty/clusterMappingCtrl.js"></script> -->
    <!-- <script type="text/javascript" src="js/controllers/bounty/clusterMappingNewCtrl.js"></script> -->
    <script type="text/javascript" src="js/controllers/attributeMapping/attributeMappingCtrl.js"></script>
    <script type="text/javascript" src="js/controllers/vendorSheetToSd/vendorSheetToSdCtrl.js"></script>
    <script type="text/javascript" src="js/controllers/vendorSheetToSd/genericToSdCtrl.js"></script>
    <script type="text/javascript" src="js/controllers/vendorSheetToSd/genericConversionMappingCtrl.js"></script>
    <script type="text/javascript" src="js/controllers/vendorSheetToSd/conversionPreviewCtrl.js"></script>
    <script type="text/javascript" src="js/controllers/azToSd/azToSdCtrl.js"></script>

    <!--  angular helper filters -->
    <script type="text/javascript" src="js/filters/ui_select_filter.js"></script>

    <!-- angular helper services -->
    <script type="text/javascript" src="js/services/network_service.js"></script>
    <script type="text/javascript" src="js/services/jiraPopup_service.js"></script>
    <script type="text/javascript" src="js/services/data_handler_service.js"></script>
    <script type="text/javascript" src="js/services/endpoint_service.js"></script>
    <script type="text/javascript" src="js/services/cacheHandler_service.js"></script>
    <script type="text/javascript" src="js/services/authentication_service.js"></script>
    <script type="text/javascript" src="js/services/popUp_service.js"></script>
    <script type="text/javascript" src="js/services/confirmDialogService.js"></script>
    <!-- @endif -->
    <!-- @if NODE_ENV == 'PRODUCTION' -->
    <script type="text/javascript" src="js/min/app.min.js"></script>
    <!-- @endif -->
</body>

</html>