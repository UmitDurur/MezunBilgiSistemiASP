using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

namespace MezunBilgiSistemiASP
{
    public partial class index1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["mezunno"] != null)
            {
                lblOgrenciNo.Text = Session["mezunno"].ToString();
            }
            else Response.Redirect("giris.aspx");

            if (!IsPostBack)
            {
                ulkeDoldur();

                MySqlConnection baglanti = genelislemler.baglan();
                MySqlCommand komut = new MySqlCommand("select * from iletisimbilgileri as ib inner join mezunbilgileri as mb on ib.mezunno=mb.mezunno inner join kariyerbilgileri as kb on ib.mezunno=kb.mezunno where ib.mezunno=" + Session["mezunno"].ToString(), baglanti);
                MySqlDataReader dr = komut.ExecuteReader();
                if (dr.Read())
                {
                    txtAd.Text = dr["mezunadi"].ToString();
                    txtSoyad.Text = dr["mezunsoyadi"].ToString();
                    navbarspanOgrenciAdi.InnerText = dr["mezunadi"].ToString() + " " + dr["mezunsoyadi"].ToString();
                    txtAdres.Text = dr["adres"].ToString();
                    dropdlUlke.SelectedValue = dr["ulke"].ToString();
                    if (dr["il"].ToString() != null)
                        ilDoldur();
                    dropdlIL.SelectedValue = dr["il"].ToString();
                    if (dr["ilce"].ToString() != null)
                        ilceDoldur();
                    dropdlIlce.SelectedValue = dr["ilce"].ToString();
                    txtMail1.Text = dr["eposta1"].ToString();
                    txtMail2.Text = dr["eposta2"].ToString();

                    txtCep1.Text = dr["ceptelefon1"].ToString();
                    txtCep2.Text = dr["ceptelefon2"].ToString();
                    txtEvTel.Text = dr["evtelefon"].ToString();
                    txtIsTel.Text = dr["istelefon"].ToString();

                    txtLinkWeb.Text = dr["websayfasi"].ToString();
                    txtLinkFB.Text = dr["facebook"].ToString();
                    txtLinkLinkedIn.Text = dr["linkedin"].ToString();


                    dropdlCalismaDurumu.SelectedValue = dr["calismadurumu"].ToString();
                    if (dr["isariyor"].ToString() == "0")
                        chbIsAriyorum.Checked = false;
                    else chbIsAriyorum.Checked = true;
                    dropdlKariyerDurumu.SelectedValue = dr["kariyerdurumu"].ToString();
                    dropdlKariyerTipi.SelectedValue = dr["kariyertipi"].ToString();
                    txtUniversite.Text = dr["universite"].ToString();
                    txtBolum.Text = dr["bolum"].ToString();
                    dropdlKariyerCalismaTipi.SelectedValue = dr["calismatipi"].ToString();
                    /*
                    linkWeb.HRef ="http://"+dr["websayfasi"].ToString();
                    linkWeb.InnerText= dr["websayfasi"].ToString();
                    linkFB.HRef = "http://facebook.com/" + dr["facebook"].ToString();
                    linkFB.InnerText = dr["facebook"].ToString();
                    linkLinkedIn.HRef = "http://linkedin.com/in/" + dr["linkedin"].ToString();
                    linkLinkedIn.InnerText = dr["linkedin"].ToString();
                    lblWebSayfasi.Text = "<a class='btn btn-outline-primary  btn-block mt-0' href='#' role='button'>Link</a>";*/
                }

                baglanti.Close();

            }

            //Session["mezunno"]= null;
        }
        private void ulkeDoldur()
        {
            MySqlConnection baglanti = genelislemler.baglan();
            MySqlCommand komut = new MySqlCommand("select * from country", baglanti);
            MySqlDataReader dr = komut.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            dropdlUlke.DataSource = dt;
            dropdlUlke.DataTextField = "CountryName";
            dropdlUlke.DataValueField = "CountryID";
            dropdlUlke.DataBind();
            baglanti.Close();
        }

        private void ilDoldur()
        {
            MySqlConnection baglanti = genelislemler.baglan();
            MySqlCommand komut = new MySqlCommand("select * from city where CountryID=@ulkeid", baglanti);
            komut.Parameters.AddWithValue("@ulkeid", dropdlUlke.SelectedValue.ToString());
            MySqlDataReader dr = komut.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            dropdlIL.DataSource = dt;
            dropdlIL.DataTextField = "CityName";
            dropdlIL.DataValueField = "CityID";
            dropdlIL.DataBind();
            baglanti.Close();
        }

        private void ilceDoldur()
        {
            MySqlConnection baglanti = genelislemler.baglan();
            MySqlCommand komut = new MySqlCommand("select * from town where CityID=@sehirid", baglanti);
            komut.Parameters.AddWithValue("@sehirid", dropdlIL.SelectedValue.ToString());
            MySqlDataReader dr = komut.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            dropdlIlce.DataSource = dt;
            dropdlIlce.DataTextField = "TownName";
            dropdlIlce.DataValueField = "TownID";
            dropdlIlce.DataBind();
            baglanti.Close();
        }

        protected void dropdlUlke_SelectedIndexChanged(object sender, EventArgs e)
        {
            MySqlConnection baglanti = genelislemler.baglan();
            MySqlCommand komut = new MySqlCommand("select * from city where CountryID=@ulkeid", baglanti);
            komut.Parameters.AddWithValue("@ulkeid", dropdlUlke.SelectedValue.ToString());
            MySqlDataReader dr = komut.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            dropdlIL.DataSource = dt;
            dropdlIL.DataTextField = "CityName";
            dropdlIL.DataValueField = "CityID";
            dropdlIL.DataBind();
            baglanti.Close();
            dropdlIlce.DataSource = new DataTable();
            dropdlIlce.DataBind();
        }

        protected void dropdlIL_SelectedIndexChanged(object sender, EventArgs e)
        {
            MySqlConnection baglanti = genelislemler.baglan();
            MySqlCommand komut = new MySqlCommand("select * from town where CityID=@sehirid", baglanti);
            komut.Parameters.AddWithValue("@sehirid", dropdlIL.SelectedValue.ToString());
            MySqlDataReader dr = komut.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            dropdlIlce.DataSource = dt;
            dropdlIlce.DataTextField = "TownName";
            dropdlIlce.DataValueField = "TownID";
            dropdlIlce.DataBind();
            baglanti.Close();
        }


        protected void btnKaydet_Click(object sender, EventArgs e)
        {

            MySqlConnection baglanti = genelislemler.baglan();
            if (!string.IsNullOrWhiteSpace(txtSifre.Text) && txtSifre.Text != "******")
            {
                MySqlCommand komut = new MySqlCommand("update mezunbilgileri set mbssifre=@yenisifre where mezunno=@mezunno", baglanti);
                komut.Parameters.AddWithValue("@yenisifre", genelislemler.md5(txtSifre.Text));
                komut.Parameters.AddWithValue("@mezunno", lblOgrenciNo.Text);
                komut.ExecuteNonQuery();
            }

            if ((string.IsNullOrWhiteSpace(txtMail1.Text) || genelislemler.IsValidEmail(txtMail1.Text)) && (string.IsNullOrWhiteSpace(txtMail2.Text)||genelislemler.IsValidEmail(txtMail2.Text)))
            {
                MySqlCommand komut2 = new MySqlCommand("update iletisimbilgileri set adres=@adres,il=@il,ilce=@ilce,ulke=@ulke,eposta1=@eposta1,eposta2=@eposta2,websayfasi=@websayfasi, evtelefon = @evtelefon,ceptelefon1= @ceptelefon1,ceptelefon2= @ceptelefon2,istelefon= @istelefon,linkedin= @linkedin,facebook= @facebook where mezunno=@mezunno", baglanti);
                komut2.Parameters.AddWithValue("@mezunno", lblOgrenciNo.Text);
                komut2.Parameters.AddWithValue("@adres", txtAdres.Text);
                komut2.Parameters.AddWithValue("@il", dropdlIL.SelectedValue.ToString());
                komut2.Parameters.AddWithValue("@ilce", dropdlIlce.SelectedValue.ToString());
                komut2.Parameters.AddWithValue("@ulke", dropdlUlke.SelectedValue.ToString());
                komut2.Parameters.AddWithValue("@eposta1", txtMail1.Text);
                komut2.Parameters.AddWithValue("@eposta2", txtMail2.Text);
                komut2.Parameters.AddWithValue("@websayfasi", txtLinkWeb.Text);
                komut2.Parameters.AddWithValue("@evtelefon", txtEvTel.Text);
                komut2.Parameters.AddWithValue("@ceptelefon1", txtCep1.Text);
                komut2.Parameters.AddWithValue("@ceptelefon2", txtCep2.Text);
                komut2.Parameters.AddWithValue("@istelefon", txtIsTel.Text);
                komut2.Parameters.AddWithValue("@linkedin", txtLinkLinkedIn.Text);
                komut2.Parameters.AddWithValue("@facebook", txtLinkFB.Text);

                int sonuc = komut2.ExecuteNonQuery();
            }
            baglanti.Close();
            Response.Redirect(Request.RawUrl);
        }

        protected void btnKariyerKaydet_Click(object sender, EventArgs e)
        {

            MySqlConnection baglanti = genelislemler.baglan();
            MySqlCommand komut = new MySqlCommand("update kariyerbilgileri set calismadurumu=@calismadurumu,isariyor=@isariyor,kariyerdurumu=@kariyerdurumu,kariyertipi=@kariyertipi,universite=@universite,bolum=@bolum,calismatipi=@calismatipi where mezunno=@mezunno", baglanti);
            komut.Parameters.AddWithValue("@mezunno",lblOgrenciNo.Text);
            komut.Parameters.AddWithValue("@calismadurumu", dropdlCalismaDurumu.SelectedValue.ToString());
            komut.Parameters.AddWithValue("@isariyor", (bool)chbIsAriyorum.Checked);
            komut.Parameters.AddWithValue("@kariyerdurumu", dropdlKariyerDurumu.SelectedValue.ToString());
            komut.Parameters.AddWithValue("@kariyertipi", dropdlKariyerTipi.SelectedValue.ToString());
            komut.Parameters.AddWithValue("@universite", txtUniversite.Text);
            komut.Parameters.AddWithValue("@bolum", txtBolum.Text);
            komut.Parameters.AddWithValue("@calismatipi", dropdlKariyerCalismaTipi.SelectedValue.ToString());

            int sonuc = komut.ExecuteNonQuery();
            baglanti.Close();
            Response.Redirect(Request.RawUrl);
        }

        protected void btnCikis_Click(object sender, EventArgs e)
        {
            Session["mezunno"] = null;
            Response.Redirect("giris.aspx");
        }
    }
}