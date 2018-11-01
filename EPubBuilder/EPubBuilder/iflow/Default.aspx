<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="iCE_Webapp_Bootstrap.itrack.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>iFlow Product Features</title>
    <meta charset="utf-8" />
    <meta name="description" content="iFlow Product Features" />
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
                        <li class="active"><a href="Default.aspx">iFlow</a></li>
                        <li><a href="iflow.aspx">Start Process</a></li>
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
                    <h2 class="section-title text-center wow fadeInDown">iFlow</h2>
                    <h3 class="text-center wow fadeInDown">Reasons to adopt a Workflow Automation Solution</h3>
                </div>

                <div class="row">
                    <div class="col-lg-6 col-sm-6 center-block">
                        <div class="form-group">
                            <img class="img-responsive" src="../images/contactimg.jpg" />
                        </div>
                        <%--                        <div class="form-group">
                            <a href="#" class="btn btn-primary">Try me</a>
                        </div>--%>
                    </div>

                    <div class="col-sm-6">
                        <div class="form-group">
                            <h2>Workflow Management Platform:</h2>
                            <ol type="1">
                                <li><i>Reducing Errors</i> – The right Workflow Automation solution will eliminate all manual and human error that would otherwise cost precious time and resources to address. The system will notify late actions, non-approvals, overlooked tasks and more.</li>
                                <li><i>Improved Communication</i> – Employees no longer need to manually notify each other when a process is complete or moves from one role to another. Notifications and status updates keep all team members involved and informed.</li>
                                <li><i>Employee Success</i> – A Workflow Automation Platform should set employees up for success. Eliminating repetitive and manual processes motivates employees and allows them to focus on more important tasks which, in turn, can boost morale and enhance product innovation.</li>
                                <li><i>Reduce Costs</i> – The cost associated with human error and time-to-market is significantly reduced if not eliminated altogether. Overall, a streamlined process will optimize use of valuable time and resources.</li>
                                <li><i>Visibility and Status</i> – Management visibility and internal status reporting is made easy when a workflow is automated correctly. Employee approval hierarchy and accountability can now be clearly stated for all to see. This eliminates finger-pointing and promotes complete transparency.</li>
                                <li><i>Scalability</i> – When mundane and manual tasks are automated, resources open up for an organization’s ability to grow. With the right Workflow Automation solution, a company can eliminate bottlenecks and meet new demands.</li>
                                <li><i>Organization</i> – Notifications play an important role in keeping all tasks organized and in view. These notifications can be set through easily identifiable email, text message and platform pop-ups and can replace unorganized post-it notes, white board jotting and employee memory error.</li>
                                <li><i>Integration</i> – With the right platform, an Automated Workflow can integrate 3rd party SaaS applications, ERP systems, and legacy databases where applicable. Now, all disparate data and systems can play appropriate roles in one process.</li>
                                <li><i>Real-Time Reports</i> – Real-Time insight and reporting available to management can improve the decision making process and help an organization learn from inefficiencies.</li>
                            </ol>
                        </div>
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
