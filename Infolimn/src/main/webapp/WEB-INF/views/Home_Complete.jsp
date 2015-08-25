<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pictter: Home</title>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link href="../styles/main1.css" rel="stylesheet" type="text/css">
<link rel="icon" type="image/png" href="../images/pictter_icon.png">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
body {
	background-color: #55ACEE;
	font-family: 'Open Sans', sans-serif;
}

.container {
	float: left;
	margin-top: 60px;
	padding: 0px;
	width: 100%;
}

.navBar {
	position: fixed;
	margin: 3px;
	border-radius: 8px;
	top: 0;
	width: calc(100% -     6px);
	height: 50px;
	background-color: #fff;
	top: 0;
	z-index: 100;
}

.leftNav,.rightNav {
	display: inline-block;
	height: 100%;
}

.leftMenu,.rightMenu {
	height: 100%;
	display: inline;
}

.leftMenu {
	margin: 0 6%;
}

ul.leftMenu li,ul.rightMenu li {
	display: inline-block;
	width: 125px;
	height: 100%;
	border-left: 1px solid #66757f;
	border-right: 1px solid #66757f;
	padding-top: 15px;
	color: #66757f;
	text-align: center;
	cursor: pointer;
	transition: all 0.5s ease;
}

ul.leftMenu li:hover,ul.rightMenu li:hover {
	background: rgba(85, 172, 238, 1);
	color: #fff;
}

.navBar input.searchInput {
	float: left;
	display: inline-block;
	height: 36px;
	width: 384px;
	border-radius: 25px;
	padding-left: 17px;
}

.navBar .glyphicon-search {
	top: 8px;
	right: 33px;
	color: #66757f;
	padding: 3px;
	cursor: pointer;
}

.accountImage {
	color: black;
}

.rightNav {
	float: right;
	margin-right: 6%;
}

.searchBox {
	display: inline-block;
	padding-top: 8px;
	height: 100%;
}

.floatRight {
	float: right;
}

.leftContainer {
	float: left;
	width: 280px;
}
.middleContainer {
    float: left;
    padding: 22px;
    width: 55%;
    background-color: #FFF;
    margin-left: 8px;
    border-radius: 5px;
}
.rightContainer {
	float: right;
	width: 280px;
}

.myDetails {
	float: left;
	width: 100%;
	background-color: #fff;
	margin-left: 3px;
	border-radius: 5px;
	padding: 15px;
}
.followContent {
    width: 100%;
    background-color: #fff;
    margin-right: 3px;
    border-radius: 5px;
    float: right;
    padding: 15px;
}
.trending {
	float: left;
	width: 100%;
	background-color: #fff;
	margin-left: 3px;
	margin-top: 6px;
	border-radius: 5px;
	padding: 15px;
}
.middleContainer .row{
	margin-bottom: 22px;
}
ul li{
	list-style-type: none;
	margin-bottom: 6px;
}
</style>
</head>
<body>
	<!-----start-main---->
	<div class="main">
		<div class="navBar">
			<div class="leftNav">
				<ul class="leftMenu">
					<li id="homeMenu">Home</li>
					<li id="myPictters">My Pictters</li>
				</ul>
			</div>
			<div class="rightNav">
				<div class="searchBox">
					<input class="searchInput" type="search" id="searchQuery"
						placeholder="Search Pictter" name="searchQuery" autocomplete="off"></input>
					<span class="glyphicon glyphicon-search"></span>
				</div>
				<div class="floatRight rightMenu">
					<ul class="rightMenu">
						<li id="homeMenu">Create</li>
						<li id="messagesMenu">Upload</li>
						<li id="messagesMenu">My Account</li>
					</ul>
				</div>
				<span class="accountImage"></span>
			</div>
		</div>
		<div class="container">
			<div class="leftContainer">
				<div class='myDetails'>
					<h4>Full Name</h4>
					<br>
					<ul>
						<li>Pictters</li>
						<li>Following</li>
						<li>Followers</li>
					</ul>
				</div>
				<div class="trending">
					<h4>Trending</h4>
					<ul>
						<li>Topic 1</li>
						<li>Topic 2</li>
						<li>Topic 3</li>
						<li>Topic 4</li>						
						<li>Topic 5</li>
						<li>Topic 6</li>
						<li>Topic 7</li>
						<li>Topic 8</li>						
						<li>Topic 9</li>
						<li>Topic 10</li>
						<li>Topic 11</li>
					</ul>
				</div>
			</div>
			<div class="middleContainer">
				<div class="row">
					<div class="col-xs-4">
						<img src="http://placehold.it/300x250" id="picture1"
							class="img-responsive" />
					</div>
					<div class="col-xs-4">
						<img src="http://placehold.it/300x250" id="picture2"
							class="img-responsive" />
					</div>
					<div class="col-xs-4">
						<img src="http://placehold.it/300x250" id="picture3"
							class="img-responsive" />
					</div>
				</div>				<div class="row">
					<div class="col-xs-4">
						<img src="http://placehold.it/300x250" id="picture1"
							class="img-responsive" />
					</div>
					<div class="col-xs-4">
						<img src="http://placehold.it/300x250" id="picture2"
							class="img-responsive" />
					</div>
					<div class="col-xs-4">
						<img src="http://placehold.it/300x250" id="picture3"
							class="img-responsive" />
					</div>
				</div>				<div class="row">
					<div class="col-xs-4">
						<img src="http://placehold.it/300x250" id="picture1"
							class="img-responsive" />
					</div>
					<div class="col-xs-4">
						<img src="http://placehold.it/300x250" id="picture2"
							class="img-responsive" />
					</div>
					<div class="col-xs-4">
						<img src="http://placehold.it/300x250" id="picture3"
							class="img-responsive" />
					</div>
				</div>
			</div>
			<div class="rightContainer">
				<div class='followContent'>
					<h4>Who to Follow</h4>
					<ul>
						<li>Follower 1</li>
						<li>Follower 2</li>
						<li>Follower 3</li>
						<li>Follower 4</li>
						<li>Follower 5</li>
						<li>Follower 6</li>
						<li>Follower 7</li>
						<li>Follower 8</li>
						<li>Follower 9</li>
						<li>Follower 10</li>
						<li>Follower 11</li>
					</ul>
				</div>
			</div>

		</div>
	</div>
</body>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.11.3.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript" src="scripts/main.js"></script>

</html>
