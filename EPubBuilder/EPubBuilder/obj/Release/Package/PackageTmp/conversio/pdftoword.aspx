<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pdftoword.aspx.cs" Inherits="iCE_Webapp_Bootstrap.conversio.pdftoword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>iMrave :: PDF to Word</title>
    <meta charset="utf-8" />

    <meta name="description" content="iMrave :: PDF to Word" />
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
<body>
    <form id="form1" runat="server">
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
                            <li><a href="Default.aspx">PDF to Word</a></li>
                            <li class="drop active">
                                <a href="#"><span></span>Start Process</a>
                                <ul class="drop-down">
                                    <li><a href="conversio.aspx">Indesign to XML</a></li>
                                    <li><a href="pdftoword.aspx">Convert PDF to Word</a></li>
                                </ul>
                            </li>
                            <li><a href="#">Feedback</a></li>
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
                                <img class="imglogin" src="../images/usr2.png" />Login</a></li>
                            <li><a id="logout_Lbl" runat="server" visible="false" href="../logout.aspx">&nbsp;Logout</a></li>
                        </ul>
                    </div>
                </div>
                <!--/.container-->
            </nav>
            <!--/nav-->
        </header>
        <section id="services">
            <div class="container-fluid txrow_vc">
                <div class="section-header">
                    <h2 class="section-title text-center wow fadeInDown">PDF to Word Conversion</h2>
                    <h3 class="text-center wow fadeInDown">Convert PDF to Word with ease</h3>
                </div>
                <div class="row">
                    <div class="col-sm-3 wow fadeInUp" data-wow-duration="300ms" data-wow-delay="0ms">
                        <div class="media service-box">
                            <div class="media-body">
                                <h4 class="media-heading">Upload PDF file/s</h4>

                                <%--                                <div class="form-group">
                                    <asp:CheckBox ID="eqnyes" CssClass="form-control" Checked="false" runat="server" Text="Does Equation present in PDF?" AutoPostBack="true" OnCheckedChanged="EqnCheked_Changed" />
                                </div>--%>
                                <div class="form-group">
                                    <asp:DropDownList CssClass="form-control" ID="dropeq" runat="server">
                                        <asp:ListItem Text="Equation as Image" Value="True"></asp:ListItem>
                                        <asp:ListItem Text="Equation as Math" Value="False"></asp:ListItem>
                                        <asp:ListItem Text="Auto Zoning" Value="AutoZoning"></asp:ListItem>
                                    </asp:DropDownList>

                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" CssClass="CE_ProjectLable">Select *.Pdf file/s: </asp:Label>
                                    <asp:FileUpload runat="server" CssClass="form-control" ID="inputuploadsingle" AllowMultiple="true" />
                                </div>
                                <div class="form-group">
                                    <asp:Button CssClass="btn btn-primary" ID="Button1" Text="&nbsp;&nbsp;Start Conversion&nbsp;&nbsp;" runat="server" OnClick="btnSubmit_Click" />
                                    <%--<asp:Button CssClass="btn btn-primary" ID="UploadFile" Text="&nbsp;&nbsp;Start Conversion&nbsp;&nbsp;" runat="server" OnClick="UploadFile_Click" />--%>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="error_status" Visible="false" runat="server" CssClass="p"></asp:Label>
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
                                                    <tr class="">
                                                        <th>Sl.No</th>
                                                        <th>Input File Name</th>
                                                        <th>Job Type</th>
                                                        <%--                                           <th>ISBN</th>--%>
                                                        <th>Page Count</th>
                                                        <th>Start Time</th>
                                                        <th>End Time</th>
                                                        <th>Time Taken</th>
                                                        <th>Status</th>
                                                        <th>Download</th>
                                                    </tr>
                                                    <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                                                    <tr>
                                                        <td colspan="9">
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
                                                <td><%# Eval("slno") %></td>
                                                <td class="shrink120"><a class="black1" href="#" title="<%# Eval("input_file_name") %>"><%# Eval("input_file_name") %></a></td>
                                                <%--<td><%# Eval("isbn") %></td>--%>
                                                <td><%# Eval("type") %></td>
                                                <td><%# Eval("page_count") %></td>
                                                <td><%# Eval("input_time") %></td>
                                                <td><%# Eval("output_time") %></td>
                                                <td><%# Eval("total_time") %></td>
                                                <td><%# Eval("status") %></td>
                                                <td><a target="_blank" href="<%# Eval("output_file_name ") %>">
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
            </div>
        </section>
    </form>
</body>
</html>
