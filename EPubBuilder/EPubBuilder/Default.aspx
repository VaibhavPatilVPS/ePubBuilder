<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EPubBuilder.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>iMrave :: Home</title>
    <meta charset="utf-8" />
    <meta name="description" content="Publishing Automation Systems, ePub fixed layout, interactive ePub, ePub, workflow systems, Book Automation, Workflow management, automated typesetting, Automated Copyediting, XML conversion, InDesign, Pagination, XML First, XML Is, XML Out, IDML, Print and Online deliverables, publishing solutions, Small and Medium size Publishers, Small and Medium Size Typesetting Service Providers, Author Services, Electronic Marketing and Distribution, PubMate.in, ePubMate.com, Automation for print, online, mobile" />
    <meta name="keywords" content="Publishing Automation Systems, ePub fixed layout, interactive ePub, ePub, workflow systems, Book Automation, Workflow management, automated typesetting, Automated Copyediting, XML conversion, InDesign, Pagination, XML First, XML Is, XML Out, IDML, Print and Online deliverables, publishing solutions, Small and Medium size Publishers, Small and Medium Size Typesetting Service Providers, Author Services, Electronic Marketing and Distribution, PubMate.in, ePubMate.com, Automation for print, online, mobile" />

    <!-- core CSS -->
    <%--<meta name="viewport" content="width=device-width, user-scalable=no"/>--%>
    <meta name="viewport" content="width=device-width, user-scalable=no" />
    <link rel="shortcut icon" href="images/imrave.ico" type="image/x-icon" />
    <link rel="icon" href="images/imrave.ico" type="image/x-icon" />

    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <link href="css/animate.min.css" rel="stylesheet" />
    <link href="css/owl.carousel.css" rel="stylesheet" />
    <link href="css/owl.transitions.css" rel="stylesheet" />
    <link href="css/main.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
