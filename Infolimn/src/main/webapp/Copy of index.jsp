<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pictter: Home</title>
<meta charset="utf-8">
<link rel="stylesheet"
	href="resources/styles/bootstrap.min.css">
<link href="resources/styles/main.css" rel="stylesheet" type="text/css">

<link rel="icon" type="image/png" href="../images/pictter_icon.png">

<script src="resources/scripts/jquery-1.11.3.min.js"></script>

<script
	src="resources/scripts/angular.min.js"></script>

<script
	src="resources/scripts/bootstrap.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
body {
	background-color: #55ACEE;
	font-family: 'Open Sans', sans-serif;
}

.container {
	float: left;
	padding: 0px;
	width: 100%;
}

.navBarOutter {
	width: 100%;
	height: 60px;
	background-color: #55ACEE;
	z-index: 100;
}

.navBarInner {
	margin: 5px;
	border-radius: 5px;
	text-align: center;
	width: calc(100% -                                                     10px);
	height: 50px;
	background-color: #fff;
	z-index: 100;
}

.navBarInner span {
	text-align: center;
	display: inline-block;
	font-size: 1.5em;
	color: #55ACEE;
	margin-top: 10px;
}

.leftContainer {
	width: 240px;
	float: left;
}

.middleContainer {
	float: right;
	padding: 22px;
	height: 400px;
	width: calc(100% -                                                   255px);
	background-color: #FFF;
	margin-right: 5px;
	border-radius: 5px;
	overflow: scroll;
}

.middleContentMargin {
	width: 77%;
	background-color: #fff;
	height: 10px;
	position: fixed;
	z-index: 10;
}

.trending {
	float: left;
	width: 100%;
	background-color: #fff;
	margin-left: 5px;
	border-radius: 5px;
	padding: 15px;
	max-height: 450px;
	overflow: scroll;
}

.middleContainer .row {
	margin-bottom: 22px;
}

ul li {
	list-style-type: none;
	margin-bottom: 6px;
}

.middleContainer .row img {
	width: 300px;
	height: 120px;
	cursor: pointer;
}

.trending h5 {
	font-style: italic;
	margin-bottom: 10px;
}

.trending ul li {
	font-size: .8em;
}

.trending ul li input {
	margin-right: 7px;
}
</style>
</head>
<body ng-app="infolimn" ng-controller="imageView">
	<!-----start-main---->
	
	${some.attribute}
	
	<div class="main">
		<div class="navBarOutter">
			<div class="navBarInner">
				<span>Pictter</span>
			</div>
		</div>
		<div class="container">
			<div class="leftContainer">
				<div class="trending">
					<h5>Category</h5>
					<ul>
						<li ng-repeat="categoryType in responseData.categories"><label
							for="{{categoryType}}"><input id="{{categoryType}}"
								name="{{categoryType}}" type="checkbox"
								checklist-model="getCategories()" checklist-value="categoryType"
								ng-change="check(categoryType, checked)" />{{categoryType}}</label></li>
					</ul>
				</div>
				{{selectedCategories}}
			</div>
			<div ng-repeat="image in selectedImages | filter: {category: 'Cinema'}">
				{{image.category}}
			</div>
			<div class="middleContainer">
				<div class="row" ng-repeat="image in selectedImages | filter: filteredImages track by $index"
					ng-if="$index % 6 == 0">
					<div class="col-xs-2 letter-box"
						ng-repeat="i in [$index, $index + 1, $index + 2, $index + 3, $index + 4, $index + 5]"
						ng-if="selectedImages[i] != null">
						<img src="{{selectedImages[i].url}}" alt="{{selectedImages[i].category}}"
							id="pictterId_{{selectedImages[i].timeStamp}}"
							class="img-responsive" />
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="resources/scripts/main.js"></script>
</html>