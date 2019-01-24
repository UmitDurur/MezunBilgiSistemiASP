<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="kaydol.aspx.cs" Inherits="MezunBilgiSistemiASP.kaydol" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MBS Kayıt</title>
    <link href="css/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" defaultfocus="mezunno">
        <div class="row modal-dialog-centered">
            <div class="container col-md-3 col-md-offset-6">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/iste_logo.png" CssClass="img-fluid mx-auto mb-lg-2 d-block" />
                <asp:TextBox runat="server" ID="mezunno" type="text" CssClass="form-control m-1" placeholder="Mezun Numarası" MaxLength="11" />
                <asp:TextBox runat="server" ID="txtAd" type="text" CssClass="form-control m-1" placeholder="Mezun Adı" />
                <asp:TextBox runat="server" ID="txtSoyad" type="text" CssClass="form-control m-1" placeholder="Mezun Soyadı" />
                <asp:TextBox runat="server" ID="sifre" type="password" CssClass="form-control m-1" placeholder="Şifre" />
                <div class="row">
                    <div class="col col-md-12">
                        <asp:Button runat="server" ID="btnKaydol" Text="Kaydol" CssClass="btn btn-primary btn-block mt-1 float-left" OnClick="btnKaydol_Click" UseSubmitBehavior="False" />
                    </div>
                </div>
                <div class="col col-md-12">
                    <asp:Button runat="server" ID="btnGiris" Text="Giriş" CssClass="btn btn-primary btn-block mt-1 float-right" OnClick="btnGiris_Click" />
                </div>
                <asp:Label ID="lblHata" runat="server" Text="Hatalı giriş" Visible="False" CssClass="alert alert-danger mx-auto mt-lg-5" role="alert"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
