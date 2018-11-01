<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tryme.aspx.cs" Inherits="EPubBuilder.epubmates.tryme" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="mscaptcha" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

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
    <%--    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.google.com/recaptcha/api.js"></script>--%>

    <link rel="stylesheet" type="text/css" href="https://google-code-prettify.googlecode.com/svn/loader/prettify.css" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.9/css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prettify/r298/run_prettify.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.9/js/bootstrap-dialog.min.js"></script>

    <%--<script type="javascript">
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
</script>--%>
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
                        <img src="../images/logo.png" alt="logo" />
                    </a>
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
                                <li><a href="../conversio/">Conversion</a></li>
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
    <script type="text/javascript">function submit() { $('form1').submit(); }</script>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <section id="services">
            <div class="container-fluid txrow_vc">
                <div class="section-header">
                    <h2 class="section-title text-center wow fadeInDown">ePubMate</h2>
                    <h3 class="text-center wow fadeInDown">Standard eBooks (ePub and .mobi) feature a dynamic (flowable) layout for text and images...</h3>
                </div>
                <div class="row" style="border-top: 1px solid #b5b5bb;">
                    <br />

                    <div class="col-sm-6" style="text-align: center;">

                        <%--<p>Don't have an account with <b>iMrave India</b> yet?</p>--%>
                        <div class="form-group wow fadeInDown">
                            <br />
                            <br />
                            <br />
                            <img src="../images/LBF-2018.jpg" />
                            <%--<asp:Button CssClass="btn btn-primary" ID="btnguest" Text="Try Me as Guest" runat="server" OnClick="btnGuest_Click" />--%>
                            <%--<input type="button" />--%>
                            <%--<a CssClass="form-control" ID="d333" runat="server" href="#" />--%>
                            <%--<a href="#" class="btn btn-primary">Try me</a>--%>
                            <%--<asp:TextBox CssClass="form-control" ID="d333" runat="server" placeholder="Username" />--%>
                            <%--<input type="text" required placeholder="Name" class="form-control" name="name">--%>
                        </div>
                        <%--<p>Learn about our Privacy Policy <a href="#">here.</a></p>--%>
                    </div>

                    <div class="col-sm-6" style="text-align: center;">
                        <h2 class="text-center wow fadeInDown">Register With Us</h2>
                        <div class="form-group wow fadeInDown" style="text-align: center; display: inline-block;">
                            <table style="line-height: 40px;">
                                <tr style="text-align: right;">
                                    <td style="padding-right: 10px;">First Name: </td>
                                    <td>
                                        <asp:TextBox CssClass="form-control setwidth300" required="" ID="Firstname" runat="server" placeholder="First Name" />
                                    </td><td></td></tr>
                                <tr style="text-align: right;">
                                    <td style="padding-right: 10px;">Last Name: </td>
                                    <td>
                                        <asp:TextBox CssClass="form-control setwidth300"  ID="Lastname" required="" runat="server" placeholder="Last Name" />
                                    </td><td></td></tr>
                                <tr style="text-align: right;">
                                    <td style="padding-right: 10px;">E-Mail(Account login name): </td>
                                    <td>
                                        <asp:TextBox CssClass="form-control setwidth300" required="" ID="Email" runat="server" placeholder="E-Mail Address" AutoPostBack="True" OnTextChanged="Email_TextChanged" Width="128px" />@<asp:TextBox CssClass="form-control setwidth300" required="" ID="TextBox1" runat="server"></asp:TextBox>.<asp:TextBox CssClass="form-control setwidth300" required="" ID="TextBox2" runat="server"></asp:TextBox>
                                        
                                    </td><td></td></tr>
                                <tr style="text-align: right;">
                                    <td></td>
                                    <td style="text-align:left;" colspan="2">
                                        <div runat="server" id="Div1">
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Style="color: red; font-size: 12px; text-align: left;" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="Email" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
                                            <asp:Label  ID="Extstlbl" Visible="false" runat="server" text-align="rigtht" CssClass="p" >wwwww</asp:Label>
                                        </div>
                                    </td>
                                </tr>
                                <tr style="text-align: right;">
                                    <td style="padding-right: 10px;">Password: </td>
                                    <td>
                                        <asp:TextBox CssClass="form-control setwidth300" required ID="password1" runat="server" placeholder="Password" />
                                    </td>
                                    <td>
                                        <ajaxToolkit:PasswordStrength ID="txtPassword_PasswordStrength" runat="server" BehaviorID="txtPassword_PasswordStrength" TargetControlID="password1" MinimumLowerCaseCharacters="1" MinimumNumericCharacters="1" MinimumSymbolCharacters="1" MinimumUpperCaseCharacters="1" PreferredPasswordLength="8" />
                                    </td>
                                </tr>
                                <tr style="text-align: right;">
                                    <td style="padding-right: 10px;">Confirm Password: </td>
                                    <td>
                                        <asp:TextBox CssClass="form-control setwidth300" required="" ID="password2" runat="server" TextMode="Password" placeholder="Password" />
                                    </td>
                                    <td>
                                        <asp:CompareValidator ID="comparePasswords"
                                            runat="server"
                                            ControlToCompare="password1"
                                            ControlToValidate="password2"
                                            ErrorMessage="Passwords do not match up!"
                                            Display="Dynamic"
                                            Style="color: red; font-size: 12px;" />
                                    </td>
                                </tr>

                                <tr style="text-align: right;">
                                    <td style="padding-right: 10px;">Country: </td>
                                    <td>
                                        <asp:DropDownList CssClass="form-control setwidth300" ID="country" placeholder="India" runat="server">
                                            <asp:ListItem Value="Afghanistan" Text="Afghanistan"></asp:ListItem>
                                            <asp:ListItem Value="Albania" Text="Albania"></asp:ListItem>
                                            <asp:ListItem Value="Algeria" Text="Algeria"></asp:ListItem>
                                            <asp:ListItem Value="American Samoa" Text="American Samoa"></asp:ListItem>
                                            <asp:ListItem Value="Andorra" Text="Andorra"></asp:ListItem>
                                            <asp:ListItem Value="Angola" Text="Angola"></asp:ListItem>
                                            <asp:ListItem Value="Anguilla" Text="Anguilla"></asp:ListItem>
                                            <asp:ListItem Value="Antartica" Text="Antarctica"></asp:ListItem>
                                            <asp:ListItem Value="Antigua and Barbuda" Text="Antigua and Barbuda"></asp:ListItem>
                                            <asp:ListItem Value="Argentina" Text="Argentina"></asp:ListItem>
                                            <asp:ListItem Value="Armenia" Text="Armenia"></asp:ListItem>
                                            <asp:ListItem Value="Aruba" Text="Aruba"></asp:ListItem>
                                            <asp:ListItem Value="Australia" Text="Australia"></asp:ListItem>
                                            <asp:ListItem Value="Austria" Text="Austria"></asp:ListItem>
                                            <asp:ListItem Value="Azerbaijan" Text="Azerbaijan"></asp:ListItem>
                                            <asp:ListItem Value="Bahamas" Text="Bahamas"></asp:ListItem>
                                            <asp:ListItem Value="Bahrain" Text="Bahrain"></asp:ListItem>
                                            <asp:ListItem Value="Bangladesh" Text="Bangladesh"></asp:ListItem>
                                            <asp:ListItem Value="Barbados" Text="Barbados"></asp:ListItem>
                                            <asp:ListItem Value="Belarus" Text="Belarus"></asp:ListItem>
                                            <asp:ListItem Value="Belgium" Text="Belgium"></asp:ListItem>
                                            <asp:ListItem Value="Belize" Text="Belize"></asp:ListItem>
                                            <asp:ListItem Value="Benin" Text="Benin"></asp:ListItem>
                                            <asp:ListItem Value="Bermuda" Text="Bermuda"></asp:ListItem>
                                            <asp:ListItem Value="Bhutan" Text="Bhutan"></asp:ListItem>
                                            <asp:ListItem Value="Bolivia" Text="Bolivia"></asp:ListItem>
                                            <asp:ListItem Value="Bosnia and Herzegowina" Text="Bosnia and Herzegowina"></asp:ListItem>
                                            <asp:ListItem Value="Botswana" Text="Botswana"></asp:ListItem>
                                            <asp:ListItem Value="Bouvet Island" Text="Bouvet Island"></asp:ListItem>
                                            <asp:ListItem Value="Brazil" Text="Brazil"></asp:ListItem>
                                            <asp:ListItem Value="British Indian Ocean Territory" Text="British Indian Ocean Territory"></asp:ListItem>
                                            <asp:ListItem Value="Brunei Darussalam" Text="Brunei Darussalam"></asp:ListItem>
                                            <asp:ListItem Value="Bulgaria" Text="Bulgaria"></asp:ListItem>
                                            <asp:ListItem Value="Burkina Faso" Text="Burkina Faso"></asp:ListItem>
                                            <asp:ListItem Value="Burundi" Text="Burundi"></asp:ListItem>
                                            <asp:ListItem Value="Cambodia" Text="Cambodia"></asp:ListItem>
                                            <asp:ListItem Value="Cameroon" Text="Cameroon"></asp:ListItem>
                                            <asp:ListItem Value="Canada" Text="Canada"></asp:ListItem>
                                            <asp:ListItem Value="Cape Verde" Text="Cape Verde"></asp:ListItem>
                                            <asp:ListItem Value="Cayman Islands" Text="Cayman Islands"></asp:ListItem>
                                            <asp:ListItem Value="Central African Republic" Text="Central African Republic"></asp:ListItem>
                                            <asp:ListItem Value="Chad" Text="Chad"></asp:ListItem>
                                            <asp:ListItem Value="Chile" Text="Chile"></asp:ListItem>
                                            <asp:ListItem Value="China" Text="China"></asp:ListItem>
                                            <asp:ListItem Value="Christmas Island" Text="Christmas Island"></asp:ListItem>
                                            <asp:ListItem Value="Cocos Islands" Text="Cocos (Keeling) Islands"></asp:ListItem>
                                            <asp:ListItem Value="Colombia" Text="Colombia"></asp:ListItem>
                                            <asp:ListItem Value="Comoros" Text="Comoros"></asp:ListItem>
                                            <asp:ListItem Value="Congo" Text="Congo"></asp:ListItem>
                                            <asp:ListItem Value="Congo" Text="Congo, the Democratic Republic of the"></asp:ListItem>
                                            <asp:ListItem Value="Cook Islands" Text="Cook Islands"></asp:ListItem>
                                            <asp:ListItem Value="Costa Rica" Text="Costa Rica"></asp:ListItem>
                                            <asp:ListItem Value="Cota D'Ivoire" Text="Cote d'Ivoire"></asp:ListItem>
                                            <asp:ListItem Value="Croatia" Text="Croatia (Hrvatska)"></asp:ListItem>
                                            <asp:ListItem Value="Cuba" Text="Cuba"></asp:ListItem>
                                            <asp:ListItem Value="Cyprus" Text="Cyprus"></asp:ListItem>
                                            <asp:ListItem Value="Czech Republic" Text="Czech Republic"></asp:ListItem>
                                            <asp:ListItem Value="Denmark" Text="Denmark"></asp:ListItem>
                                            <asp:ListItem Value="Djibouti" Text="Djibouti"></asp:ListItem>
                                            <asp:ListItem Value="Dominica" Text="Dominica"></asp:ListItem>
                                            <asp:ListItem Value="Dominican Republic" Text="Dominican Republic"></asp:ListItem>
                                            <asp:ListItem Value="East Timor" Text="East Timor"></asp:ListItem>
                                            <asp:ListItem Value="Ecuador" Text="Ecuador"></asp:ListItem>
                                            <asp:ListItem Value="Egypt" Text="Egypt"></asp:ListItem>
                                            <asp:ListItem Value="El Salvador" Text="El Salvador"></asp:ListItem>
                                            <asp:ListItem Value="Equatorial Guinea" Text="Equatorial Guinea"></asp:ListItem>
                                            <asp:ListItem Value="Eritrea" Text="Eritrea"></asp:ListItem>
                                            <asp:ListItem Value="Estonia" Text="Estonia"></asp:ListItem>
                                            <asp:ListItem Value="Ethiopia" Text="Ethiopia"></asp:ListItem>
                                            <asp:ListItem Value="Falkland Islands" Text="Falkland Islands (Malvinas)"></asp:ListItem>
                                            <asp:ListItem Value="Faroe Islands" Text="Faroe Islands"></asp:ListItem>
                                            <asp:ListItem Value="Fiji" Text="Fiji"></asp:ListItem>
                                            <asp:ListItem Value="Finland" Text="Finland"></asp:ListItem>
                                            <asp:ListItem Value="France" Text="France"></asp:ListItem>
                                            <asp:ListItem Value="France Metropolitan" Text="France, Metropolitan"></asp:ListItem>
                                            <asp:ListItem Value="French Guiana" Text="French Guiana"></asp:ListItem>
                                            <asp:ListItem Value="French Polynesia" Text="French Polynesia"></asp:ListItem>
                                            <asp:ListItem Value="French Southern Territories" Text="French Southern Territories"></asp:ListItem>
                                            <asp:ListItem Value="Gabon" Text="Gabon"></asp:ListItem>
                                            <asp:ListItem Value="Gambia" Text="Gambia"></asp:ListItem>
                                            <asp:ListItem Value="Georgia" Text="Georgia"></asp:ListItem>
                                            <asp:ListItem Value="Germany" Text="Germany"></asp:ListItem>
                                            <asp:ListItem Value="Ghana" Text="Ghana"></asp:ListItem>
                                            <asp:ListItem Value="Gibraltar" Text="Gibraltar"></asp:ListItem>
                                            <asp:ListItem Value="Greece" Text="Greece"></asp:ListItem>
                                            <asp:ListItem Value="Greenland" Text="Greenland"></asp:ListItem>
                                            <asp:ListItem Value="Grenada" Text="Grenada"></asp:ListItem>
                                            <asp:ListItem Value="Guadeloupe" Text="Guadeloupe"></asp:ListItem>
                                            <asp:ListItem Value="Guam" Text="Guam"></asp:ListItem>
                                            <asp:ListItem Value="Guatemala" Text="Guatemala"></asp:ListItem>
                                            <asp:ListItem Value="Guinea" Text="Guinea"></asp:ListItem>
                                            <asp:ListItem Value="Guinea-Bissau" Text="Guinea-Bissau"></asp:ListItem>
                                            <asp:ListItem Value="Guyana" Text="Guyana"></asp:ListItem>
                                            <asp:ListItem Value="Haiti" Text="Haiti"></asp:ListItem>
                                            <asp:ListItem Value="Heard and McDonald Islands" Text="Heard and Mc Donald Islands"></asp:ListItem>
                                            <asp:ListItem Value="Holy See" Text="Holy See (Vatican City State)"></asp:ListItem>
                                            <asp:ListItem Value="Honduras" Text="Honduras"></asp:ListItem>
                                            <asp:ListItem Value="Hong Kong" Text="Hong Kong"></asp:ListItem>
                                            <asp:ListItem Value="Hungary" Text="Hungary"></asp:ListItem>
                                            <asp:ListItem Value="Iceland" Text="Iceland"></asp:ListItem>
                                            <asp:ListItem Value="India" Selected Text="India"></asp:ListItem>
                                            <asp:ListItem Value="Indonesia" Text="Indonesia"></asp:ListItem>
                                            <asp:ListItem Value="Iran" Text="Iran (Islamic Republic of)"></asp:ListItem>
                                            <asp:ListItem Value="Iraq" Text="Iraq"></asp:ListItem>
                                            <asp:ListItem Value="Ireland" Text="Ireland"></asp:ListItem>
                                            <asp:ListItem Value="Israel" Text="Israel"></asp:ListItem>
                                            <asp:ListItem Value="Italy" Text="Italy"></asp:ListItem>
                                            <asp:ListItem Value="Jamaica" Text="Jamaica"></asp:ListItem>
                                            <asp:ListItem Value="Japan" Text="Japan"></asp:ListItem>
                                            <asp:ListItem Value="Jordan" Text="Jordan"></asp:ListItem>
                                            <asp:ListItem Value="Kazakhstan" Text="Kazakhstan"></asp:ListItem>
                                            <asp:ListItem Value="Kenya" Text="Kenya"></asp:ListItem>
                                            <asp:ListItem Value="Kiribati" Text="Kiribati"></asp:ListItem>
                                            <asp:ListItem Value="Democratic People's Republic of Korea" Text="Korea, Democratic People's Republic of"></asp:ListItem>
                                            <asp:ListItem Value="Korea" Text="Korea, Republic of"></asp:ListItem>
                                            <asp:ListItem Value="Kuwait" Text="Kuwait"></asp:ListItem>
                                            <asp:ListItem Value="Kyrgyzstan" Text="Kyrgyzstan"></asp:ListItem>
                                            <asp:ListItem Value="Lao" Text="Lao People's Democratic Republic"></asp:ListItem>
                                            <asp:ListItem Value="Latvia" Text="Latvia"></asp:ListItem>
                                            <asp:ListItem Value="Lebanon" Text="Lebanon"></asp:ListItem>
                                            <asp:ListItem Value="Lesotho" Text="Lesotho"></asp:ListItem>
                                            <asp:ListItem Value="Liberia" Text="Liberia"></asp:ListItem>
                                            <asp:ListItem Value="Libyan Arab Jamahiriya" Text="Libyan Arab Jamahiriya"></asp:ListItem>
                                            <asp:ListItem Value="Liechtenstein" Text="Liechtenstein"></asp:ListItem>
                                            <asp:ListItem Value="Lithuania" Text="Lithuania"></asp:ListItem>
                                            <asp:ListItem Value="Luxembourg" Text="Luxembourg"></asp:ListItem>
                                            <asp:ListItem Value="Macau" Text="Macau"></asp:ListItem>
                                            <asp:ListItem Value="Macedonia" Text="Macedonia, The Former Yugoslav Republic of"></asp:ListItem>
                                            <asp:ListItem Value="Madagascar" Text="Madagascar"></asp:ListItem>
                                            <asp:ListItem Value="Malawi" Text="Malawi"></asp:ListItem>
                                            <asp:ListItem Value="Malaysia" Text="Malaysia"></asp:ListItem>
                                            <asp:ListItem Value="Maldives" Text="Maldives"></asp:ListItem>
                                            <asp:ListItem Value="Mali" Text="Mali"></asp:ListItem>
                                            <asp:ListItem Value="Malta" Text="Malta"></asp:ListItem>
                                            <asp:ListItem Value="Marshall Islands" Text="Marshall Islands"></asp:ListItem>
                                            <asp:ListItem Value="Martinique" Text="Martinique"></asp:ListItem>
                                            <asp:ListItem Value="Mauritania" Text="Mauritania"></asp:ListItem>
                                            <asp:ListItem Value="Mauritius" Text="Mauritius"></asp:ListItem>
                                            <asp:ListItem Value="Mayotte" Text="Mayotte"></asp:ListItem>
                                            <asp:ListItem Value="Mexico" Text="Mexico"></asp:ListItem>
                                            <asp:ListItem Value="Micronesia" Text="Micronesia, Federated States of"></asp:ListItem>
                                            <asp:ListItem Value="Moldova" Text="Moldova, Republic of"></asp:ListItem>
                                            <asp:ListItem Value="Monaco" Text="Monaco"></asp:ListItem>
                                            <asp:ListItem Value="Mongolia" Text="Mongolia"></asp:ListItem>
                                            <asp:ListItem Value="Montserrat" Text="Montserrat"></asp:ListItem>
                                            <asp:ListItem Value="Morocco" Text="Morocco"></asp:ListItem>
                                            <asp:ListItem Value="Mozambique" Text="Mozambique"></asp:ListItem>
                                            <asp:ListItem Value="Myanmar" Text="Myanmar"></asp:ListItem>
                                            <asp:ListItem Value="Namibia" Text="Namibia"></asp:ListItem>
                                            <asp:ListItem Value="Nauru" Text="Nauru"></asp:ListItem>
                                            <asp:ListItem Value="Nepal" Text="Nepal"></asp:ListItem>
                                            <asp:ListItem Value="Netherlands" Text="Netherlands"></asp:ListItem>
                                            <asp:ListItem Value="Netherlands Antilles" Text="Netherlands Antilles"></asp:ListItem>
                                            <asp:ListItem Value="New Caledonia" Text="New Caledonia"></asp:ListItem>
                                            <asp:ListItem Value="New Zealand" Text="New Zealand"></asp:ListItem>
                                            <asp:ListItem Value="Nicaragua" Text="Nicaragua"></asp:ListItem>
                                            <asp:ListItem Value="Niger" Text="Niger"></asp:ListItem>
                                            <asp:ListItem Value="Nigeria" Text="Nigeria"></asp:ListItem>
                                            <asp:ListItem Value="Niue" Text="Niue"></asp:ListItem>
                                            <asp:ListItem Value="Norfolk Island" Text="Norfolk Island"></asp:ListItem>
                                            <asp:ListItem Value="Northern Mariana Islands" Text="Northern Mariana Islands"></asp:ListItem>
                                            <asp:ListItem Value="Norway" Text="Norway"></asp:ListItem>
                                            <asp:ListItem Value="Oman" Text="Oman"></asp:ListItem>
                                            <asp:ListItem Value="Pakistan" Text="Pakistan"></asp:ListItem>
                                            <asp:ListItem Value="Palau" Text="Palau"></asp:ListItem>
                                            <asp:ListItem Value="Panama" Text="Panama"></asp:ListItem>
                                            <asp:ListItem Value="Papua New Guinea" Text="Papua New Guinea"></asp:ListItem>
                                            <asp:ListItem Value="Paraguay" Text="Paraguay"></asp:ListItem>
                                            <asp:ListItem Value="Peru" Text="Peru"></asp:ListItem>
                                            <asp:ListItem Value="Philippines" Text="Philippines"></asp:ListItem>
                                            <asp:ListItem Value="Pitcairn" Text="Pitcairn"></asp:ListItem>
                                            <asp:ListItem Value="Poland" Text="Poland"></asp:ListItem>
                                            <asp:ListItem Value="Portugal" Text="Portugal"></asp:ListItem>
                                            <asp:ListItem Value="Puerto Rico" Text="Puerto Rico"></asp:ListItem>
                                            <asp:ListItem Value="Qatar" Text="Qatar"></asp:ListItem>
                                            <asp:ListItem Value="Reunion" Text="Reunion"></asp:ListItem>
                                            <asp:ListItem Value="Romania" Text="Romania"></asp:ListItem>
                                            <asp:ListItem Value="Russia" Text="Russian Federation"></asp:ListItem>
                                            <asp:ListItem Value="Rwanda" Text="Rwanda"></asp:ListItem>
                                            <asp:ListItem Value="Saint Kitts and Nevis" Text="Saint Kitts and Nevis"></asp:ListItem>
                                            <asp:ListItem Value="Saint LUCIA" Text="Saint LUCIA"></asp:ListItem>
                                            <asp:ListItem Value="Saint Vincent" Text="Saint Vincent and the Grenadines"></asp:ListItem>
                                            <asp:ListItem Value="Samoa" Text="Samoa"></asp:ListItem>
                                            <asp:ListItem Value="San Marino" Text="San Marino"></asp:ListItem>
                                            <asp:ListItem Value="Sao Tome and Principe" Text="Sao Tome and Principe"></asp:ListItem>
                                            <asp:ListItem Value="Saudi Arabia" Text="Saudi Arabia"></asp:ListItem>
                                            <asp:ListItem Value="Senegal" Text="Senegal"></asp:ListItem>
                                            <asp:ListItem Value="Seychelles" Text="Seychelles"></asp:ListItem>
                                            <asp:ListItem Value="Sierra" Text="Sierra Leone"></asp:ListItem>
                                            <asp:ListItem Value="Singapore" Text="Singapore"></asp:ListItem>
                                            <asp:ListItem Value="Slovakia" Text="Slovakia (Slovak Republic)"></asp:ListItem>
                                            <asp:ListItem Value="Slovenia" Text="Slovenia"></asp:ListItem>
                                            <asp:ListItem Value="Solomon Islands" Text="Solomon Islands"></asp:ListItem>
                                            <asp:ListItem Value="Somalia" Text="Somalia"></asp:ListItem>
                                            <asp:ListItem Value="South Africa" Text="South Africa"></asp:ListItem>
                                            <asp:ListItem Value="South Georgia" Text="South Georgia and the South Sandwich Islands"></asp:ListItem>
                                            <asp:ListItem Value="Span" Text="Spain"></asp:ListItem>
                                            <asp:ListItem Value="SriLanka" Text="Sri Lanka"></asp:ListItem>
                                            <asp:ListItem Value="St. Helena" Text="St. Helena"></asp:ListItem>
                                            <asp:ListItem Value="St. Pierre and Miguelon" Text="St. Pierre and Miquelon"></asp:ListItem>
                                            <asp:ListItem Value="Sudan" Text="Sudan"></asp:ListItem>
                                            <asp:ListItem Value="Suriname" Text="Suriname"></asp:ListItem>
                                            <asp:ListItem Value="Svalbard" Text="Svalbard and Jan Mayen Islands"></asp:ListItem>
                                            <asp:ListItem Value="Swaziland" Text="Swaziland"></asp:ListItem>
                                            <asp:ListItem Value="Sweden" Text="Sweden"></asp:ListItem>
                                            <asp:ListItem Value="Switzerland" Text="Switzerland"></asp:ListItem>
                                            <asp:ListItem Value="Syria" Text="Syrian Arab Republic"></asp:ListItem>
                                            <asp:ListItem Value="Taiwan" Text="Taiwan, Province of China"></asp:ListItem>
                                            <asp:ListItem Value="Tajikistan" Text="Tajikistan"></asp:ListItem>
                                            <asp:ListItem Value="Tanzania" Text="Tanzania, United Republic of"></asp:ListItem>
                                            <asp:ListItem Value="Thailand" Text="Thailand"></asp:ListItem>
                                            <asp:ListItem Value="Togo" Text="Togo"></asp:ListItem>
                                            <asp:ListItem Value="Tokelau" Text="Tokelau"></asp:ListItem>
                                            <asp:ListItem Value="Tonga" Text="Tonga"></asp:ListItem>
                                            <asp:ListItem Value="Trinidad and Tobago" Text="Trinidad and Tobago"></asp:ListItem>
                                            <asp:ListItem Value="Tunisia" Text="Tunisia"></asp:ListItem>
                                            <asp:ListItem Value="Turkey" Text="Turkey"></asp:ListItem>
                                            <asp:ListItem Value="Turkmenistan" Text="Turkmenistan"></asp:ListItem>
                                            <asp:ListItem Value="Turks and Caicos" Text="Turks and Caicos Islands"></asp:ListItem>
                                            <asp:ListItem Value="Tuvalu" Text="Tuvalu"></asp:ListItem>
                                            <asp:ListItem Value="Uganda" Text="Uganda"></asp:ListItem>
                                            <asp:ListItem Value="Ukraine" Text="Ukraine"></asp:ListItem>
                                            <asp:ListItem Value="United Arab Emirates" Text="United Arab Emirates"></asp:ListItem>
                                            <asp:ListItem Value="United Kingdom" Text="United Kingdom"></asp:ListItem>
                                            <asp:ListItem Value="United States" Text="United States"></asp:ListItem>
                                            <asp:ListItem Value="United States Minor Outlying Islands" Text="United States Minor Outlying Islands"></asp:ListItem>
                                            <asp:ListItem Value="Uruguay" Text="Uruguay"></asp:ListItem>
                                            <asp:ListItem Value="Uzbekistan" Text="Uzbekistan"></asp:ListItem>
                                            <asp:ListItem Value="Vanuatu" Text="Vanuatu"></asp:ListItem>
                                            <asp:ListItem Value="Venezuela" Text="Venezuela"></asp:ListItem>
                                            <asp:ListItem Value="Vietnam" Text="Viet Nam"></asp:ListItem>
                                            <asp:ListItem Value="Virgin Islands (British)" Text="Virgin Islands (British)"></asp:ListItem>
                                            <asp:ListItem Value="Virgin Islands (U.S)" Text="Virgin Islands (U.S.)"></asp:ListItem>
                                            <asp:ListItem Value="Wallis and Futana Islands" Text="Wallis and Futuna Islands"></asp:ListItem>
                                            <asp:ListItem Value="Western Sahara" Text="Western Sahara"></asp:ListItem>
                                            <asp:ListItem Value="Yemen" Text="Yemen"></asp:ListItem>
                                            <asp:ListItem Value="Yugoslavia" Text="Yugoslavia"></asp:ListItem>
                                            <asp:ListItem Value="Zambia" Text="Zambia"></asp:ListItem>
                                            <asp:ListItem Value="Zimbabwe" Text="Zimbabwe"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr style="text-align: right;">
                                    <td style="padding-right: 10px;">Contact Number: </td>
                                    <td>
                                        <asp:TextBox CssClass="form-control setwidth300" ID="contactnum" runat="server" placeholder="Optional" />
                                    </td>
                                    <td></td>
                                </tr>

