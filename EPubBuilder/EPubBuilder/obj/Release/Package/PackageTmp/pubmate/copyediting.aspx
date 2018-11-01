<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="copyediting.aspx.cs" Inherits="iCE_Webapp_Bootstrap.copyediting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PubMate Copy editing</title>
    <meta charset="utf-8" />
    <meta name="description" content="PubMate Copy editing" />
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
                        <a class="navbar-brand" href="../Default.aspx">
                            <img src="../images/logo.png" alt="logo" /></a>
                    </div>

                    <div class="collapse navbar-collapse navbar-right">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a id="LabelUser" runat="server" href="#">Hi Guest</a></li>
                            <li><a href="Default.aspx">PubMate</a></li>
                            <li class="active"><a href="#">Copy Editing</a></li>
                            <li><a href="pubmate_reports.aspx">Reports</a></li>
                            <!-- <li><a href="ice_help.aspx">Help</a></li> -->
                            <li class="drop">
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
                                <img class="imglogin" src="../images/usr2.png" />Login</a></li>
                            <li><a id="logout_Lbl" runat="server" visible="false" href="../logout.aspx">Logout</a></li>
                        </ul>
                    </div>
                </div>
                <!--/.container-->
            </nav>
            <!--/nav-->
        </header>
        <!--/header-->

        <section id="services">
            <div class="container-fluid txrow_vc">
                <div class="section-header">
                    <h2 class="section-title text-center wow fadeInDown">PubMate</h2>
                    <h3 class="text-center wow fadeInDown">We help you to focus on your core – <b>Copyediting</b><br />
                        and leave technology costs on us</h3>
                </div>
                <div class="row">
                    <div class="col-sm-3 wow fadeInUp" data-wow-duration="300ms" data-wow-delay="0ms">
                        <div class="media service-box">
                            <div class="pull-left">
                                <img class="img-responsive" src="../images/convertimg.jpg" />
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">Upload Docx for conversion</h4>

                                <div class="form-group">
                                    <asp:Label runat="server" CssClass="CE_ProjectLable">Select Project:</asp:Label>
                                    <asp:DropDownList ID="SelProject" CssClass="form-control" runat="server"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" CssClass="CE_ProjectLable">Select *.docx file/s: </asp:Label>
                                    <asp:FileUpload runat="server" CssClass="form-control" ID="UploadDOCX" AllowMultiple="true" />
                                </div>
                                <div class="form-group">
                                    <asp:Button CssClass="btn btn-primary" ID="UploadFile" Text="&nbsp;&nbsp;Start Conversion&nbsp;&nbsp;" runat="server" OnClick="UploadFile_Click" />
                                </div>
                                <%--<asp:Button CssClass="btn btn-primary" ID="btnSubmit" Text="Login" runat="server" OnClick="btnSubmit_Click" />--%>
                                <div class="form-group">
                                    <asp:Label ID="error_status" Visible="false" runat="server" CssClass="p">wwwww</asp:Label>
                                    <div id="errorlable" class="failedLable" runat="server" visible="false" title="Error Files!">Errorfiles</div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!--/.col-md-4-->

                    <div class="col-sm-9 wow fadeInUp img-responsive" data-wow-duration="300ms" data-wow-delay="100ms">
                        <div class="media service-box">
                            <div class="media-body col-xs-12 wow fadeInUp table-responsive" data-wow-duration="300ms" data-wow-delay="0ms">
                                <%------LIST view Start--------%>
                                <asp:ScriptManager ID="scriptmanager1" runat="server" />
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true">
                                    <ContentTemplate>
                                        <asp:ListView ID="lvCustomers" runat="server" GroupPlaceholderID="groupPlaceHolder1" ItemPlaceholderID="itemPlaceHolder1" OnPagePropertiesChanging="OnPagePropertiesChanging">
                                            <LayoutTemplate>
                                                <table class="report">
                                                    <%-- id, input_file_name, project_name, status, input_time, output_time --%>
                                                    <tr class="">
                                                        <%--<th>Job ID</th>--%>
                                                        <th>Input File Name</th>
                                                        <th>Project</th>
                                                        <th>Status</th>
                                                        <th>Word Count</th>
                                                        <th>Page Count</th>
                                                        <th>Start Time</th>
                                                        <th>End Time</th>
                                                        <th>Time Taken</th>
                                                        <th>HTML View</th>
                                                        <th>Download</th>
                                                    </tr>
                                                    <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                                                    <tr>
                                                        <td colspan="10">
                                                            <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lvCustomers" PageSize="12">
                                                                <Fields>
                                                                    <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="btn btn-primary" ShowFirstPageButton="false" ShowPreviousPageButton="true" ShowNextPageButton="false" />
                                                                    <asp:NumericPagerField ButtonType="Link" />
                                                                    <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="btn btn-primary" ShowNextPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton="false" />
                                                                </Fields>
                                                            </asp:DataPager>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </LayoutTemplate>
                                            <GroupTemplate>
                                                <tr>
                                                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                                                </tr>
                                            </GroupTemplate>
                                            <ItemTemplate>
                                                <%--<td class="xtd"><%# Eval("id") %></td>--%>
                                                <td class="shrink120"><a class="black1" href="#" title="<%# Eval("input_file_name") %>"><%# Eval("input_file_name") %></a></td>
                                                <td><%# Eval("project_name") %></td>
                                                <td><%# Eval("status") %></td>
                                                <td><%# Eval("word_count") %></td>
                                                <td><%# Eval("page_count") %></td>
                                                <td><%# Eval("input_time") %></td>
                                                <td><%# Eval("output_time") %></td>
                                                <td><%# Eval("total_time") %></td>
                                                <td><a target="_blank" href="<%# Eval("html_file") %>">
                                                    <img class="imghtml" src="../images/htmlview2.png"></img></a></td>

                                                <td><a target="_blank" href="<%# Eval("output_file_name") %>">
                                                    <img class="imgDN" src="../images/download.png"></img></a></td>
                                            </ItemTemplate>
                                        </asp:ListView>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                    <!--/.col-md-4-->
                    <!--/.col-md-4-->
                </div>
                <!--/.row-->
            </div>
            <!--/.container-->
        </section>
        <!--/#services-->
        <!--/#get-in-touch-->



        <footer id="footer">
            <div class="container">
                <p class="text-center">All rights reserved © 2018 | Powered by iMrave India | Reach us at <a href="mailto:connect@imrave.in">connect@imrave.in</a> | <a href="skype:+919960624127?call">+91 9960624127</a></p>
            </div>
        </footer>
    </form>
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
            /*        itemsDesktop : [1199,3],
                    itemsDesktopSmall : [980,9],
                    itemsTablet: [768,5],
                    itemsTabletSmall: false,
                    itemsMobile : [479,4]*/
        })

    </script>
</body>
</html>
