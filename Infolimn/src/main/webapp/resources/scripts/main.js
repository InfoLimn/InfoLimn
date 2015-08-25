var IL = IL || {};

IL.Controller = {
	first : function() {

	}
};

IL.Controller.first();

var app = angular.module('infolimn', [ 'checklist-model' ]);
app.controller('imageView', function($scope, $filter) {
	$scope.responseData = responseData;
	$scope.selectedCategories = $scope.responseData.categories.slice(0);
	$scope.selectedImages = $scope.responseData.images.slice(0);
	$scope.checkAll = function() {
		$scope.selectedCategories = angular
				.copy($scope.responseData.categories);
	};
	$scope.uncheckAll = function() {
		$scope.selectedCategories = [];
	};
	$scope.getCategories = function() {
		return $scope.responseData.categories;
	}, 
	$scope.check = function(value, checked) {
		var idx = $scope.selectedCategories.indexOf(value);
		if (idx >= 0 && !checked) {
			$scope.selectedCategories.splice(idx, 1);
			console.log('top   ' + $scope.selectedCategories);
			console.log('top   ' + $scope.responseData.categories);
		}
		if (idx < 0 && checked) {
			$scope.selectedCategories.push(value);
			console.log('bottom   ' + $scope.selectedCategories);
			console.log('bottom   ' + $scope.responseData.categories);
		}
		$scope.filteredImages();
	};
$scope.test = "{category: 'Politics'}";
	$scope.filteredImages = function(image) {
        return $filter("filter")($scope.selectedImages, function(image){
        	console.log($scope.selectedCategories+'  ===   '+image.category +'  ===   '+ ($scope.selectedCategories.indexOf(image.category) !== -1));
        	if($scope.selectedCategories.indexOf(image.category) !== -1){
        		return '{category: '+image.category+'}';
        	}
        	
        });
	};
});


var responseData = {
	"categories" : [ 'Politics', 'Science', 'Cinema', 'Others' ],
	"images" : [ {
		"url" : 'resources/images/pictterSample.png',
		"category" : 'Politics',
		"timeStamp" : 12345
	}, {
		"url" : 'resources/images/pictterSample.png',
		"category" : 'Politics',
		"timeStamp" : 12346
	}, {
		"url" : 'resources/images/pictterSample.png',
		"category" : 'Politics',
		"timeStamp" : 12346
	}, {
		"url" : 'resources/images/pictterSample.png',
		"category" : 'Cinema',
		"timeStamp" : 12347
	}, {
		"url" : 'resources/images/pictterSample.png',
		"category" : 'Others',
		"timeStamp" : 12348
	}, {
		"url" : 'resources/images/pictterSample.png',
		"category" : 'Cinema',
		"timeStamp" : 12349
	}, {
		"url" : 'resources/images/pictterSample.png',
		"category" : 'Science',
		"timeStamp" : 12350
	}, {
		"url" : 'resources/images/pictterSample.png',
		"category" : 'Science',
		"timeStamp" : 12360
	}, {
		"url" : 'resources/images/pictterSample.png',
		"category" : 'Science',
		"timeStamp" : 12370
	}, ]
};


angular
		.module('checklist-model', [])
		.directive(
				'checklistModel',
				[
						'$parse',
						'$compile',
						function($parse, $compile) {
							// contains
							function contains(arr, item, comparator) {
								if (angular.isArray(arr)) {
									for ( var i = arr.length; i--;) {
										if (comparator(arr[i], item)) {
											return true;
										}
									}
								}
								return false;
							}

							// add
							function add(arr, item, comparator) {
								arr = angular.isArray(arr) ? arr : [];
								if (!contains(arr, item, comparator)) {
									arr.push(item);
								}
								return arr;
							}

							// remove
							function remove(arr, item, comparator) {
								if (angular.isArray(arr)) {
									for ( var i = arr.length; i--;) {
										if (comparator(arr[i], item)) {
											arr.splice(i, 1);
											break;
										}
									}
								}
								return arr;
							}

							// http://stackoverflow.com/a/19228302/1458162
							function postLinkFn(scope, elem, attrs) {
								// exclude recursion, but still keep the model
								var checklistModel = attrs.checklistModel;
								attrs.$set("checklistModel", null);
								// compile with `ng-model` pointing to `checked`
								$compile(elem)(scope);
								attrs.$set("checklistModel", checklistModel);

								// getter / setter for original model
								var getter = $parse(checklistModel);
								var setter = getter.assign;
								var checklistChange = $parse(attrs.checklistChange);

								// value added to list
								var value = attrs.checklistValue ? $parse(
										attrs.checklistValue)(scope.$parent)
										: attrs.value;

								var comparator = angular.equals;

								if (attrs.hasOwnProperty('checklistComparator')) {
									if (attrs.checklistComparator[0] == '.') {
										var comparatorExpression = attrs.checklistComparator
												.substring(1);
										comparator = function(a, b) {
											return a[comparatorExpression] === b[comparatorExpression];
										}

									} else {
										comparator = $parse(
												attrs.checklistComparator)(
												scope.$parent);
									}
								}

								// watch UI checked change
								scope
										.$watch(
												attrs.ngModel,
												function(newValue, oldValue) {
													if (newValue === oldValue) {
														return;
													}
													var current = getter(scope.$parent);
													if (angular
															.isFunction(setter)) {
														if (newValue === true) {
															setter(
																	scope.$parent,
																	add(
																			current,
																			value,
																			comparator));
														} else {
															setter(
																	scope.$parent,
																	remove(
																			current,
																			value,
																			comparator));
														}
													}

													if (checklistChange) {
														checklistChange(scope);
													}
												});

								// declare one function to be used for both
								// $watch functions
								function setChecked(newArr, oldArr) {
									scope[attrs.ngModel] = contains(newArr,
											value, comparator);
								}

								// watch original model change
								// use the faster $watchCollection method if
								// it's available
								if (angular
										.isFunction(scope.$parent.$watchCollection)) {
									scope.$parent.$watchCollection(
											checklistModel, setChecked);
								} else {
									scope.$parent.$watch(checklistModel,
											setChecked, true);
								}
							}

							return {
								restrict : 'A',
								priority : 1000,
								terminal : true,
								scope : true,
								compile : function(tElement, tAttrs) {
									if ((tElement[0].tagName !== 'INPUT' || tAttrs.type !== 'checkbox')
											&& (tElement[0].tagName !== 'MD-CHECKBOX')
											&& (!tAttrs.btnCheckbox)) {
										throw 'checklist-model should be applied to `input[type="checkbox"]` or `md-checkbox`.';
									}

									if (!tAttrs.checklistValue && !tAttrs.value) {
										throw 'You should provide `value` or `checklist-value`.';
									}

									// by default ngModel is 'checked', so we
									// set it if not specified
									if (!tAttrs.ngModel) {
										// local scope var storing individual
										// checkbox model
										tAttrs.$set("ngModel", "checked");
									}

									return postLinkFn;
								}
							};
						} ]);