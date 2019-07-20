<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>Material Design Bootstrap</title>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  <!-- Bootstrap core CSS -->
  <link href="resources/css/bootstrap.min.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  <link href="resources/css/mdb.min.css" rel="stylesheet">
  <!-- Your custom styles (optional) -->
  <link href="resources/css/style.min.css" rel="stylesheet">
  <style type="text/css">
    html,
    body,
    header,
    .carousel {
      height: 100%;
    }

    @media (min-width: 800px) and (max-width: 850px) {
      .navbar:not(.top-nav-collapse) {
        background: #1C2331 !important;
      }
    }

  </style>
  
  
  <!-- Bootstrap core CSS -->
  <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="resources/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template -->
  <link href="resources/css/landing-page.min.css" rel="stylesheet">
</head>

<body>

  <!-- Navbar -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark scrolling-navbar">
    <div class="container">

      <!-- Brand -->
      <a class="navbar-brand" href="https://mdbootstrap.com/docs/jquery/" target="_blank">
        <strong>MDB</strong>
      </a>

      <!-- Collapse -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <!-- Links -->
      <div class="collapse navbar-collapse" id="navbarSupportedContent">

        <!-- Left -->
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="https://mdbootstrap.com/docs/jquery/" target="_blank">Notice</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="https://mdbootstrap.com/docs/jquery/getting-started/download/" target="_blank">Login</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="https://mdbootstrap.com/education/bootstrap/" target="_blank">new</a>
          </li>
        </ul>

        <!-- Right -->
        <ul class="navbar-nav nav-flex-icons">
          <li class="nav-item">
            <a href="https://www.facebook.com/mdbootstrap" class="nav-link" target="_blank">
              <i class="fab fa-facebook-f"></i>
            </a>
          </li>
          <li class="nav-item">
            <a href="https://twitter.com/MDBootstrap" class="nav-link" target="_blank">
              <i class="fab fa-twitter"></i>
            </a>
          </li>
          <li class="nav-item">
            <a href="https://github.com/mdbootstrap/bootstrap-material-design" class="nav-link border border-light rounded"
              target="_blank">
              <i class="fab fa-github mr-2"></i>MDB GitHub
            </a>
          </li>
        </ul>

      </div>

    </div>
  </nav>
  <!-- Navbar -->

  <!--Carousel Wrapper-->
  <div id="carousel-example-1z" class="carousel slide carousel-fade" data-ride="carousel">

    <!--Indicators-->
    <ol class="carousel-indicators">
      <li data-target="#carousel-example-1z" data-slide-to="0" class="active"></li>
      <li data-target="#carousel-example-1z" data-slide-to="1"></li>
      <li data-target="#carousel-example-1z" data-slide-to="2"></li>
    </ol>
    <!--/.Indicators-->

    <!--Slides-->
    <div class="carousel-inner" role="listbox">

      <!--First slide-->
      <div class="carousel-item active">
        <div class="view">

          <!--Video source-->
          <video class="video-intro" autoplay loop muted>
            <source src="https://mdbootstrap.com/img/video/city.mp4" type="video/mp4">
          </video>

          <!-- Mask & flexbox options-->
          <div class="mask rgba-black-light d-flex justify-content-center align-items-center">

            <!-- Content -->
            <div class="text-center white-text mx-5 wow fadeIn">
              <h1 class="mb-4">
                <strong>Festas 축제 검색 사이트 </strong>
              </h1>


<!-- Masthead -->
  
    
    <div class="container">
      <div class="row">
        <div class="col-xl-9 mx-auto">
        </div>
        <div class="col-md-44 col-lg-15 col-xl-10 mx-auto">
        <form method="get" action="/festival/list" style="align-content: center;">
            <div class="form-row">
              <div class="col-20 col-md-55 mb-55 mb-md-0">
                	<select name="city" class="form-control form-control-lg">
						<option value="서울특별시">서울특별시</option>
						<option value="경기도">경기도</option>
					</select>
			</div>
            <div class="col-20 col-md-55 mb-55 mb-md-0">
              <select name="district" class="form-control form-control-lg">
					<option value="">전체</option>
						<option value="강남구">강남구</option><option value="강동구">강동구</option>
						<option value="강북구">강북구</option><option value="강서구">강서구</option>
						<option value="관악구">관악구</option><option value="광진구">광진구</option>									
						<option value="구로구">구로구</option><option value="금천구">금천구</option>									
						<option value="노원구">노원구</option><option value="도봉구">도봉구</option>									
						<option value="동대문구">동대문구</option><option value="동작구">동작구</option>	
						<option value="마포구">마포구</option><option value="서대문구">서대문구</option>		
						<option value="서초구">서초구</option><option value="성동구">성동구</option>
						<option value="성북구">성북구</option><option value="송파구">송파구</option>
						<option value="양천구">양천구</option><option value="영등포구">영등포구</option>
						<option value="용산구">용산구</option><option value="은평구">은평구</option>
						<option value="종로구">종로구</option><option value="중구">중구</option>
						<option value="중랑구">중랑구</option>		
				</select>
              </div>
              
           <div class="col-20 col-md-55 mb-55 mb-md-0">
             <select name="month" class="form-control form-control-lg">
						<option value="">전체</option>
						<option value="01">1월</option><option value="02">2월</option>
						<option value="03">3월</option><option value="04">4월</option>
						<option value="05">5월</option><option value="06">6월</option>
						<option value="07">7월</option><option value="08">8월</option>
						<option value="09">9월</option><option value="10">10월</option>
						<option value="11">11월</option><option value="12">12월</option>
				</select>
             </div>
           <div class="col-20 col-md-55 mb-55 mb-md-0">
             <select name="type" class="form-control form-control-lg">
						<option value="">전체</option>
						<option value="문화예술">문화예술</option><option value="주민화합">주민화합</option>
						<option value="전통역사">전통역사</option><option value="지역특산물">지역특산물</option>
						<option value="생태자연">생태자연</option><option value="기타">기타</option>
			</select>
             </div>
               <div class="col-20 col-md-55 mb-55 mb-md-0">
               <button type="submit" class="btn btn-block btn-lg btn-primary">검색하기</button>
             </div> 
            </div>
         
