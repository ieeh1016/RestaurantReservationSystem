<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="booksys.application.persistency.Manager"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>SE Restaurant</title>

<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700"
	rel="stylesheet" type="text/css" />
<link href="css/styles.css" rel="stylesheet" />
<style>
<%int bestMenu = Manager.bestMenu() + 1;
if (bestMenu == 1) {%> #menu1 { visibility:visible;
	
}

<%} else if (bestMenu == 2) {%> #menu2 { visibility:visible;
	
}

<%} else if (bestMenu == 3) {%> #menu3 { visibility:visible;
	
}

<%} else if (bestMenu == 4) {%> #menu4 { visibility:visible;
	
}

<%} else if (bestMenu == 5) {%> #menu5 { visibility:visible;
	
}

<%} else if (bestMenu == 6) {%> #menu6 { visibility:visible;
	
}
<%}%>
</style>
</head>
<body id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
				<li class="nav-item"><a class="phone-number">☎031-1234-1234</a></li>
				<li class="nav-item"><a class="nav-link" href="#INFORMATION">INFORMATION</a></li>
				<li class="nav-item"><a class="nav-link" href="#portfolio">MENU</a></li>
				<li class="nav-item"><a class="nav-link" href="#TEAM">TEAM</a></li>
			</ul>
		</div>
	</nav>
	<!-- Masthead-->
	<header class="masthead">
		<!-- background img는 style.css에서 변경 가능 -->
		<div class="container">
			<div class="masthead-subheading">Software Engineering</div>
			<div class="masthead-heading text-uppercase">"SE RESTAURANT"</div>
			<a class="btn btn-primary btn-xl text-uppercase"
				href="Manager_login.jsp">관리자 메뉴</a> <a
				class="btn btn-primary btn-xl text-uppercase"
				href="Customer_login.jsp">예약 확인</a>
		</div>
	</header>
	<!-- Services-->
	<section class="page-section" id="INFORMATION">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">Information</h2>
				<h3 class="section-subheading text-muted"></h3>
			</div>
			<div class="row text-center">
				<div class="col-md-4">
					<span class="fa-stack fa-4x"> <i
						class="fas fa-circle fa-stack-2x text-primary"></i> <i
						class="fas fa-shopping-cart fa-stack-1x fa-inverse"></i>
					</span> <img src="img/dish.png">
					<h4 class="my-3">메뉴 사전 예약</h4>
				</div>
				<div class="col-md-4">
					<span class="fa-stack fa-4x"> <i
						class="fas fa-circle fa-stack-2x text-primary"></i> <i
						class="fas fa-laptop fa-stack-1x fa-inverse"></i>
					</span> <img src="img/check.png">
					<h4 class="my-3">예약 정보 수정</h4>
				</div>
				<div class="col-md-4">
					<span class="fa-stack fa-4x"> <i
						class="fas fa-circle fa-stack-2x text-primary"></i> <i
						class="fas fa-lock fa-stack-1x fa-inverse"></i>
					</span> <img src="img/medal.png">
					<h4 class="my-3">베스트메뉴</h4>
				</div>
			</div>
		</div>
	</section>
	<!-- Portfolio Grid-->
	<section class="page-section bg-light" id="portfolio">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">MENU</h2>
				<h3 class="section-subheading text-muted">화덕에서 직접구운 이탈리아 식 피자와
					특별레시피의 파스타</h3>
			</div>
			<div class="row">
				<div class="col-lg-4 col-sm-6 mb-4">
					<!-- Portfolio item 1-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal"
							href="#portfolioModal1">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<p>₩ 9,000</p>
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div> <img class="img-fluid" src="img/tomato pasta.png" alt="..." />
						</a>
						<div class="portfolio-caption">
							<strong class="bestMenu" id="menu1">⭐레스토랑 추천 메뉴⭐</strong>
							<div class="portfolio-caption-heading">Tomato pasta</div>
							<div class="portfolio-caption-subheading text-muted">직접 만든
								토마토 소스와 베이컨, 블랙 올리브, 파르마지아노 치즈가 잘 어우러진 토마토 파스타</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4">
					<!-- Portfolio item 2-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal"
							href="#portfolioModal2">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<p>₩ 9,500</p>
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div> <img class="img-fluid" src="img/cream pasta.png" alt="..." />
						</a>
						<div class="portfolio-caption">
							<strong class="bestMenu" id="menu2">⭐레스토랑 추천 메뉴⭐</strong>
							<div class="portfolio-caption-heading">Cream pasta</div>
							<div class="portfolio-caption-subheading text-muted">직접 만든
								부드러운 특제 크림 소스에 버섯, 베이컨 등을 넣어 수란을 올린 진한 크림 파스타</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4">
					<!-- Portfolio item 3-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal"
							href="#portfolioModal3">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<p>₩ 10,500</p>
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div> <img class="img-fluid" src="img/rose pasta.png" alt="..." />
						</a>
						<div class="portfolio-caption">
							<strong class="bestMenu" id="menu3">⭐레스토랑 추천 메뉴⭐</strong>
							<div class="portfolio-caption-heading">Rose pasta</div>
							<div class="portfolio-caption-subheading text-muted">부드러운
								특제 크림 소스에 토마토 소스의 감칠맛을 더한 장밋빛의 로제 파스타</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4 mb-lg-0">
					<!-- Portfolio item 4-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal"
							href="#portfolioModal4">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<p>₩ 14,500</p>
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div> <img class="img-fluid" src="img/gorgonzola pizza.jpg" alt="..." />
						</a>
						<div class="portfolio-caption">
							<strong class="bestMenu" id="menu4">⭐레스토랑 추천 메뉴⭐</strong>
							<div class="portfolio-caption-heading">Gorgonzola pizza</div>
							<div class="portfolio-caption-subheading text-muted">고급
								고르곤졸라 치즈를 아낌없이 얹어 달콤한 꿀에 찍어먹는 얇은 고르곤졸라 피자.</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4 mb-sm-0">
					<!-- Portfolio item 5-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal"
							href="#portfolioModal5">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<p>₩ 12,500</p>
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div> <img class="img-fluid" src="img/bulgogi pizza.jpg" alt="..." />
						</a>
						<div class="portfolio-caption">
							<strong class="bestMenu" id="menu5">⭐레스토랑 추천 메뉴⭐</strong>
							<div class="portfolio-caption-heading">Bulgogi pizza</div>
							<div class="portfolio-caption-subheading text-muted">얇고 쫄깃한
								도우 위에 한국인의 입맛을 저격한 달콤짭쪼롬한 소불고기가 가득 올라간 불고기피자.</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6">
					<!-- Portfolio item 6-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal"
							href="#portfolioModal6">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<p>₩ 13,500</p>
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div> <img class="img-fluid" src="img/pepperroni pizza.jpg" alt="..." />
						</a>
						<div class="portfolio-caption">
							<strong class="bestMenu" id="menu6">⭐레스토랑 추천 메뉴⭐</strong>
							<div class="portfolio-caption-heading">Pepperoni pizza</div>
							<div class="portfolio-caption-subheading text-muted">매콤해서
								더욱 감칠맛 도는 페퍼로니가 빈틈없이 얹어진 페퍼로니 피자.</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- About-->
	<section class="page-section" id="TEAM">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">Team</h2>
				<h3 class="section-subheading text-muted">두 달간 수고해준 우리 팀원들을
					소개합니다.</h3>
			</div>
			<ul class="timeline">
				<li>
					<div class="timeline-image">
						<img class="rounded-circle img-fluid" src="img/about1.png"
							alt="..." />
					</div>
					<div class="timeline-panel">
						<div class="timeline-heading">
							<h4>고은영</h4>
							<h4 class="subheading">컴퓨터공학과 201912018</h4>
						</div>
						<div class="timeline-body">
							<p class="text-muted">
								● 제안서 발표<br> ● 최종발표 ppt 제작<br> ● 전반적인 디자인 담당
							</p>
						</div>
					</div>
				</li>
				<li class="timeline-inverted">
					<div class="timeline-image">
						<img class="rounded-circle img-fluid" src="img/about2.png"
							alt="..." />
					</div>
					<div class="timeline-panel">
						<div class="timeline-heading">
							<h4>김가영</h4>
							<h4 class="subheading">컴퓨터공학부 201912021</h4>
						</div>
						<div class="timeline-body">
							<p class="text-muted">
								● 제안서 ppt 제작<br> ● github 형상관리<br> ● 예약 수정 및 통계 기능<br>
								● 최종 발표
							</p>
						</div>
					</div>
				</li>
				<li>
					<div class="timeline-image">
						<img class="rounded-circle img-fluid" src="img/about3.png"
							alt="..." />
					</div>
					<div class="timeline-panel">
						<div class="timeline-heading">
							<h4>박정인</h4>
							<h4 class="subheading">컴퓨터공학부 201912073</h4>
						</div>
						<div class="timeline-body">
							<p class="text-muted">
								● 제안서 내용 제작<br> ● 메뉴 및 로그인 기능<br> ● 메뉴 테이블 추가<br>
								● sql 데이터 작성
							</p>
						</div>
					</div>
				</li>
				<li class="timeline-inverted">
					<div class="timeline-image">
						<img class="rounded-circle img-fluid" src="img/about4.png"
							alt="..." />
					</div>
					<div class="timeline-panel">
						<div class="timeline-heading">
							<h4>전현진</h4>
							<h4 class="subheading">컴퓨터공학부 201912129</h4>
						</div>
						<div class="timeline-body">
							<p class="text-muted">
								● 제안서 내용 제작<br> ● jsp 전체 담당<br> ● 예약 추가 및 삭제 기능<br>
								● 기능 연동 및 코드 정리
							</p>
						</div>
					</div>
				</li>
				<li>
					<div class="timeline-image">
						<img class="rounded-circle img-fluid" src="img/about5.png"
							alt="..." />
					</div>
					<div class="timeline-panel">
						<div class="timeline-heading">
							<h4>현영우</h4>
							<h4 class="subheading">컴퓨터공학부 201611868</h4>
						</div>
						<div class="timeline-body">
							<p class="text-muted">
								● 제안서 내용 제작<br> ● 메뉴 추가<br> ● 포인트 및 통계 기능
							</p>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</section>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>