<%--                                <tr style="text-align: right;">
                                    <td style="padding-right: 10px;">
                                      <botdetect:captcha ID="captchaBox" runat="server"></botdetect:captcha>
                                    </td>
                                    <td>
                                        <asp:textbox CssClass="form-control setwidth300" ID="txtCaptcha" runat="server"></asp:textbox>
                                    </td>
                                    <td>
                                        <asp:Label ID="CaptchaResult" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>--%>




                                <tr style="text-align: right;">
                                    <td style="padding-right: 10px;">Learn about our Privacy Policy <a href="../Privacy_Policy.aspx" target="_blank">here</a></td>
                                    <td style="text-align: left;">
                                        <asp:CheckBox runat="server" ID="terms" Text="&nbsp;I Accept the Terms and Conditions." />
                                    </td>
                                    <td>
                                        <asp:Label ID="accTXT" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr style="text-align: center;">
                                    <td style="padding-right: 10px;"></td>
                                    <td style="padding-top: 10px;">
                                        <asp:Button CssClass="btn btn-primary" ID="btnSubmit" Text="Register and Try Me" Visible ="false" runat="server" OnClick="btnSubmit_Click" />
                                    </td>
                                    <td></td>
                                </tr>
                                <%--<tr style="text-align: right;">
                                    <td style="padding-right: 10px;">CAPTCHA: </td>
                                    <td style="text-align: center;">
                                        <div id="dvCaptcha" style="text-align: center; width: 300px;">
                                        </div>
                                        @ReCaptcha.GetCaptcha()--%>
                                <%--<div class="g-recaptcha" data-sitekey="6Lemc00UAAAAANsfqSvcLN3pVI_tLdUScMWoEOyH"></div>--%>
                                <%--<asp:TextBox ID="txtCaptcha" runat="server" Style="display: none" />
                                        <asp:RequiredFieldValidator ID="rfvCaptcha" ErrorMessage="Captcha validation is required." ControlToValidate="txtCaptcha"
                                            runat="server" ForeColor="Red" Display="Dynamic" />--%>
                                <%--</td>
                                </tr>--%>
                            </table>

                            <%--<input type="text" required placeholder="Name" class="form-control" name="name">--%>
                        </div>
                        <br />

                        <div class="form-group">
                            <table style="line-height: 40px;">
                            </table>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="error_status" Visible="false" runat="server" CssClass="p">wwwww</asp:Label>
                        </div>
                    </div>
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
