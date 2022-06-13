<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="KnowledgeBridge.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Knowledge Bridge</title>

    <link href="style.css" rel="stylesheet" />

</head>
<body>


    <!-- Search bar? -->
    <form id="form1" runat="server">
        <div id="test">
            <h2>Look at model</h2>
                <asp:Button ID="btnView" runat="server" Text="Model View" OnClick="btnView_Click" />
            <br />
            <br />
            <h2>Go to submission page</h2>
            <asp:Button ID="btnGoToSubmit" runat="server" OnClick="btnGoToSubmit_Click" Text="To submission" />
                <br /><br />
            </div>
    </form> 

        <div class="wrapper">
            <section>Selection 1</section>
		    <section>Selection 2</section>
		    <section>Selection 3</section>
		    <section>Selection 4</section>
		    <section>Selection 5</section>
        </div>

</body>
</html>
