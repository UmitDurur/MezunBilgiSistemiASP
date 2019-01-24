using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MezunBilgiSistemiASP
{
    public partial class bilgiler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["yetkilino"] == null)
            {
                Response.Redirect("yetkiligiris.aspx");
            }

            if (!IsPostBack)
            {
                string numara = Request.QueryString["u"];

                MySqlConnection baglanti = genelislemler.baglan();
                MySqlCommand komut = new MySqlCommand("select * from mezunbilgileri as mb inner join iletisimbilgileri as ib on mb.mezunno=ib.mezunno inner join kariyerbilgileri as kb on mb.mezunno=kb.mezunno inner join country as c on ib.ulke=c.CountryID inner join city on ib.il=city.CityID inner join town on ib.ilce=town.TownID where ib.mezunno=" + numara, baglanti);
                MySqlDataReader dr = komut.ExecuteReader();
                if (dr.Read())
                {
                    lblOgrenciNo.Text =numara;
                    lblAd.Text = dr["mezunadi"].ToString();
                    lblSoyad.Text = dr["mezunsoyadi"].ToString();
                    lblAdres.Text = dr["adres"].ToString();
                    lblUlke.Text = dr["CountryName"].ToString();
                    lblIL.Text = dr["CityName"].ToString();
                    lblIlce.Text = dr["TownName"].ToString();
                    lblMail1.Text = dr["eposta1"].ToString();
                    lblMail2.Text = dr["eposta2"].ToString();

                    lblCep1.Text = dr["ceptelefon1"].ToString();
                    lblCep2.Text = dr["ceptelefon2"].ToString();
                    lblEvTel.Text = dr["evtelefon"].ToString();
                    lblIsTel.Text = dr["istelefon"].ToString();

                    linkWeb.HRef = "http://" + dr["websayfasi"].ToString();
                    linkWeb.InnerText = dr["websayfasi"].ToString();
                    linkFB.HRef = "http://facebook.com/" + dr["facebook"].ToString();
                    linkFB.InnerText = dr["facebook"].ToString();
                    linkLinkedIn.HRef = "http://linkedin.com/in/" + dr["linkedin"].ToString();
                    linkLinkedIn.InnerText = dr["linkedin"].ToString();

                    switch (dr["calismatipi"].ToString()) { case "0": lblKariyerCalismaTipi.Text ="Araştırmacı Olarak Çalışıyorum"; break;
                        case "1": lblKariyerCalismaTipi.Text ="Eğitimci Olarak Çalışıyorum"; break;
                    }
                    switch (dr["calismatipi"].ToString())
                    {
                        case "0": lblKariyerCalismaTipi.Text = "Araştırmacı Olarak Çalışıyorum"; break;
                        case "1": lblKariyerCalismaTipi.Text = "Eğitimci Olarak Çalışıyorum"; break;
                    }
                    lblBolum.Text = dr["bolum"].ToString();
                    lblUniversite.Text =dr["universite"].ToString();

                    switch (dr["kariyertipi"].ToString())
                    {
                        case "0": lblKariyerTipi.Text = "Doktora"; break;
                        case "1": lblKariyerTipi.Text = "Yüksek Lisans"; break;
                    }

                    switch (dr["kariyerdurumu"].ToString())
                    {
                        case "0": lblKariyerDurumu.Text = "Akademik Kariyer Yapmıyorum"; break;
                        case "1": lblKariyerDurumu.Text = "Akademik Kariyer Yapıyorum (Devam Ediyor)"; break;
                        case "2": lblKariyerDurumu.Text = "Akademik Kariyer Yaptım"; break;
                    }

                    chbIsAriyorum.Checked=(dr["isariyor"].ToString() == "1") ? true : false;


                    switch (dr["calismadurumu"].ToString())
                    {
                        case "0": lblCalismaDurumu.Text = "Çalışmıyorum"; break;
                        case "1": lblCalismaDurumu.Text = "Mezuniyet Alanımda Çalışıyorum"; break;
                        case "2": lblCalismaDurumu.Text = "Mezuniyet Alanı Dışında Çalışıyorum"; break;
                    }

                    /*
                                        lblCalismaDurumu.SelectedValue = dr["calismadurumu"].ToString();
                                        if (dr["isariyor"].ToString() == "0")
                                            chbIsAriyorum.Checked = false;
                                        else chbIsAriyorum.Checked = true;
                                        dropdlKariyerDurumu.SelectedValue = dr["kariyerdurumu"].ToString();
                                        dropdlKariyerTipi.SelectedValue = dr["kariyertipi"].ToString();
                                        txtUniversite.Text = dr["universite"].ToString();
                                        txtBolum.Text = dr["bolum"].ToString();
                                        dropdlKariyerCalismaTipi.SelectedValue = dr["calismatipi"].ToString();*/

                }
            }
        }
    }
}