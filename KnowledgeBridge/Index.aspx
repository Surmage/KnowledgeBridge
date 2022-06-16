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
            </div>

            <div class="wrapper">
                <section>
                    <div class="content">
                        <p>Selection 1</p>
                  
                        
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