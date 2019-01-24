<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="MezunBilgiSistemiASP.index1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mezun Bilgi Sistemi - Ümit DURUR</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-expand fixed-top navbar-dark bg-dark">
                <div class="container">
                    <div></div>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a id="navbarOgrenciAdi" runat="server" class="nav-link btn btn-secondary dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img src="images/iste_arma.png" width="24" height="24" /><span id="navbarspanOgrenciAdi" runat="server"></span>
                            </a>
                        </li>
                        <li class="nav-item col-md-6">
                            <asp:Button ID="btnCikis" runat="server" CssClass="nav-link btn btn-secondary" OnClick="btnCikis_Click" Text="Çıkış"></asp:Button>
                        </li>
                    </ul>
                </div>
            </nav>

            <div class="row">
                <img height="60" />
            </div>
            <div class="row">
                <!--<div class="col-md-2 bg-dark text-white">
                </div>-->
                <div class="col-md-12">
                    <div class="row modal-dialog-centered">
                        <div class="container col-4 col-md-offset-6">

                            <div class="row">
                                <img height="10" />
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text  ">Öğrenci numarası</span>
                                </div>
                                <asp:Label ID="lblOgrenciNo" runat="server" Text="" CssClass="form-control"></asp:Label>
                            </div>

                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Ad-Soyad</span>
                                </div>
                                <asp:TextBox ID="txtAd" runat="server" Text="" CssClass="form-control  "></asp:TextBox>
                            </div>    <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Ad-Soyad</span>
                                </div>
                                <asp:TextBox ID="txtSoyad" runat="server" Text="" CssClass="form-control  "></asp:TextBox>
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Şifre</span>
                                </div>
                                <asp:TextBox ID="txtSifre" runat="server" type="password" CssClass="form-control" Text="******"></asp:TextBox>
                            </div>
                            <hr />
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text  ">Adres</span>
                                </div>
                                <asp:TextBox ID="txtAdres" Height="103px" TextMode="MultiLine" runat="server" Text="" CssClass="form-control mt-0"></asp:TextBox>
                            </div>

                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text  ">Ülke</span>
                                </div>
                                <asp:DropDownList ID="dropdlUlke" AutoPostBack="true" runat="server" CssClass="form-control  " OnSelectedIndexChanged="dropdlUlke_SelectedIndexChanged"></asp:DropDownList>
                            </div>

                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text  ">İl</span>
                                </div>
                                <asp:DropDownList ID="dropdlIL" AutoPostBack="true" runat="server" CssClass="form-control  " OnSelectedIndexChanged="dropdlIL_SelectedIndexChanged"></asp:DropDownList>
                            </div>

                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text  ">İlçe</span>
                                </div>
                                <asp:DropDownList ID="dropdlIlce" runat="server" CssClass="form-control  "></asp:DropDownList>
                            </div>


                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">1. mail</span>
                                </div>
                                <asp:TextBox ID="txtMail1" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                            </div>

                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">2. mail</span>
                                </div>
                                <asp:TextBox ID="txtMail2" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Web sayfası</span>
                                </div>
                                <asp:TextBox ID="txtLinkWeb" runat="server" CssClass='form-control'></asp:TextBox>
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Ev telefonu</span>
                                </div>
                                <asp:TextBox ID="txtEvTel" runat="server" Text="" CssClass="form-control" MaxLength="15"></asp:TextBox>
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">1. Cep telefonu</span>
                                </div>
                                <asp:TextBox ID="txtCep1" runat="server" Text="" CssClass="form-control" MaxLength="15"></asp:TextBox>
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">2. Cep telefonu</span>
                                </div>
                                <asp:TextBox ID="txtCep2" runat="server" Text="" CssClass="form-control" MaxLength="15"></asp:TextBox>
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">İş telefonu</span>
                                </div>
                                <asp:TextBox ID="txtIsTel" runat="server" Text="" CssClass="form-control  " MaxLength="15"></asp:TextBox>
                            </div>


                            <nav class="navbar navbar-light bg-light">
                                <span class="navbar-brand mb-0 h1">Sosyal Medya</span>
                            </nav>

                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Facebook</span>
                                </div>
                                <asp:TextBox ID="txtLinkFB" runat="server" CssClass='form-control'></asp:TextBox>
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Linked-in</span>
                                </div>
                                <asp:TextBox ID="txtLinkLinkedIn" runat="server" CssClass='form-control'></asp:TextBox>
                            </div>
                            <asp:Button runat="server" ID="btnKaydet" Text="Kaydet" CssClass="btn btn-primary btn-block mt-1 float-right" OnClick="btnKaydet_Click" />
                            <asp:Label ID="lblHata" runat="server" Text="Hatalı giriş" Visible="False" CssClass="alert alert-danger mx-auto mt-lg-5" role="alert"></asp:Label>
                            <div>
                                <hr />
                                <nav class="navbar navbar-light bg-light">
                                    <span class="navbar-brand mb-0 h1">Kariyer Bilgileri</span>
                                </nav>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Çalışma Durumu</span>
                                    </div>
                                    <asp:DropDownList ID="dropdlCalismaDurumu" runat="server" CssClass="form-control  ">
                                        <asp:ListItem Value="0">Çalışmıyorum</asp:ListItem>
                                        <asp:ListItem Value="1">Mezuniyet Alanımda Çalışıyorum</asp:ListItem>
                                        <asp:ListItem Value="2">Mezuniyet Alanı Dışında Çalışıyorum</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" id="chbIsAriyorum" runat="server" />
                                        İş Arıyorum
                                    </label>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Kariyer Çalışma Tipi</span>
                                    </div>
                                    <asp:DropDownList ID="dropdlKariyerDurumu" runat="server" CssClass='form-control'>
                                        <asp:ListItem Value="0">Akademik Kariyer Yapmıyorum</asp:ListItem>
                                        <asp:ListItem Value="1">Akademik Kariyer Yapıyorum (Devam Ediyor)</asp:ListItem>
                                        <asp:ListItem Value="2">Akademik Kariyer Yaptım</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Kariyer Tipi</span>
                                    </div>
                                    <asp:DropDownList ID="dropdlKariyerTipi" runat="server" CssClass='form-control'>
                                        <asp:ListItem Value="0">Doktora</asp:ListItem>
                                        <asp:ListItem Value="1">Yüksek Lisans</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Kariyer Yapılan Üniversite</span>
                                    </div>
                                    <asp:TextBox ID="txtUniversite" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Kariyer Yapılan Bölüm</span>
                                    </div>
                                    <asp:TextBox ID="txtBolum" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Kariyer Çalışma Tipi</span>
                                    </div>
                                    <asp:DropDownList ID="dropdlKariyerCalismaTipi" runat="server" CssClass='form-control'>
                                        <asp:ListItem Value="0">Araştırmacı Olarak Çalışıyorum</asp:ListItem>
                                        <asp:ListItem Value="1">Eğitimci Olarak Çalışıyorum</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <asp:Button runat="server" ID="btnKariyerKaydet" Text="Kariyer Kaydet" CssClass="btn btn-primary btn-block mt-1 float-right" OnClick="btnKariyerKaydet_Click" />

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
