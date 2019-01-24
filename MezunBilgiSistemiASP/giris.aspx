<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="giris.aspx.cs" Inherits="MezunBilgiSistemiASP.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MBS Giriş</title>
    <link href="css/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1"
        defaultfocus="mezunno"
        runat="server">
        <div class="row modal-dialog-centered">
            <div class="container col-md-3 col-md-offset-6">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/iste_logo.png" CssClass="img-fluid mx-auto mb-lg-2 d-block" />
                <asp:TextBox runat="server" ID="mezunno" type="text" CssClass="form-control m-1" placeholder="Mezun Numarası" />
                <asp:TextBox runat="server" ID="sifre"  type="password" CssClass="form-control m-1" placeholder="Şifre" />
                <div class="row">
                    <div class="col col-md-6">
                        <asp:Button runat="server" ID="btnKaydol" Text="Kaydol" CssClass="btn btn-primary btn-block mt-1 float-left" OnClick="btnKaydol_Click" UseSubmitBehavior="False" />
                    </div>
                    <div class="col col-md-6">
                        <asp:Button runat="server" ID="btnGiris" Text="Giriş" CssClass="btn btn-primary btn-block mt-1 float-right" OnClick="btnGiris_Click" />
                    </div>
                </div>
                      <div class="col col-md-12">
                        <asp:Button runat="server" ID="btnYetkili" Text="Yetkili" CssClass="btn btn-primary btn-block mt-1 float-right" OnClick="btnYetkili_Click" />
                    </div>
                <asp:Label ID="lblHata" runat="server" Text="Hatalı giriş" Visible="False" CssClass="alert alert-danger mx-auto mt-lg-5" role="alert"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
