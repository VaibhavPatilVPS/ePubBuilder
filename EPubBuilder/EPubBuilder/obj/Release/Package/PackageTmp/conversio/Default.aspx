<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="iCE_Webapp_Bootstrap.conversio.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Conversio Product Features</title>
    <meta charset="utf-8" />
    <meta name="description" content="Conversio Product Features" />
    <meta name="keywords" content="Publishing Automation Systems, ePub fixed layout, interactive ePub, ePub, workflow systems, Book Automation, Workflow management, automated typesetting, Automated Copyediting, XML conversion, InDesign, Pagination, XML First, XML Is, XML Out, IDML, Print and Online deliverables, publishing solutions, Small and Medium size Publishers, Small and Medium Size Typesetting Service Providers, Author Services, Electronic Marketing and Distribution, PubMate.in, ePubMate.com, Automation for print, online, mobile" />

    <link rel="shortcut icon" href="../images/imrave.ico" type="image/x-icon" />
    <link rel="icon" href="../images/imrave.ico" type="image/x-icon" />
    <!-- core CSS -->
    <meta name="viewport" content="width=device-width, user-scalable=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" />
    <link href="../css/animate.min.css" rel="stylesheet" />
    <link href="../css/owl.carousel.css" rel="stylesheet" />
    <link href="../css/owl.transitions.css" rel="stylesheet" />
    <link href="../css/main.css" rel="stylesheet" />
    <link href="../css/style.css" rel="stylesheet" />
</head>
<body id="home" class="homepage">
    <header id="header">
        <nav id="main-menu" class="navbar navbar-default navbar-fixed-top top-nav-collapse" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="../Default.aspx">
                        <img src="../images/logo.png" alt="logo" /></a>
                </div>

                <div class="navbar-collapse navbar-right">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a id="LabelUser" runat="server" href="#">Hi Guest</a></li>
                        <li class="active"><a href="Default.aspx">Conversio</a></li>
                        <li class="drop">
                            <a href="#"><span></span>Start Process</a>
                            <ul class="drop-down">
                                <li><a href="conversio.aspx">Indesign to XML</a></li>
                                <li><a href="pdftoword.aspx">Convert PDF to Word</a></li>
                            </ul>
                        </li>


                        <li class="drop">
                            <a href="Default.aspx#products"><span></span>Products</a>
                            <ul class="drop-down">
                                <li><a href="../pubmate/">PubMate</a></li>
                                <li><a href="../epubmate/">ePubMate</a></li>
                                <li><a href="../iflow/">iFlow</a></li>
                                <li><a href="../pagina/">Pagina</a></li>
                                <li><a href="../conversio/">Conversio</a></li>
                            </ul>
                        </li>
                        <li><a href="../contact.aspx">Contact</a></li>
                        <li><a id="login_lbl" runat="server" href="../login.aspx">
                            <img class="imglogin" src="../images/usr2.png" />
                            Login</a></li>
                        <li><a id="logout_Lbl" runat="server" visible="false" href="../logout.aspx">Logout</a></li>
                    </ul>
                </div>
            </div>
            <!--/.container-->
        </nav>
        <!--/nav-->
    </header>
    <!--/header-->

    <section id="get-in-touch">
        <form runat="server" name="form1">
            <div class="container-fluid txrow_vc1">
                <div class="section-header">
                    <h2 class="section-title text-center wow fadeInDown">Conversio</h2>
                    <h3 class="text-center wow fadeInDown">Large volume conversion of data in many formats to XML. </h3>
                </div>

                <div class="row">

                    <div class="col-lg-6 col-sm-6 center-block">
                        <div class="form-group">
                            <img class="img-responsive" src="../images/contactimg.jpg" />
                        </div>
                    </div>

                    <div class="col-lg-6 col-sm-6 center-block">
                        <div class="form-group">
                            <h2>Schemas and DTDs</h2>
                            <p>Conversio is able to work with both standard and bespoke DTDs and schemas. Standard DTDs, schemas and specifications familiar with include:</p>
                            <h4>DocBook</h4>
                            <p>DocBook is a schema maintained by the DocBook Technical Committee of OASIS. It is particularly well suited to books and papers about computer hardware and software (though it is by no means limited to these applications).</p>
                            <h4>NLM</h4>
                            <p>The National Library of Medicine works with a suite of DTDs that enables it to distribute its journal citation data in a widely used format. The suite has been widely adopted by journal publishers.</p>

                            <ul style="list-style-type: disc">
                                <li>Word to XML Conversion</li>
                                <li>XML to XML Conversion</li>
                                <li>InDesign to XML Conversion</li>
                                <li>Other Formats to XML Conversion</li>
                            </ul>
                        </div>

                    </div>
                    <%--<div class="col-sm-12 col-xs-12 col-lg-12">--%>
                </div>

                <div class="row" style="text-align: center;">
                    <div class="form-group">
                        <a href="../contact.aspx" class="btn btn-primary">Try me</a>
                    </div>
                </div>

            </div>
        </form>
    </section>
    <!--/#get-in-touch-->

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


    <footer id="footer">
        <div class="container text-center">
            All rights reserved © 2018 | Powered by iMrave India | Reach us at <a href="../mailto:connect@imrave.in">connect@imrave.in</a> | <a href="../skype:+919960624127?call">+91 9960624127</a>
        </div>
    </footer>
    <!--/#footer-->

    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../http://maps.google.com/maps/api/js?sensor=true"></script>
    <script src="../js/owl.carousel.min.js"></script>
    <script src="../js/mousescroll.js"></script>
    <script src="../js/smoothscroll.js"></script>
    <script src="../js/jquery.prettyPhoto.js"></script>
    <script src="../js/jquery.isotope.min.js"></script>
    <script src="../js/jquery.inview.min.js"></script>
    <script src="../js/wow.min.js"></script>
    <script src="../js/main.js"></script>
    <script src="../js/scrolling-nav.js"></script>
    <script>

        $(document).ready(function ($) {
            $("#owl-example").owlCarousel();
        });

        $("body").data("page", "frontpage");

        $("#owl-example").owlCarousel({
            items: 3,
            /*        itemsDesktop : [1199,3],
                    itemsDesktopSmall : [980,9],
                    itemsTablet: [768,5],
                    itemsTabletSmall: false,
                    itemsMobile : [479,4]*/
        })

    </script>
</body>
</html>
