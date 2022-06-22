<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="KnowledgeBridge.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Knowledge Bridge</title>

    <link href="style.css" rel="stylesheet" />

</head>
<body>

    <form id="form1" runat="server">
        <div class="background">
            <div class="test" id="test">
                <h2>Look at model</h2>
                <asp:Button class="button" ID="btnView" runat="server" Text="Model View" OnClick="btnView_Click" />
                <!-- <br /><br /> -->
                <h2>Go to submission page</h2>
                <asp:Button class="button" ID="btnGoToSubmit" runat="server" OnClick="btnGoToSubmit_Click" Text="To submission" />               
                <!-- <br /><br /> -->   
                <!-- Search bar? -->
                <input class="textbox" type="input">
                <asp:Button class="button" runat="server" Text="Search" />
                <asp:Button class="button" ID="btnOpenLogin" runat="server" Text="Log in" OnClick="btnOpenLogin_Click"  />
                <asp:Button class="button" ID="btnOpenRegister" runat="server" Text="Register" OnClick="btnOpenRegister_Click"  />
            </div>

            <div class="wrapper">
                <section>
                    <div class="content">
                        <p>Selection 1</p>
                        <div id="login" runat="server">
                            <table style="width: 30%;">
                            <tr>
                                <td >Username</td>
                                <td >
                                    <asp:TextBox ID="txtUserLogin" runat="server" placeholder="Username" AutoCompleteType="Disabled"></asp:TextBox>
                                </td>                   
                            </tr>
                            <tr>
                                <td >Password</td>
                                <td >
                                    <asp:TextBox ID="txtPassLogin" runat="server" placeholder="Password" TextMode="Password" CssClass="txtbox"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Log in" />
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:Button ID="btnForgot" runat="server" Text="Forgot password?" OnClick="btnForgot_Click" />
                                </td>
                            </tr>
                        </table>
                        <asp:Label ID="lblWrong" runat="server"></asp:Label>
                        <table style="width: 30%;" id="forgots" runat="server">
                            <tr>
                                <td>Email</td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter email" AutoCompleteType="Disabled" CssClass="txtbox"></asp:TextBox>
                                </td>                   
                            </tr>
                            <tr>
                                <td>Password</td>
                                <td>
                                    <asp:TextBox ID="TextBox2" runat="server" placeholder="New password" TextMode="Password" CssClass="txtbox"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Password</td>
                                <td>
                                    <asp:TextBox ID="TextBox3" runat="server" placeholder="Confirm Password" TextMode="Password" CssClass="txtbox"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:Button ID="Button1" runat="server" OnClick="btnLogin_Click" Text="Replace" />
                                </td>
                            </tr>                            
                        </table>
                        </div>
                        <div id="register" runat="server">
                             <table style="width: 30%;">
                            <tr>
                                <td >Username</td>
                                <td >
                                    <asp:TextBox ID="txtUserRegister" runat="server" placeholder="Username" AutoCompleteType="Disabled"></asp:TextBox>
                                </td>                   
                            </tr>
                            <tr>
                                <td >Password</td>
                                <td >
                                    <asp:TextBox ID="txtPassRegister" runat="server" placeholder="Password" TextMode="Password" CssClass="txtbox"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td >Email</td>
                                <td >
                                    <asp:TextBox ID="txtEmailRegister" runat="server" placeholder="Email" CssClass="txtbox"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
                                </td>
                            </tr>
                        </table>
                        </div>
                    </div>
                </section>

		        <section>Selection 2</section>
		        <section>Selection 3</section>
		        <section>Selection 4</section>
		        <section>Selection 5</section>
            </div>
       </div>

    </form> 


</body>
</html>