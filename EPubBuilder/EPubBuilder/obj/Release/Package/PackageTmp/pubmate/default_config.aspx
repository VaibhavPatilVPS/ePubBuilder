<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default_config.aspx.cs" Inherits="iCE_Webapp_Bootstrap.default_config" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PubMate Default Project Configuration</title>
    <meta charset="utf-8" />
    <meta name="description" content="PubMate Default Project Configuration" />
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
    <form runat="server" name="form1">
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
                        <a class="navbar-brand" href="Default.aspx">
                            <img src="../images/logo.png" alt="logo" /></a>
                    </div>

                    <div class="collapse navbar-collapse navbar-right">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a id="LabelUser" runat="server" href="#">Hi Guest</a></li>
                            <li><a href="Default.aspx">PubMate</a></li>
                            <li><a href="copyediting.aspx">Copy Editing</a></li>
                            <li><a href="pubmate_reports.aspx">Reports</a></li>
                            <li class="drop active">
                                <a id="__admin__" runat="server" href="#">Admin&nbsp;<span class="caret"></span></a>
                                <ul class="drop-down">
                                    <li><a href="user_management.aspx">Manage Users</a></li>
                                    <li><a href="project_management.aspx">Manage Project</a></li>
                                    <li><a href="default_config.aspx">Default Configuration</a></li>
                                    <li><a href="project_config.aspx">Project based Configuration</a></li>
                                    <li><a href="downloads.aspx">PubMate Addons Downloads</a></li>
                                </ul>
                            </li>
                            <li><a href="#">Feedback</a></li>
                            <li class="drop">
                                <a href="../Default.aspx#products"><span></span>Products</a>
                                <ul class="drop-down">
                                    <li><a href="../pubmate/">PubMate</a></li>
                                    <li><a href="../epubmate/">ePubMate</a></li>
                                    <li><a href="../iflow/">iFlow</a></li>
                                    <li><a href="../pagina/">Pagina</a></li>
                                    <li><a href="../conversio/">Conversio</a></li>
                                </ul>
                            </li>

                            <li><a id="login_lbl" runat="server" href="../login.aspx">
                                <img class="imglogin" src="../images/usr2.png" />
                                Login</a></li>
                            <li><a id="logout_Lbl" runat="server" visible="false" href="../logout.aspx">Logout</a></li>
                        </ul>
                    </div>
                </div>
                <!--/.container-->
            </nav>
        </header>
        <!--/header-->
        <section id="get-in-touch">
            <div class="container-fluid txrow_vc">
                <div class="row">
                    <%--<div class="col-lg-6 col-sm-6">--%>
                    <div class="col-6 col-sm-4 col-lg-3">
                        <div class="form-group">
                            <img class="img-responsive" src="../images/iCE_Download.png" />
                        </div>
                    </div>

                    <%--<div class="col-sm-6">--%>
                    <div class="col-12 col-sm-8 col-lg-9">
                        <h3>Client Based Configuration</h3>
                        <asp:TreeView ID="TreeView1" CssClass="treeCSS" runat="server" OnTreeNodeCheckChanged="TreeView1_TreeNodeCheckChanged" ShowCheckBoxes="All" OnTreeNodePopulate="TreeView1_TreeNodePopulate"></asp:TreeView>
                        <asp:Button ID="updateDefaultSettingsBtn" CssClass="btn btn-primary updatebtncss" OnClick="updateDefaultSettingsBtn_Click" runat="server" Text="Update Default Settings" />
                    </div>
                </div>
            </div>
        </section>
        <footer id="footer">
            <div class="container text-center">
                All rights reserved © 2018 | Powered by iMrave India | Reach us at <a href="mailto:connect@imrave.in">connect@imrave.in</a> | <a href="skype:+919960624127?call">+91 9960624127</a>
            </div>
        </footer>
    </form>
    <!--/#footer-->

    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="/http://maps.google.com/maps/api/js?sensor=true"></script>
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
        })

    </script>
</body>
</html>
