<!DOCTYPE html>
<html>
<head>
	<title>Milega | Sub Kuch Milega</title>
	<meta charset='utf-8'>
	<meta name='viewport' content='width=device-width, initial-scale=1.0'>

    <link href='css/bootstrap.css' rel='stylesheet'>
    <link href='css/animate.css' rel='stylesheet'>
    <link href='css/font-awesome.min.css' rel='stylesheet'>

    <link href='css/index.css' rel='stylesheet'>
    <link href='css/custom.css' rel='stylesheet'>

    <!-- google spreadsheet script-->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
</head>
<body>
	<!-- section 1: navigation bar -->
	<div class='row'>
		<nav class='navbar navbar-default navbar-fixed-top navbar-custom' role='navigation'>
			<div class='navbar-header'>
				<button type='button' class='navbar-toggle' data-toggle='collapse' data-target='#collapse'>
					<span class='sr-only'>Toggle Navigation</span>
					<span class='icon-bar'></span>
					<span class='icon-bar'></span>
					<span class='icon-bar'></span>
				</button>
			</div>
			<div id='collapse' class='collapse navbar-collapse' style="vertical-align: middle;">
				<div class="row nvb-row">
					<a href='index.html' class='navbar-brand'><p style='color:#003865; display:inline;' title='Bringing Doctors and Patients together!'><img style='max-width:150px; margin-top: -16px;' src='images/logo.png'></a>
				
					<div class="col-md-5 col-md-offset-1">
						<form class="form-horizontal" role="search">
							<div class="form-group">
								<div class="form-group">
								    <div class="col-md-10">
								      <input type="text" class="form-control" placeholder="Search our store">
								    </div>

								    <div class="col-md-2"></div>
								    <button type="submit" class="btn btn-default">Submit</button>
								</div>
							</div>
					    </form>
					</div>

					<div class="col-md-3 col-md-offset-1">
							<div class="row">
								<button class="btn btn-default col-md-5">Sign In</button>
								<button class="btn btn-default col-md-5 col-md-offset-1">Shopping Cart</button>	
							</div>
					</div>
				</div>
			</div>
		</nav>
	</div>

    <!-- scroll to top button -->
    <a href='#' class='scrollToTop'><img width='100%;' src='images/scroller.png'></a>

    <!-- section 2: sidebar and carousel -->
    <div class="row">
    	<!-- sidebar -->
    	<div style="padding-left: 1.5em;">
    		<div class="col-md-3 middle-cats">
				<div class="panel panel-default">
				  	<div class="panel-heading">
				    	<h3 class="panel-title">Categories</h3>
				  	</div>
				  	<div class="panel-body">
				    	<ul class="list-group">
							<li class="list-group-item active">Men's Wear</li>
							<li class="list-group-item">Subcat 1</li>
							<li class="list-group-item">Subcat 2</li>
						</ul>
						<ul class="list-group">
							<li class="list-group-item active">Women's Wear</li>
							<li class="list-group-item">Subcat 1</li>
							<li class="list-group-item">Subcat 2</li>
						</ul>
						<ul class="list-group">
							<li class="list-group-item active">Electronics</li>
							<li class="list-group-item">Subcat 1</li>
							<li class="list-group-item">Subcat 2</li>
							<li class="list-group-item">Subcat 3</li>
						</ul>
				  	</div>
				</div>
			</div>
    	</div> 

    	<!-- carousel -->
    	<div class="col-md-8 middle-car">
    		<div class="container carousel-container wow bounceInRight">
				<div class="row">
					<div class="col-md-10">
						<div id="mainCarousel" class="carousel slide">
							<ol class="carousel-indicators">
								<li data-target="mainCarousel" data-slide-to="0" class="active"></li>
								<li data-target="mainCarousel" data-slide-to="1"></li>
								<li data-target="mainCarousel" data-slide-to="2"></li>
							</ol>
							<div class="carousel-inner">
								<div class="item active">
									<img src="images/mainCar1.jpg" alt="">
								</div>
								<div class="item">
									<img src="images/mainCar2.jpg" alt="">
								</div>
								<div class="item">
									<img src="images/mainCar3.jpg" alt="">
								</div>
							</div> <!-- end of inner-carousel -->

							<!-- carousel controls -->
							<a class="left carousel-control" href="#mainCarousel" role="button" data-slide="prev" onclick="$('#mainCarousel').carousel('prev')">
								<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a>
							<a class="right carousel-control" href="#mainCarousel" role="button" data-slide="next" onclick="$('#mainCarousel').carousel('next')">
								<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
						</div> <!-- end of carousel -->
					</div>
				</div>
			</div>
    	</div>
    </div> <!-- end of section 2 -->

    <!-- section 3 -->
    <div class="row">
    	<div class="col-md-12">
    		
    	</div>
    </div>

    <!-- section 3: footer -->
    <div id='footer'></div>

    <!-- javascript -->
    <script src="js/jquery-2.1.3.js"></script>
	<script src="js/bootstrap.min.js"></script>
    <script src='js/wow.min.js'></script>

    <script>
		$(document).ready(function() {
            // load footer
            $('#footer').load('footer.html');

			// init wow animator
			new WOW().init();

			// carousel sliding
			$('.carousel').carousel({
		      	interval: 10000
		    })

			// scroll-to-top button
			$(window).scroll(function(){
				if ($(this).scrollTop() > 100) {
					$('.scrollToTop').fadeIn();
				} else {
					$('.scrollToTop').fadeOut();
				}
			});
			
			// click event to scroll to top
			$('.scrollToTop').click(function(){
				$('html, body').animate({scrollTop : 0}, 800);
				return false;
			});
		});

		// enable smooth scrolling
        $(function() {
           $('a[href*=#]:not([href=#])').click(function() {
               if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
                   var target = $(this.hash);
                   target = target.length ? target : $('[name=' + this.hash.slice(1) +']');

                   if (target.length) {
                       $('html, body').animate({
                           scrollTop: target.offset().top
                       }, 1000);

                       return false;
                   }
               }
           });
       });
    </script>
</body>
</html>