<input type="hidden" name="action" value="search">
<input type="hidden" name="pageNo" value="1">
</form>
        </div>
      </div>
    </div>

            </div>
            <!-- Content -->

          </div>
          <!-- Mask & flexbox options-->

        </div>
      </div>
      <!--/First slide-->
	  </div>
    	<!--/.Slides-->

    <!--Controls-->
    <a class="carousel-control-prev" href="#carousel-example-1z" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carousel-example-1z" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
    <!--/.Controls-->

  </div>
  <!--/.Carousel Wrapper-->

  <!--Main layout-->
  <main>
    <div class="container">

      <!--Section: Main info-->
      <section class="mt-5 wow fadeIn">

        <!--Grid row-->
        <div class="row">

          <!--Grid column-->
          <div class="col-md-6 mb-4">

            <img src="https://mdbootstrap.com/img/Marketing/mdb-press-pack/mdb-main.jpg" class="img-fluid z-depth-1-half"
              alt="">

          </div>
          <!--Grid column-->

          <!--Grid column-->
          <div class="col-md-6 mb-4">

            <!-- Main heading -->
            <h3 class="h3 mb-3">Material Design for Bootstrap</h3>
            <p>This template is created with Material Design for Bootstrap (
              <strong>MDB</strong> ) framework.</p>

            <!-- Main heading -->

            <hr>

            <p>
              <strong>400+</strong> material UI elements,
              <strong>600+</strong> material icons,
              <strong>74</strong> CSS animations, SASS files, templates, tutorials and many more.
              <strong>Free for personal and commercial use.</strong>
            </p>

            <!-- CTA -->
            <a target="_blank" href="https://mdbootstrap.com/docs/jquery/getting-started/download/" class="btn btn-grey btn-md">Download
              <i class="fas fa-download ml-1"></i>
            </a>
            <a target="_blank" href="https://mdbootstrap.com/docs/jquery/components/" class="btn btn-grey btn-md">Live
              demo
              <i class="far fa-image ml-1"></i>
            </a>

          </div>
          <!--Grid column-->

        </div>
        <!--Grid row-->

      </section>
      <!--Section: Main info-->
      <hr class="my-5">

      <!--Section: Not enough-->
      <hr class="mb-5">
    </div>
  </main>
  <!--Main layout-->

  <!--Footer-->
  <footer class="page-footer text-center font-small mt-4 wow fadeIn">

    <!--Call to action-->
    <div class="pt-4">
      <a class="btn btn-outline-white" href="https://mdbootstrap.com/docs/jquery/getting-started/download/" target="_blank"
        role="button">Download MDB
        <i class="fas fa-download ml-2"></i>
      </a>
      <a class="btn btn-outline-white" href="https://mdbootstrap.com/education/bootstrap/" target="_blank" role="button">Start
        free tutorial
        <i class="fas fa-graduation-cap ml-2"></i>
      </a>
    </div>
    <!--/.Call to action-->

    <hr class="my-4">

    <!-- Social icons -->
    <div class="pb-4">
      <a href="https://www.facebook.com/mdbootstrap" target="_blank">
        <i class="fab fa-facebook-f mr-3"></i>
      </a>

      <a href="https://twitter.com/MDBootstrap" target="_blank">
        <i class="fab fa-twitter mr-3"></i>
      </a>

      <a href="https://www.youtube.com/watch?v=7MUISDJ5ZZ4" target="_blank">
        <i class="fab fa-youtube mr-3"></i>
      </a>

      <a href="https://plus.google.com/u/0/b/107863090883699620484" target="_blank">
        <i class="fab fa-google-plus-g mr-3"></i>
      </a>

      <a href="https://dribbble.com/mdbootstrap" target="_blank">
        <i class="fab fa-dribbble mr-3"></i>
      </a>

      <a href="https://pinterest.com/mdbootstrap" target="_blank">
        <i class="fab fa-pinterest mr-3"></i>
      </a>

      <a href="https://github.com/mdbootstrap/bootstrap-material-design" target="_blank">
        <i class="fab fa-github mr-3"></i>
      </a>

      <a href="http://codepen.io/mdbootstrap/" target="_blank">
        <i class="fab fa-codepen mr-3"></i>
      </a>
    </div>
    <!-- Social icons -->

    <!--Copyright-->
    <div class="footer-copyright py-3">
      © 2019 Copyright:
      <a href="https://mdbootstrap.com/education/bootstrap/" target="_blank"> MDBootstrap.com </a>
    </div>
    <!--/.Copyright-->

  </footer>
  <!--/.Footer-->

  <!-- SCRIPTS -->
  <!-- JQuery -->
  <script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="resources/js/popper.min.js"></script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="resources/js/mdb.min.js"></script>
  <!-- Initializations -->
  <script type="text/javascript">
    // Animations initialization
    new WOW().init();

  </script>
</body>

</html>
