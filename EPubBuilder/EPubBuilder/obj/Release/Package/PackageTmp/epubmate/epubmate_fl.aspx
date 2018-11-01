<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="epubmate_fl.aspx.cs" Inherits="iCE_Webapp_Bootstrap.epubmate.epubmate_fl" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ePubMate Fixed Layout Conversion</title>
    <meta charset="utf-8" />
    <meta name="description" content="ePubMate Fixed Layout Conversion" />
    <meta name="keywords" content="Publishing Automation Systems, ePub fixed layout, interactive ePub, ePub, workflow systems, Book Automation, Workflow management, automated typesetting, Automated Copyediting, XML conversion, InDesign, Pagination, XML First, XML Is, XML Out, IDML, Print and Online deliverables, publishing solutions, Small and Medium size Publishers, Small and Medium Size Typesetting Service Providers, Author Services, Electronic Marketing and Distribution, PubMate.in, ePubMate.com, Automation for print, online, mobile" />

    <!-- core CSS -->
    <meta name="viewport" content="width=device-width, user-scalable=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="shortcut icon" href="../images/imrave.ico" type="image/x-icon" />
    <link rel="icon" href="../images/imrave.ico" type="image/x-icon" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" />
    <link href="../css/animate.min.css" rel="stylesheet" />
    <link href="../css/owl.carousel.css" rel="stylesheet" />
    <link href="../css/owl.transitions.css" rel="stylesheet" />
    <link href="../css/main.css" rel="stylesheet" />
    <link href="../css/style.css" rel="stylesheet" />
    <script src="../js/jquery-1.11.1.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.min.js"></script>

    <link rel="stylesheet" type="text/css" href="https://google-code-prettify.googlecode.com/svn/loader/prettify.css" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.9/css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prettify/r298/run_prettify.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.9/js/bootstrap-dialog.min.js"></script>
    <%--https://nakupanda.github.io/bootstrap3-dialog/#available-options--%>

    <style>
        html {
            background-color: #D4DAE3;
        }

        .login-dialog .modal-dialog {
            width: 300px;
        }

        td {
            text-align: right;
            padding-right: 5px;
        }

        h1 {
            color: #333;
            font-family: arial, sans-serif;
            margin: 1em auto;
            width: 100%;
        }

        .tabordion {
            color: #333;
            display: block;
            font-family: arial, sans-serif;
            margin: auto;
            position: relative;
            width: 95%;
        }

            .tabordion input[name="sections"] {
                left: -9999px;
                position: absolute;
                top: -9999px;
            }

            .tabordion section {
                display: block;
            }

        .tabordion_L {
            background: #ccc;
            border: 1px solid #fff;
            cursor: pointer;
            display: block;
            font-size: 1.2em;
            font-weight: bold;
            padding: 15px 20px;
            position: relative;
            width: 230px;
            z-index: 100;
        }

            .tabordion_L:hover {
                background-color: #FE7114;
            }

        .tabordion section article {
            /*background-color:aqua;*/
            display: none;
            left: 230px;
            min-width: 85%;
            padding: 10px 10px 10px 10px;
            position: absolute;
            top: 0;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }

            .tabordion section article:after {
                background-color: #ccc;
                bottom: 0;
                content: "";
                display: block;
                left: -229px;
                position: absolute;
                top: 0;
                width: 230px;
                z-index: 1;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            }

        .tabordion input[name="sections"]:checked + label {
            background: #FD9618;
            color: #000;
        }

        .tabordion input[name="sections"]:checked ~ article {
            display: block;
        }


        @media (max-width: 1024px) {
            h1 {
                width: 90%;
            }

            .tabordion {
                width: 90%;
            }

            .tabordion_L {
                font-size: 1em;
                min-width: 230px;
                /*width: 230px;*/
            }

            .tabordion section article {
                min-width: 270px;
            }

                .tabordion section article:after {
                    background-color: #ccc;
                    bottom: 0;
                    content: "";
                    display: block;
                    left: -229px;
                    position: absolute;
                    top: 0;
                    min-width: 230px;
                }
        }


        @media (max-width: 1200px) {
            h1 {
                width: 96%;
            }

            .tabordion {
                width: 96%;
            }
        }

        @media (min-width: 986px) {
            h1 {
                width: 70%;
            }

            .tabordion {
                width: 100%;
            }
        }

        .tabcontent {
            margin-left: 10px;
        }
    </style>
    <script type="text/javascript">
        window.onload = FL_load();
        function FL_load() {
        }

        function validNumber() {
            var selectedvalue = document.getElementById("<%=booksize.ClientID%>").value;
            var reg = /^\d+$/;
            if ((!selectedvalue.match(reg))) {
                BootstrapDialog.show({ title: 'Error', message: 'Book size should be Numeric', buttons: [{ label: 'Close', action: function (dialogItself) { dialogItself.close(); } }] });
                document.getElementById('booksize').value = "";
            }
            else {
                if (!(selectedvalue >= 600 && selectedvalue <= 1400)) {
                    BootstrapDialog.show({ title: 'Error - Book Size', message: 'Book size should be Numeric and between 600 and 1400', buttons: [{ label: 'Close', action: function (dialogItself) { dialogItself.close(); } }] });
                    document.getElementById('booksize').value = "";
                }
            }
        }

        function validateTextBox2x() {
            var reg = /^\d+$/;
            var selectedvalue = document.getElementById("<%=txtPagecount.ClientID%>").value;
            var grid = document.getElementById("<%= Gridview2.ClientID%>");

            for (var i = 0; i < grid.rows.length - 1; i++) {
                var ctrl = $("input[id*=TextBox2x]");
                var val = ctrl[i].value;

                if ((!val.match(reg))) {
                    BootstrapDialog.show({ title: 'Error - TOC Level Page Number', message: '<span style="color:red;fontweight:bold;">TOC Level Page Number should be Numeric and should not be empty</span>', buttons: [{ label: 'Close', action: function (dialogItself) { dialogItself.close(); } }] });
                    ctrl[i].value = "";
                }
                else if (Number(val) > Number(selectedvalue)) {
                    BootstrapDialog.show({ title: 'Error - TOC Level Page Number', message: '<span style="color:red;fontweight:bold;">TOC Level Page Number should not be greater than Book Page count</span>', buttons: [{ label: 'Close', action: function (dialogItself) { dialogItself.close(); } }] });
                    ctrl[i].value = "";
                    //document.getElementById(ctrl[i]).value = "";
                }
            }
        }

        function validateTextBox1x() {
            var reg = /^\d+$/;
            var grid = document.getElementById("<%= Gridview2.ClientID%>");

            for (var i = 0; i < grid.rows.length - 1; i++) {
                var ctrl = $("input[id*=TextBox1x]");
                var val = ctrl[i].value;
                //window.alert(val);

                if (val.trim().length < 0) {
                    BootstrapDialog.show({ title: 'Error - TOC Header Text', message: '<span style="color:red;fontweight:bold;">TOC Header text should not be empty</span>', buttons: [{ label: 'Close', action: function (dialogItself) { dialogItself.close(); } }] });
                    //ctrl[i].focus = true;
                    //document.getElementById(ctrl[i]).value = "";
                }
            }
        }

        function Validate_Input() {
            var txt = "";
            var val1 = document.getElementById("<%=txtBooktitle.ClientID%>").value;
            txt += "<tr><td>Book Title</td><td>" + document.getElementById("<%=txtBooktitle.ClientID%>").value + "</td></tr>";
            window.alert(txt);

            var dialog = new BootstrapDialog({
                message: 'Hi Apple!',
                buttons: [{
                    id: 'btn-1',
                    label: 'Button 1'
                }]
            });
            dialog.realize();
            var btn1 = dialog.getButton('btn-1');
            btn1.click({ 'name': 'Apple' }, function (event) {
                alert('Hi, ' + event.data.name);
            });
            dialog.open();
        }

        function validPageCount() {
            var selectedvalue = document.getElementById("<%=txtPagecount.ClientID%>").value;
            var reg = /^\d+$/;
            if ((!selectedvalue.match(reg))) {
                BootstrapDialog.show({ title: 'Error - Page Count', message: '<span style="color:red;fontweight:bold;">Page Count should be Numeric</span>', buttons: [{ label: 'Close', action: function (dialogItself) { dialogItself.close(); } }] });
                document.getElementById('txtPagecount').value = "";
            }
        }

        function validISBN() {
            var selectedvalue = document.getElementById("<%=txtIsbn.ClientID%>").value;
            var reg = /^\d+$/;
            if ((!selectedvalue.match(reg))) {
                BootstrapDialog.show({ title: 'Error - ISBN', message: '<span style="color:red;fontweight:bold;">ISBN should be Numeric</span>', buttons: [{ label: 'Close', action: function (dialogItself) { dialogItself.close(); } }] });
                document.getElementById('txtIsbn').value = "";
            }
        }

        function ProcessCoverRadio() {
            var selectedvalue = $('#<%= coverradio.ClientID %> input:checked').val();
            if (selectedvalue == "yes") { document.getElementById('<%= this.coverupload.ClientID %>').disabled = true; }
            else { document.getElementById('<%= this.coverupload.ClientID %>').disabled = false; }
        }

        function JStocRadio() {
            var selectedvalue = $('#<%= tocradio.ClientID %> input:checked').val();
            if (selectedvalue == "yes") {
                $('#Gridview2 :input').prop('disabled', false);
                document.getElementById('<%= this.ButtonAdd.ClientID %>').disabled = false;
                document.getElementById('<%= this.DeleteLastRow1.ClientID %>').disabled = false;

            }
            else if (selectedvalue == "no") {
                $('#Gridview2 :input').prop('disabled', true);
                document.getElementById('<%= this.ButtonAdd.ClientID %>').disabled = true;
                document.getElementById('<%= this.DeleteLastRow1.ClientID %>').disabled = true;
            }
        }
    </script>
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
                <h2 class="text-left wow">ePubMate - Fixed Layout eBook Conversion</h2>
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <div class="tabordion">
                    <section id="section1">
                        <input type="radio" name="sections" id="option1" checked="true" />
                        <label class="tabordion_L" for="option1">Metadata</label>
                        <article>
                            <div id="metainfo" class="tabcontent">
                                <h4 class="media-heading">Fill Meta Data Information</h4>
                                <div class="form-group">
                                    <table class="fltb1">
                                        <tr class="flpadtop">
                                            <td style="width: 200px;">
                                                <asp:Label Text="Book Title: " runat="server"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox required CssClass="form-control medtxtbox" placeholder="Book Title" ID="txtBooktitle" runat="server"></asp:TextBox>
                                            </td>
                                            <td style="width: 200px;">
                                                <asp:Label Text="ISBN: " runat="server"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox required CssClass="form-control medtxtbox" placeholder="ISBN" ID="txtIsbn" runat="server" onchange="validISBN()"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="flpadtop">
                                            <td style="width: 200px;">
                                                <asp:Label Text="Author Name: " runat="server"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox required CssClass="form-control medtxtbox" placeholder="Author Name" ID="txtAuthname" runat="server"></asp:TextBox>
                                            </td>

                                            <td style="width: 200px;">
                                                <asp:Label Text="Publisher Name: " runat="server"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox required CssClass="form-control medtxtbox" placeholder="Publisher Name" ID="txtpublishername" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="flpadtop">
                                            <td style="width: 200px;">
                                                <asp:Label Text="Page Count: " runat="server"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox required CssClass="form-control medtxtbox" placeholder="Page Count" ID="txtPagecount" runat="server" onchange="validPageCount()"></asp:TextBox>
                                            </td>
                                            <td style="width: 200px;">
                                                <asp:Label Text="Language: " runat="server"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList CssClass="form-control medtxtbox" ID="DropLanguage" placeholder="Language" runat="server">
                                                    <asp:ListItem Text="&#x22;en&#x22; English USA" Value="en"></asp:ListItem>
                                                    <asp:ListItem Text="&#x22;de&#x22; German" Value="de"></asp:ListItem>
                                                    <asp:ListItem Text="&#x22;da&#x22; Danish" Value="da"></asp:ListItem>
                                                    <asp:ListItem Text="&#x22;es&#x22; Spanish" Value="es"></asp:ListItem>
                                                    <asp:ListItem Text="&#x22;nl&#x22; Dutch" Value="nl"></asp:ListItem>
                                                    <asp:ListItem Text="&#x22;he&#x22; Hebrew" Value="he"></asp:ListItem>
                                                    <asp:ListItem Text="&#x22;ar&#x22; Arabic" Value="ar"></asp:ListItem>
                                                    <asp:ListItem Text="&#x22;sa&#x22; Sanskrit" Value="sa"></asp:ListItem>
                                                    <asp:ListItem Text="&#x22;it&#x22; Italian" Value="it"></asp:ListItem>
                                                    <asp:ListItem Text="&#x22;es&#x22; Spanish" Value="es"></asp:ListItem>
                                                    <asp:ListItem Text="&#x22;pt&#x22; Portuguese" Value="pt"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr class="flpadtop">
                                            <td style="width: 200px;">
                                                <asp:Label Text="Page View: " runat="server"></asp:Label>
                                            </td>

                                            <td>
                                                <asp:DropDownList CssClass="form-control medtxtbox" ID="DropLayout" placeholder="PDF Layout" runat="server">
                                                    <asp:ListItem Text="Single Page View" Value="auto"></asp:ListItem>
                                                    <asp:ListItem Text="Spread Page View" Value="both"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td style="width: 200px;">
                                                <asp:Label Text="Delivery Type: " runat="server"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList CssClass="form-control medtxtbox" ID="DropEngine" placeholder="Select Engine" runat="server">
                                                    <asp:ListItem Text="iBB ePub" Value="iBB"></asp:ListItem>
                                                    <asp:ListItem Text="K12 ePub" Value="PearsonHK"></asp:ListItem>
                                                    <asp:ListItem Text="MHE ePub" Value="MHE"></asp:ListItem>
                                                    <asp:ListItem Text="Pixel-Perfect ePub" Value="pixelperfectebook"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr class="flpadtop">
                                            <td style="width: 200px;">
                                                <asp:Label Text="Image Quality: " runat="server"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList CssClass="form-control medtxtbox" ID="imgquality" placeholder="" runat="server">
                                                    <asp:ListItem Text="Good (150 dpi)" Value="150dpi"></asp:ListItem>
                                                    <asp:ListItem Text="Excellent (300 dpi)" Value="300dpi"></asp:ListItem>
                                                    <asp:ListItem Text="Normal (96 dpi)" Value="96dpi"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:Label Text="Book Size(px): " runat="server"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox required CssClass="form-control medtxtbox" placeholder="800" Text="800" ID="booksize" runat="server" onchange="validNumber()"></asp:TextBox>
                                            </td>
                                        </tr>


                                        <tr class="flpadtop">
                                            <td style="width: 200px;">
                                                <asp:Label Text="Background Image Type: " runat="server"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList CssClass="form-control medtxtbox" ID="bgImg" placeholder="" runat="server">
                                                    <asp:ListItem Text="JPG Files" Value="jpg"></asp:ListItem>
                                                    <asp:ListItem Text="SVG Files" Value="svg"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td style="width: 200px;">
                                                <asp:Label Text="Font Type: " runat="server"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList CssClass="form-control medtxtbox" ID="fonttype" placeholder="" runat="server">
                                                    <asp:ListItem Text="WOFF Fonts" Value="woff"></asp:ListItem>
                                                    <asp:ListItem Text="OTF Fonts" Value="otf"></asp:ListItem>
                                                </asp:DropDownList>

                                            </td>
                                        </tr>
                                    </table>
                                    <table class="fltb1">
                                        <tr class="flpadtop">
                                            <td style="width: 250px;">
                                                <asp:Label Text="Front cover included in PDF? " runat="server"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:RadioButtonList runat="server" ID="coverradio" RepeatDirection="Horizontal" onclick="ProcessCoverRadio()">
                                                    <asp:ListItem Text="&nbsp;No&nbsp;&nbsp;" Value="no"></asp:ListItem>
                                                    <asp:ListItem Text="Yes" Value="yes"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                            <td style="width: 150px;">
                                                <asp:Label Text="Upload Cover.jpg: " runat="server"></asp:Label>
                                            </td>
                                            <td style="width: 210px;">
                                                <asp:FileUpload runat="server" CssClass="form-control medtxtbox" ID="coverupload" AllowMultiple="false" />
                                            </td>
                                        </tr>
                                        <tr class="flpadtop">
                                            <td style="width: 200px;">
                                                <asp:Label Text="Backcover included in PDF?(Optional) " runat="server"></asp:Label></td>
                                            <td>
                                                <asp:RadioButtonList runat="server" ID="backcoverradio" RepeatDirection="Horizontal">
                                                    <%-- AutoPostBack="true" OnSelectedIndexChanged="bCovCheked_Changed">--%>
                                                    <asp:ListItem Text="&nbsp;No&nbsp;&nbsp;" Value="no" Selected="true"></asp:ListItem>
                                                    <asp:ListItem Text="Yes" Value="yes"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                            <td>
                                                <asp:Label Text="Upload Backcover.jpg: " runat="server"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:FileUpload runat="server" CssClass="form-control" ID="backcoverupload" AllowMultiple="false" />
                                            </td>
                                        </tr>
                                    </table>

                                    <table class="fltb1">
                                        <tr>
                                            <td style="width: 200px;">
                                                <asp:Label Text="Upload Book PDF(*): " runat="server"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:FileUpload runat="server" CssClass="form-control bigtxtbox" ID="FileUploadControl" AllowMultiple="false" />
                                            </td>
                                        </tr>
                                    </table>

                                    <br />
                                    <table class="fltb1">
                                        <tr>
                                            <td style="width: 100px;"></td>
                                            <td style="width: 400px;">
                                                <asp:RadioButtonList runat="server" Style="width: 350px; margin-left: 20px;" ID="tocradio" RepeatDirection="Horizontal" onclick="JStocRadio()">
                                                    <asp:ListItem Text="TOC required" Value="yes" Selected="true"></asp:ListItem>
                                                    <asp:ListItem Text="TOC not required" Value="no"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                    </table>

                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <table style="width: 800px;">
                                                <tr>
                                                    <td style="width: 175px;"></td>
                                                    <td style="background-color: #b9c1ce;">
                                                        <asp:GridView ID="Gridview2" runat="server" ShowFooter="true" AutoGenerateColumns="false" Width="600px" BorderColor="transparent">
                                                            <Columns>
                                                                <asp:BoundField DataField="RowNumber" HeaderText="Sl.No" ItemStyle-Width="0px">
                                                                    <ItemStyle Width="0px"></ItemStyle>
                                                                </asp:BoundField>
                                                                <asp:TemplateField HeaderText="&nbsp;&nbsp;Level" HeaderStyle-CssClass="">
                                                                    <ItemTemplate>
                                                                        <asp:DropDownList CssClass="form-control medtxtbox" ID="fllevel" placeholder="" runat="server">
                                                                            <asp:ListItem Text="Level 1" Value="Level1"></asp:ListItem>
                                                                            <asp:ListItem Text="Level 2" Value="Level2"></asp:ListItem>
                                                                            <asp:ListItem Text="Level 3" Value="Level3"></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </ItemTemplate>
                                                                    <HeaderStyle CssClass="input_header"></HeaderStyle>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="TOC Text" HeaderStyle-CssClass="input_header">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="TextBox1x" runat="server" placeholder="TOC Header Data"
                                                                            CssClass="form-control medtxtbox1" onlostfocus="validateTextBox1x()" onchange="validateTextBox1x()"></asp:TextBox>
                                                                    </ItemTemplate>
                                                                    <HeaderStyle CssClass="input_header" Height="20px"></HeaderStyle>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Page Number" HeaderStyle-CssClass="">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="TextBox2x" runat="server" placeholder="Page number"
                                                                            CssClass="form-control medtxtbox1" onchange="validateTextBox2x()"></asp:TextBox>
                                                                    </ItemTemplate>
                                                                    <HeaderStyle CssClass="input_header"></HeaderStyle>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;"></td>
                                                    <td style="text-align: center;">
                                                        <asp:Button ID="ButtonAdd" CssClass="btn btn-primary" runat="server" Text="Add Row" CausesValidation="False" OnClick="ButtonAdd_Click" />
                                                        <asp:Button ID="DeleteLastRow1" CssClass="btn btn-primary" runat="server" Text="Delete Row" CausesValidation="False" OnClick="DeleteLastRow1_Click" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <br />
                                    <div class="form-group">
                                        <table style="width: 800px;">
                                            <tr>
                                                <td style="width: 175px;"></td>
                                                <%--OnClientClick="Validate_Input()" onclientclick="return Validate_Input()" --%>
                                                <td style="text-align: center;">
                                                    <asp:Button CssClass="btn btn-primary" ID="Button1" Text="&nbsp;&nbsp;Start Conversion&nbsp;&nbsp;" runat="server" OnClick="btnSubmit_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <br />
                                <div class="form-group">
                                    <asp:Label ID="error_status" Visible="false" runat="server" CssClass="p"></asp:Label>
                                    <div id="errorlable" class="failedLable" runat="server" visible="false" title="Error Files!">Errorfiles</div>
                                </div>
                            </div>
                        </article>
                    </section>
                    <section id="section2">
                        <input type="radio" name="sections" id="option2" />
                        <label class="tabordion_L" for="option2">Reports</label>
                        <article>
                            <div id="reports" class="tabcontent">
                                <h4 class="media-heading">ePubmate Fixed Layout Reports</h4>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true">
                                    <ContentTemplate>
                                        <asp:ListView ID="lvCustomers" runat="server" GroupPlaceholderID="groupPlaceHolder1" ItemPlaceholderID="itemPlaceHolder1" OnPagePropertiesChanging="OnPagePropertiesChanging">
                                            <LayoutTemplate>
                                                <table class="report">
                                                    <tr class="">
                                                        <th>Sl.No</th>
                                                        <th>Input File Name</th>
                                                        <th>Status</th>
                                                        <th>ISBN</th>
                                                        <th>Page Count</th>
                                                        <th>Start Time</th>
                                                        <th>End Time</th>
                                                        <th>Time Taken</th>
                                                        <th>Log</th>
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
                                                <td><%# Eval("slno") %></td>
                                                <td class="shrink120"><a class="black1" href="#" title="<%# Eval("input_file_name") %>"><%# Eval("input_file_name") %></a></td>
                                                <td><%# Eval("status") %></td>
                                                <td><%# Eval("isbn") %></td>
                                                <td><%# Eval("page_count") %></td>
                                                <td><%# Eval("input_time") %></td>
                                                <td><%# Eval("output_time") %></td>
                                                <td><%# Eval("total_time") %></td>

                                                <td><a target="_blank" href="<%# Eval("log_name") %>">
                                                    <img class="imgDN1" style="height: 20px; width: 20px;" src="<%# Eval("ico_name") %>"></img></a></td>

                                                <td><a target="_blank" href="<%# Eval("file_name") %>">
                                                    <img class="imgDN" src="../images/download.png"></img></a>
                                                </td>
                                            </ItemTemplate>
                                        </asp:ListView>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </article>
                    </section>
                </div>
            </div>
        </section>
    </form>
    <%--    
        <footer id="footer">
        <div class="container text-center">
            All rights reserved © 2018 | Powered by iMrave India | Reach us at <a href="../mailto:connect@imrave.in">connect@imrave.in</a> | <a href="../skype:+919960624127?call">+91 9960624127</a>
        </div>
    </footer>--%>
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
                    itemsMobile : [479,4]
            */
        })

    </script>
</body>
</html>
