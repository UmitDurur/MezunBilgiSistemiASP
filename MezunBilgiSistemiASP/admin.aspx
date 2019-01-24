<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="MezunBilgiSistemiASP.admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MBS Yönetim</title>
    <link href="css/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-expand fixed-top navbar-dark bg-dark" style="max-height: 45px;">
                <div class="container">
                    <div></div>
                    <ul class="navbar-nav">
                        <li class="nav-item col-md-6">
                            <asp:Button ID="btnBekleyenListesi" runat="server" CssClass="nav-link btn btn-secondary" OnClick="btnBekleyenListesi_Click" Text="Bekletilen Kayıtlar"></asp:Button>
                        </li>
                        <li class="nav-item">
                            <a id="navbarYetkiliAdi" runat="server" class="nav-link btn btn-secondary dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img src="images/iste_arma.png" width="20" height="20" /><span id="navbarspanYetkiliAdi" runat="server"></span>
                            </a>
                        </li>
                        <li class="nav-item col-md-6">
                            <asp:Button ID="btnCikis" runat="server" CssClass="nav-link btn btn-secondary" OnClick="btnCikis_Click" Text="Çıkış"></asp:Button>
                        </li>
                    </ul>
                </div>
            </nav>

            <div class="container-fluid">
                <div class="row mt-4">
                    <div class="col-3 " style="min-height: inherit; max-height: inherit; background-color: #eeeeee;">
                        <div style="height: 35px;"></div>
                        <div class="col-md-12">
                            <div class="row modal-dialog-centered">
                                <div class="container col-12">
                                    <div class="input-group mb-3 ml-2">
                                        <input type="checkbox" id="chbtxtOgrenciNo" class="checkbox mt-3" runat="server" />
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Öğrenci NO</span>
                                        </div>
                                        <asp:TextBox ID="txtOgrenciNo" runat="server" AutoPostBack="true" Text="" CssClass="form-control" OnTextChanged="txtOgrenciNo_TextChanged"></asp:TextBox>
                                    </div>

                                    <div class="input-group mb-3  ml-2">
                                        <input type="checkbox" id="chbtxtAd" class="checkbox mt-3" runat="server" />
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Ad</span>
                                        </div>
                                        <asp:TextBox ID="txtAd" runat="server" AutoPostBack="true" Text="" CssClass="form-control" OnTextChanged=" txtOgrenciNo_TextChanged"></asp:TextBox>
                                    </div>


                                    <div class="input-group mb-3  ml-2">
                                        <input type="checkbox" id="chbtxtSoyad" class="checkbox mt-3" runat="server" />
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Soyad</span>
                                        </div>
                                        <asp:TextBox ID="txtSoyad" runat="server" AutoPostBack="true" Text="" CssClass="form-control  " OnTextChanged=" txtOgrenciNo_TextChanged"></asp:TextBox>
                                    </div>

                                    <hr />
                                    <div class="input-group mb-3  ml-2">
                                        <input type="checkbox" id="chbdropdlUlke" class="checkbox mt-3" runat="server" />
                                        <div class="input-group-prepend">
                                            <span class="input-group-text  ">Ülke</span>
                                        </div>
                                        <asp:DropDownList ID="dropdlUlke" AutoPostBack="true" runat="server" CssClass="form-control  " OnSelectedIndexChanged="dropdlUlke_SelectedIndexChanged" OnTextChanged=" txtOgrenciNo_TextChanged"></asp:DropDownList>
                                    </div>

                                    <div class="input-group mb-3  ml-2">
                                        <input type="checkbox" id="chbdropdlIL" class="checkbox mt-3" runat="server" />
                                        <div class="input-group-prepend">
                                            <span class="input-group-text  ">İl</span>
                                        </div>
                                        <asp:DropDownList ID="dropdlIL" AutoPostBack="true" runat="server" CssClass="form-control  " OnSelectedIndexChanged="dropdlIL_SelectedIndexChanged" OnTextChanged=" txtOgrenciNo_TextChanged"></asp:DropDownList>
                                    </div>

                                    <div class="input-group mb-3  ml-2">
                                        <input type="checkbox" id="chbdropdlIlce" class="checkbox mt-3" runat="server" />
                                        <div class="input-group-prepend">
                                            <span class="input-group-text  ">İlçe</span>
                                        </div>
                                        <asp:DropDownList ID="dropdlIlce" AutoPostBack="true" runat="server" CssClass="form-control" OnTextChanged=" txtOgrenciNo_TextChanged"></asp:DropDownList>
                                    </div>
                                    <div>
                                        <hr />
                                        <nav class="navbar navbar-light bg-light">
                                            <span class="navbar-brand mb-0 h1">Kariyer Bilgileri</span>
                                        </nav>
                                        <div class="input-group mb-3  ml-2">
                                            <input type="checkbox" id="chbdropdlCalismaDurumu" class="checkbox mt-3" runat="server" />
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Çalışma Durumu</span>
                                            </div>
                                            <asp:DropDownList ID="dropdlCalismaDurumu" AutoPostBack="true" runat="server" CssClass="form-control" OnTextChanged=" txtOgrenciNo_TextChanged">
                                                <asp:ListItem Value="0">Çalışmıyorum</asp:ListItem>
                                                <asp:ListItem Value="1">Mezuniyet Alanımda Çalışıyorum</asp:ListItem>
                                                <asp:ListItem Value="2">Mezuniyet Alanı Dışında Çalışıyorum</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>

                                        <div class="input-group mb-3  ml-2">
                                            <input type="checkbox" id="chbdropdlIsArama" class="checkbox mt-3" runat="server" />
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">İş arama</span>
                                            </div>
                                            <asp:DropDownList ID="dropdlIsArama" runat="server" CssClass="form-control  " AutoPostBack="true" OnTextChanged=" txtOgrenciNo_TextChanged">
                                                <asp:ListItem Value="0">İş Aramıyor</asp:ListItem>
                                                <asp:ListItem Value="1">İş Arıyor</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="input-group mb-3  ml-2">
                                            <input type="checkbox" id="chbdropdlKariyerDurumu" class="checkbox mt-3" runat="server" />
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Kariyer Durumu</span>
                                            </div>
                                            <asp:DropDownList ID="dropdlKariyerDurumu" runat="server" AutoPostBack="true" CssClass='form-control' OnTextChanged=" txtOgrenciNo_TextChanged">
                                                <asp:ListItem Value="0">Akademik Kariyer Yapmıyorum</asp:ListItem>
                                                <asp:ListItem Value="1">Akademik Kariyer Yapıyorum (Devam Ediyor)</asp:ListItem>
                                                <asp:ListItem Value="2">Akademik Kariyer Yaptım</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>

                                        <div class="input-group mb-3  ml-2">
                                            <input type="checkbox" id="chbdropdlKariyerTipi" class="checkbox mt-3" runat="server" />
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Kariyer Tipi</span>
                                            </div>
                                            <asp:DropDownList ID="dropdlKariyerTipi" runat="server" CssClass='form-control' AutoPostBack="true" OnTextChanged=" txtOgrenciNo_TextChanged">
                                                <asp:ListItem Value="0">Doktora</asp:ListItem>
                                                <asp:ListItem Value="1">Yüksek Lisans</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="input-group mb-3  ml-2">
                                            <input type="checkbox" id="chbtxtUniversite" class="checkbox mt-3" runat="server" />
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Kariyer Yapılan Üniversite</span>
                                            </div>
                                            <asp:TextBox ID="txtUniversite" runat="server" Text="" CssClass="form-control" AutoPostBack="true" OnTextChanged=" txtOgrenciNo_TextChanged"></asp:TextBox>
                                        </div>
                                        <div class="input-group mb-3  ml-2">
                                            <input type="checkbox" id="chbtxtBolum" class="checkbox mt-3" runat="server" />
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Kariyer Yapılan Bölüm</span>
                                            </div>
                                            <asp:TextBox ID="txtBolum" runat="server" Text="" CssClass="form-control" AutoPostBack="true" OnTextChanged=" txtOgrenciNo_TextChanged"></asp:TextBox>
                                        </div>
                                        <div class="input-group mb-3  ml-2">
                                            <input type="checkbox" id="chbdropdlKariyerCalismaTipi" class="checkbox mt-3" runat="server" />
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Kariyer Çalışma Tipi</span>
                                            </div>
                                            <asp:DropDownList ID="dropdlKariyerCalismaTipi" runat="server" CssClass='form-control' AutoPostBack="true" OnTextChanged=" txtOgrenciNo_TextChanged">
                                                <asp:ListItem Value="0">Araştırmacı Olarak Çalışıyorum</asp:ListItem>
                                                <asp:ListItem Value="1">Eğitimci Olarak Çalışıyorum</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <asp:Button runat="server" ID="btnTemizle" Text="Temizle" CssClass="btn btn-primary btn-block mt-1 float-left" OnClick="btnTemizle_Click" />

                                        <asp:Button runat="server" ID="btnFiltrele" Text="Filtrele" CssClass="btn btn-primary btn-block mt-1 float-right" OnClick="btnFiltrele_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div style="height: 10px;"></div>
                    </div>
                    <div class="col-9" style="overflow: auto;">
                        <div style="height: 35px;"></div>
                        <table class="table table-bordered table-striped csstable">
                            <thead>
                                <tr>
                                    <th style="width: 5px;">#</th>
                                    <th>Mezun No</th>
                                    <th>Adı</th>
                                    <th>Soyadı</th>
                                    <th>İşlemler</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptVeri" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <th><%# (Container.ItemIndex +1).ToString() %></th>
                                            <td><a target="_blank" href="bilgiler.aspx?u=<%#Eval("mezunno") %>"><%#Eval("mezunno") %></a></td>
                                            <td><%# Eval("mezunadi") %></td>
                                            <td><%# Eval("mezunsoyadi") %></td>
                                            <td> <% if (sorguDurum == 1)
                                                { %>
                                                <asp:LinkButton ID="btnKabul" runat="server" CssClass=" btn btn-success btn-sm" CommandName="Kabul" CommandArgument='<%#Eval("mezunno") %>' OnCommand="btnSil_Command"> <i class="fa fa-trash" aria-hidden="true"></i>Kabul Et</asp:LinkButton>
                                                <asp:LinkButton ID="btnSil" runat="server" CssClass=" btn btn-danger btn-sm" CommandName="Sil" CommandArgument='<%#Eval("mezunno") %>' OnCommand="btnSil_Command"> <i class="fa fa-trash" aria-hidden="true"></i>Sil</asp:LinkButton><% } %>
                                                <% if (sorguDurum == 0)
                                                { %>
                                                <asp:LinkButton ID="btnGoruntule" runat="server" CssClass=" btn btn-danger btn-sm" CommandName="Goruntule" CommandArgument='<%#Eval("mezunno") %>' OnCommand="btnSil_Command"> <i class="fa fa-trash" aria-hidden="true"></i>Görüntüle</asp:LinkButton><% } %>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