</head>
<body id="home" class="homepage">
    <form id="form1" runat="server">
        <div></div>
    </form>
    <header id="header">
        <nav id="main-menu" class="navbar navbar-default navbar-fixed-top top-nav-collapse" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <%--<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">--%>
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">

                    <%--<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">--%>
                        <%--<span class="sr-only">Toggle navigation</span>--%>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="Default.aspx">
                        <img src="images/logo.png" alt="iMrave Logo" /></a>
                </div>

                <div class="navbar-collapse navbar-right" style="height: auto;">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="active"><a href="#abtImrave">About iMrave</a></li>
                        <li class="drop">
                            <a href="Default.aspx#services"><span></span>Services</a>
                            <ul class="drop-down">
                                <li><a href="Default.aspx#services">Management consulting - Strategy &amp; Operations </a></li>
                                <li><a href="Default.aspx#service2">Publishing technology </a></li>
                                <li><a href="Default.aspx#service3">Adaptive Learning Solutions </a></li>
                                <li><a href="Default.aspx#service4">Business process re-engineering </a></li>
                            </ul>
                        </li>

                        <li class="drop">
                            <a href="Default.aspx#products"><span></span>Products</a>
                            <ul class="drop-down">
                                <li><a href="pubmate/">PubMate</a></li>
                                <li><a href="epubmate/">ePubMate</a></li>
                                <li><a href="iflow/">iFlow</a></li>
                                <li><a href="pagina/">Pagina</a></li>
                                <li><a href="conversio/">Conversio</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Pricing </a></li>
                        <li><a href="contact.aspx">Contact</a></li>
                        <li><a id="login_lbl" runat="server" href="login.aspx">
                            <img class="imglogin" src="images/usr2.png" />
                            Login</a></li>
                        <li><a id="logout_Lbl" runat="server" visible="false" href="logout.aspx">Logout</a></li>
                    </ul>
                    <ul>
                    </ul>
                </div>
            </div>
            <!--/.container-->
        </nav>
        <!--/nav-->
    </header>
    <!--/header-->
    <section id="main-slider">
        <div id="owl-demo" class="owl-carousel owl-theme">
            <div class="item" style="background-image: url(images/slide_1.jpeg);">
                <div class="slider-inner">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12 text-center">
                                <div class="carousel-content">
                                    <h2 class="sliderheader">Management consulting - Strategy & Operations</h2>
                                    <p class="sliderheader_p">We work with senior executives to help them solve their toughest and most complex problems by bringing an approach to executable strategy that combines deep publishing industry knowledge, rigorous analysis, and insight to enable confident action with right technology interventions.</p>
                                    <a class="btn btn-primary btn-lg" href="#">Find Out More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/.item-->
            <div class="item" style="background-image: url(images/slide_2.jpeg);">
                <div class="slider-inner">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12 text-center">
                                <div class="carousel-content">
                                    <h2 class="sliderheader">Publishing technology</h2>
                                    <p class="sliderheader_p">With innovation and technology at the core, we work with our customers more like partners to innovate, collaborate and transform their business through continuous innovation so as to empower service providers and publishers and enabling them to focus on growing their respective core areas</p>
                                    <a class="btn btn-primary btn-lg" href="#">Find Out More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="item" style="background-image: url(images/slide_3.jpeg);">
                <div class="slider-inner">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12 text-center">
                                <div class="carousel-content">
                                    <h2 class="sliderheader">Adaptive Learning Solutions</h2>
                                    <p class="sliderheader_p">An integrated platform for easy access to quality content for continuous development and competitive exams at a reasonable price point.</p>
                                    <a class="btn btn-primary btn-lg" href="#">Find Out More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="item" style="background-image: url(images/slide_4.jpg);">
                <div class="slider-inner">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12 text-center">
                                <div class="carousel-content">
                                    <h2 class="sliderheader">Business process re-engineering</h2>
                                    <p class="sliderheader_p">Agile transformation and software development processes.</p>
                                    <a class="btn btn-primary btn-lg" href="#">Find Out More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/.item-->
        </div>
        <!--/.owl-carousel-->
    </section>
    <!--/#main-slider-->

    <br />
    <br />
    <a id="abtImrave" class="anchor"></a>
    <section>
        <div class="container">

            <div class="section-header">
                <h2 class="section-title text-center wow fadeInDown">About iMrave India</h2>
            </div>
            <div class="row">
                <div class="col-lg-6 col-sm-6">
                    <div class="form-group">
                        <img class="img-responsive" src="images/aboutus.jpg" />
                    </div>
                </div>

                <div class="col-sm-6">
                    <div class="form-group">
                        <h2>Vision</h2>
                        <p class="gen_txt">To create a robust and transparent publishing ecosystem that nurtures technology-driven innovation, quality-enabled efficiency, and quick time to market with the customer/consumer at its core</p>
                    </div>
                    <div class="form-group">
                        <h2>Mission</h2>
                        <p class="gen_txt">To partner with the service providers, publishers and create a futuristic publishing landscape that leverages the best of technology and human expertise to deliver the best across print and digital channels, from manuscript review to marketing and distribution</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <br />
    <br />
    <section id="services">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title text-center wow fadeInDown">iMrave India Services</h2>
                <%--<h4 class="text-center wow fadeInDown">Each will be a banner image with information published on the image</h4>--%>
            </div>
            <a id="service1" class="anchor"></a>
            <div id="" class="row">
                <div class="col-lg-6 col-sm-6">
                    <div class="form-group">
                        <img class="img-responsive" src="images/service1.jpg" />
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <h2>Management consulting - Strategy & Operations</h2>
                        <p class="gen_txt">We work with senior executives to help them solve their toughest and most complex problems by bringing an approach to executable strategy that combines deep publishing industry knowledge, rigorous analysis, and insight to enable confident action with right technology interventions.</p>
                    </div>
                </div>
            </div>
            <a id="service2" class="anchor"></a>
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group">
                        <h2>Publishing technology</h2>
                        <p class="gen_txt">With innovation and technology at the core, we work with our customers more like partners to innovate, collaborate and transform their business through continuous innovation so as to empower service providers and publishers and enabling them to focus on growing their respective core areas</p>
                    </div>
                </div>
                <div class="col-lg-6 col-sm-6">
                    <div class="form-group">
                        <img class="img-responsive" src="images/service2.jpg" />
                    </div>
                </div>
            </div>
            <a id="service3" class="anchor"></a>
            <div class="row">
                <div class="col-lg-6 col-sm-6">
                    <div class="form-group">
                        <img class="img-responsive" src="images/service3.jpg" />
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <h2><a href="http://www.evaluelearn.com/" target="_blank">Adaptive Learning Solutions </a></h2>
                        <p class="gen_txt">An integrated platform for easy access to quality content for continuous development and competitive exams at a reasonable price point.</p>
                    </div>
                </div>
            </div>
            <a id="service4" class="anchor"></a>
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group">
                        <h2>Business process re-engineering</h2>
                        <p class="gen_txt">Agile transformation and software development processes.</p>
                    </div>
                </div>
                <div class="col-lg-6 col-sm-6">
                    <div class="form-group">
                        <img class="img-responsive" src="images/service4.jpg" />
                    </div>
                </div>
            </div>
        </div>
    </section>

    <br />
    <br />
    <a id="products" class="anchor"></a>
    <section>
        <div class="container">
            <div class="section-header">
                <h2 class="section-title text-center wow fadeInDown">Products</h2>
            </div>
            <div class="row">
                <div class="features">
                    <div class="col-md-4 col-sm-6 wow fadeInUp" data-wow-duration="300ms" data-wow-delay="0ms">
                        <div class="media service-box">
                            <div class="pull-left">
                                <img src="images/icon3.png" alt="img" />
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading"><a href="epubmate/" class="extrasize">ePubMate</a></h4>
                                <p class="gen_txt">Standard eBooks (ePub and .mobi) feature a dynamic (flowable) layout for text and images. This means that your eBook will look different when viewed on different eReaders.</p>
                                <p class="gen_txt">Fixed Layout files quite literally “affix“ images and text to exact spots on each electronic page—just like their printed book counterparts—so that they look the same, regardless of which reader you use.</p>
                            </div>
                        </div>
                    </div>
                    <!--/.col-md-4-->

                    <div class="col-md-4 col-sm-6 wow fadeInUp" data-wow-duration="300ms" data-wow-delay="100ms">
                        <div class="media service-box">
                            <div class="pull-left">
                                <img src="images/icon2.png" alt="img" />
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading"><a href="pubmate/" class="extrasize">PubMate</a></h4>
                                <p class="gen_txt">A word-by-word edit that addresses grammar, usage, and consistency issues. Check for typographical errors, spelling errors, and consistency aspects. Correction of grammatical and linguistic errors, attention to punctuations such as commas, semicolons, quotation marks, etc.</p>
                                <p class="gen_txt">A review to ensure accurate and consistent usage.</p>
                            </div>
                        </div>
                    </div>
                    <!--/.col-md-4-->

                    <div class="col-md-4 col-sm-6 wow fadeInUp" data-wow-duration="300ms" data-wow-delay="200ms">
                        <div class="media service-box">
                            <div class="pull-left">
                                <img src="images/icon2.png" alt="img" />
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading"><a href="pagina/" class="extrasize">Pagina</a></h4>
                                <p class="gen_txt">A well-formatted and designed book is critical to your success as an author. Even though you worked hard on your manuscript, it may not get the attention it deserves without professional formatting.</p>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="features">
                    <div class="col-md-4 col-sm-6 wow fadeInUp" data-wow-duration="300ms" data-wow-delay="0ms">
                        <div class="media service-box">
                            <div class="pull-left">
                                <img src="images/icon1.png" alt="img" />
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading"><a href="conversio/" class="extrasize">Conversio</a></h4>
                                <p class="gen_txt">XML conversion from different formats such as text, html, pdf, jpg, pdf to XML ensure easy and rapid publishing of information on the web, regardless of the format of the originating source. Hence, many organizations are increasingly turning to XML conversion for their web publishing as they often face the need to convert large number of documents into an XML compatible form quickly and efficiently.</p>
                            </div>
                        </div>
                    </div>
                    <!--/.col-md-4-->

                    <div class="col-md-4 col-sm-6 wow fadeInUp" data-wow-duration="300ms" data-wow-delay="100ms">
                        <div class="media service-box">
                            <div class="pull-left">
                                <img src="images/icon2.png" alt="img" />
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading"><a href="iflow/" class="extrasize">iFlow</a></h4>
                                <p class="gen_txt">Workflow Automation is a concept that transforms existing business activities, roles and tasks from legacy and manual systems into a centralized, automated structure. Actions, such as approvals, requests, assignments and claims, once handled manually and on paper, can now be executed digitally and through an organized workflow.</p>
                            </div>
                        </div>
                    </div>
                    <!--/.col-md-4-->

                    <%--                    <div class="col-md-4 col-sm-6 wow fadeInUp" data-wow-duration="300ms" data-wow-delay="200ms">
                        <div class="media service-box">
                            <div class="pull-left">
                                <img src="images/icon2.png" alt="img" />
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading"><a href="ice_details.aspx">Pagina</a></h4>
                                <p class="gen_txt">A well-formatted and designed book is critical to your success as an author. Even though you worked hard on your manuscript, it may not get the attention it deserves without professional formatting.</p>

                            </div>
                        </div>
                    </div>--%>
                </div>
            </div>
            <!--/.row-->
        </div>
        <!--/.container-->
    </section>

    <section id="portfolio" style="background-color: #df6c04; margin: 0;">
        <div class="container">
            <div class="row">
                <div class="col-sm-3 col-xs-6">
                    <h3>Services</h3>
                    <ul class="footerlink">
                        <li><a class="footerlink" href="#services">Management consulting - Strategy & Operations </a></li>
                        <li><a class="footerlink" href="#service2">Publishing technology </a></li>
                        <li><a class="footerlink" href="#service3">Adaptive Learning Solutions </a></li>
                        <li><a class="footerlink" href="#service4">Business process re-engineering </a></li>
                    </ul>
                </div>
                <!--/.portfolio-item-->

                <div class="col-sm-3 col-xs-6">
                    <h3>Products</h3>
                    <ul class="footerlink">
                        <li><a class="footerlink" href="../pubmate/">PubMate </a></li>
                        <li><a class="footerlink" href="../epubmate/">ePubMate </a></li>
                        <li><a class="footerlink" href="#">iFlow </a></li>
                        <li><a class="footerlink" href="../pagina/">Pagina </a></li>
                        <li><a class="footerlink" href="../conversio/">Conversio </a></li>
                    </ul>
                </div>
                <!--/.portfolio-item-->

                <div class="col-sm-3 col-xs-6">
                    <h3>Links</h3>
                    <ul class="footerlink">
                        <li><a class="footerlink" href="#">Home </a></li>
                        <li><a class="footerlink" href="#">About iMrave India </a></li>
                        <li><a class="footerlink" href="#">Pricing </a></li>
                        <li><a class="footerlink" href="#">Contact </a></li>
                        <li><a class="footerlink" href="#">Newsletter </a></li>
                    </ul>
                </div>
                <!--/.portfolio-item-->

                <div class="col-sm-3 col-xs-6">
                    <h3>Social</h3>
                    <p style="margin: 0;"><a class="footerlink" href="#"><span class="fa fa-facebook"></span>&nbsp;&nbsp;Facebook</a></p>
                    <p style="margin: 0;"><a class="footerlink" href="#"><span class="fa fa-linkedin"></span>&nbsp;&nbsp;Linkedin</a></p>
                    <p style="margin: 0;"><a class="footerlink" href="#"><span class="fa fa-twitter"></span>&nbsp;&nbsp;Twitter</a></p>
                    <p style="margin: 0;"><a class="footerlink" href="#"><span class="fa fa-skype"></span>&nbsp;&nbsp;Skype</a></p>
                    <p style="margin: 0;"><a class="footerlink" href="#"><span class="fa fa-google"></span>&nbsp;&nbsp;Google</a></p>
                    <p style="margin: 0;"><a class="footerlink" href="#"><span class="fa fa-youtube"></span>&nbsp;&nbsp;Youtube</a></p>
                </div>
                <!--/.portfolio-item-->
            </div>
        </div>
        <!--/.container-->
    </section>
    <!--/#portfolio-->

    <footer id="footer">
        <div class="container text-center">
            All rights reserved © 2018 | Powered by iMrave India | Reach us at <a href="mailto:connect@imrave.in">connect@imrave.in</a> | <a href="skype:+919960624127?call">+91 9960624127</a>
        </div>
    </footer>
    <!--/#footer-->

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="http://maps.google.com/maps/api/js?sensor=true"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/mousescroll.js"></script>
    <script src="js/smoothscroll.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/jquery.inview.min.js"></script>
    <script src="js/wow.min.js"></script>
    <script src="js/main.js"></script>
    <script src="js/scrolling-nav.js"></script>
    <script>

        $(document).ready(function ($) {
            $("#owl-example").owlCarousel();
        });

        $("body").data("page", "frontpage");

        $("#owl-example").owlCarousel({
            items: 3,
            //itemsDesktop : [1199,3],
            //itemsDesktopSmall : [980,9],
            //itemsTablet: [768,5],
            //itemsTabletSmall: false,
            //itemsMobile : [479,4]
        })
    </script>
</body>
</html>

