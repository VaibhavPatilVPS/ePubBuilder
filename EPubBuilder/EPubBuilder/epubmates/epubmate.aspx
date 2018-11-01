<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="epubmate.aspx.cs" Inherits="EPubBuilder.epubmate.epubmate" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ePubMate Reflowable Layout Conversion</title>
    <meta charset="utf-8" />
    <meta name="description" content="ePubMate Reflowable Layout Conversion" />
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
                        <li><a href="Default.aspx">ePubMate</a></li>

                        <li class="active drop">
                            <a href="#"><span></span>Start Process</a>
                            <ul class="drop-down">
                                <li><a href="epubmate_fl.aspx">ePub Fixed layout Conversion</a></li>
                                <li><a href="epubmate.aspx">ePub Reflowable layout Conversion</a></li>
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
    <form id="form1" runat="server">
        <section id="services">
            <div class="container-fluid txrow_vc">
                <div class="section-header">
                    <h2 class="section-title text-center wow fadeInDown">ePubMate</h2>
                    <h3 class="text-center wow fadeInDown">Standard eBooks (ePub and .mobi) feature a dynamic (flowable) layout for text and images...</h3>
                </div>
            </div>
        </section>
    </form>

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
