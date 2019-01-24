<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bilgiler.aspx.cs" Inherits="MezunBilgiSistemiASP.bilgiler" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MBS  Yönetim-Ayrıntılı Bilgi</title>
    <link href="css/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="row">
                <!--<div class="col-md-2 bg-dark text-white">
                </div>-->
                <div class="col-md-12">
                    <div class="row modal-dialog-centered">
                        <div class="container col-6 col-md-offset-4">

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
                                    <span class="input-group-text">Ad</span>
                                </div>
                                <asp:Label ID="lblAd" runat="server" Text="" CssClass="form-control  "></asp:Label>
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Soyad</span>
                                </div>
                                <asp:Label ID="lblSoyad" runat="server" Text="" CssClass="form-control  "></asp:Label>
                            </div>

                            <hr />
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text  ">Adres</span>
                                </div>
                                <asp:Label ID="lblAdres" Height="103px" runat="server" Text="" CssClass="form-control mt-0"></asp:Label>
                            </div>

                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text  ">Ülke</span>
                                </div>
                                <asp:Label ID="lblUlke" runat="server" CssClass="form-control  "></asp:Label>
                            </div>

                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text  ">İl</span>
                                </div>
                                <asp:Label ID="lblIL" runat="server" CssClass="form-control  "></asp:Label>
                            </div>

                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text  ">İlçe</span>
                                </div>
                                <asp:Label ID="lblIlce" runat="server" CssClass="form-control  "></asp:Label>
                            </div>


                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">1. mail</span>
                                </div>
                                <asp:Label ID="lblMail1" runat="server" Text="" CssClass="form-control  "></asp:Label>
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">2. mail</span>
                                </div>
                                <asp:Label ID="lblMail2" runat="server" Text="" CssClass="form-control  "></asp:Label>
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Web sayfası</span>
                                </div>
                                <a id="linkWeb" runat="server" class='btn btn-outline-primary mt-0 form-control' href='#' role='button'>Link</a>
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Ev telefonu</span>
                                </div>
                                <asp:Label ID="lblEvTel" runat="server" Text="" CssClass="form-control  "></asp:Label>
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">1. Cep telefonu</span>
                                </div>
                                <asp:Label ID="lblCep1" runat="server" Text="" CssClass="form-control  "></asp:Label>
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">2. Cep telefonu</span>
                                </div>
                                <asp:Label ID="lblCep2" runat="server" Text="" CssClass="form-control  "></asp:Label>
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">İş telefonu</span>
                                </div>
                                <asp:Label ID="lblIsTel" runat="server" Text="" CssClass="form-control  "></asp:Label>
                            </div>


                            <nav class="navbar navbar-light bg-light">
                                <span class="navbar-brand mb-0 h1">Sosyal Medya</span>
                            </nav>

                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Facebook</span>
                                </div>
                                <a id="linkFB" runat="server" class='btn btn-outline-primary mt-0 form-control' href='#' role='button'></a>
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Linked-in</span>
                                </div>
                                <a id="linkLinkedIn" runat="server" class='btn btn-outline-primary mt-0 form-control' href='#' role='button'></a>
                            </div>
                            <div>
                                <hr />
                                <nav class="navbar navbar-light bg-light">
                                    <span class="navbar-brand mb-0 h1">Kariyer Bilgileri</span>
                                </nav>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Çalışma Durumu</span>
                                    </div>
                                    <asp:Label ID="lblCalismaDurumu" runat="server" CssClass="form-control  ">
                                    </asp:Label>
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
                                    <asp:Label ID="lblKariyerDurumu" runat="server" CssClass='form-control'>
                                    </asp:Label>
                                </div>

                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Kariyer Tipi</span>
                                    </div>
                                    <asp:Label ID="lblKariyerTipi" runat="server" CssClass='form-control'>
                                    </asp:Label>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Kariyer Yapılan Üniversite</span>
                                    </div>
                                    <asp:Label ID="lblUniversite" runat="server" Text="" CssClass="form-control"></asp:Label>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Kariyer Yapılan Bölüm</span>
                                    </div>
                                    <asp:Label ID="lblBolum" runat="server" Text="" CssClass="form-control"></asp:Label>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Kariyer Çalışma Tipi</span>
                                    </div>
                                    <asp:Label ID="lblKariyerCalismaTipi" runat="server" CssClass='form-control'>
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </form>
</body>
</html>
