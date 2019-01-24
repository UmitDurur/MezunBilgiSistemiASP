using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MezunBilgiSistemiASP
{
    public partial class admin : System.Web.UI.Page
    {
        public int sorguDurum = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["yetkilino"] == null)
            {
                Response.Redirect("yetkiligiris.aspx");
            }

            MySqlConnection baglanti2 = genelislemler.baglan();
            MySqlCommand komut2 = new MySqlCommand("select COUNT(*) from yenimezunbilgileri", baglanti2);
            int adet = Convert.ToInt32(komut2.ExecuteScalar());
            btnBekleyenListesi.Text = "Bekletilen Kayıtlar (" + adet + ")";
            baglanti2.Close();
            if (!IsPostBack)
            {
                ulkeDoldur();

                MySqlConnection baglanti = genelislemler.baglan();
                MySqlCommand komut = new MySqlCommand("select * from yetkilibilgileri where yetkilino=" + Session["yetkilino"].ToString(), baglanti);
                MySqlDataReader dr = komut.ExecuteReader();
                if (dr.Read())
                {
                    navbarspanYetkiliAdi.InnerText = " " + dr["yetkiliadi"].ToString() + " " + dr["yetkilisoyadi"].ToString();
                }
                dr.Close();
                /*MySqlCommand komut2 = new MySqlCommand("select COUNT(*) from yenimezunbilgileri", baglanti);
                int adet = Convert.ToInt32(komut2.ExecuteScalar());
                btnBekleyenListesi.Text = "Bekletilen Kayıtlar (" + adet + ")";
                baglanti.Close();*/

                btnTemizle_Click(btnTemizle, EventArgs.Empty);
            }
        }





        protected void btnCikis_Click(object sender, EventArgs e)
        {
            Session["yetkilino"] = null;
            Response.Redirect("yetkiligiris.aspx");
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
            dropdlIlce.DataSource = null;
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


        protected void btnFiltrele_Click(object sender, EventArgs e)
        {
            sorguOlustur();
        }

        private void sorguOlustur()
        {
            ArrayList array = new ArrayList();
            if (chbtxtOgrenciNo.Checked)
                array.Add("mezunno=" + txtOgrenciNo.Text);
            if (chbtxtAd.Checked)
                array.Add("mezunadi like '%" + txtAd.Text + "%'");
            if (chbtxtSoyad.Checked)
                array.Add("mezunsoyadi like '%" + txtSoyad.Text + "%'");
            if (chbtxtBolum.Checked)
                array.Add("bolum like '%" + txtBolum.Text + "%'");
            if (chbtxtUniversite.Checked)
                array.Add("universite like '%" + txtUniversite.Text + "%'");

            if (chbdropdlKariyerCalismaTipi.Checked)
                array.Add("calismatipi=" + dropdlKariyerCalismaTipi.SelectedValue.ToString());
            if (chbdropdlKariyerDurumu.Checked)
                array.Add("kariyerdurumu=" + dropdlKariyerDurumu.SelectedValue.ToString());
            if (chbdropdlKariyerTipi.Checked)
                array.Add("kariyertipi=" + dropdlKariyerTipi.SelectedValue.ToString());
            if (chbdropdlCalismaDurumu.Checked)
                array.Add("calismadurumu=" + dropdlCalismaDurumu.SelectedValue.ToString());
            if (chbdropdlIsArama.Checked)
                array.Add("isariyor=" + dropdlIsArama.SelectedValue.ToString());
            if (chbdropdlUlke.Checked)
                array.Add("ulke=" + dropdlUlke.SelectedValue.ToString());
            if (chbdropdlIL.Checked)
                array.Add("il=" + dropdlIL.SelectedValue.ToString());
            if (chbdropdlIlce.Checked)
                array.Add("ilce=" + dropdlIlce.SelectedValue.ToString());

            string sqlsorgu = "select * from mezunbilgileri as mb inner join iletisimbilgileri as ib  on mb.mezunno=ib.mezunno inner join kariyerbilgileri as kb on mb.mezunno=kb.mezunno where ";
            for (int i = 0; i < array.Count; i++)
            {
                sqlsorgu += " " + array[i].ToString();
                if (i != array.Count - 1)
                    sqlsorgu += " AND ";
            }
            array.Clear();
            sorguDurum = 0;
            rptGuncelle(sqlsorgu);
        }

        private void rptGuncelle(string sqlsorgu)
        {
            MySqlConnection baglanti = genelislemler.baglan();
            MySqlCommand komut = new MySqlCommand(sqlsorgu, baglanti);
            MySqlDataReader dr = komut.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            rptVeri.DataSource = dt;
            rptVeri.DataBind();
            baglanti.Close();
        }


        protected void txtOgrenciNo_TextChanged(object sender, EventArgs e)
        {

            string deger = "";

            if (sender is TextBox)
                deger = ((TextBox)sender).ID.ToString();
            else
                deger = ((DropDownList)sender).ID.ToString();
            //https://stackoverflow.com/questions/19265103/find-div-tag-from-code-behind
            Control myControl1 = FindControl("chb" + deger);
            if (myControl1 != null)
            {
                System.Web.UI.HtmlControls.HtmlInputCheckBox chbkontrol = (System.Web.UI.HtmlControls.HtmlInputCheckBox)myControl1;
                if (!chbkontrol.Checked)
                    chbkontrol.Checked = true;
            }
        }

        protected void btnBekleyenListesi_Click(object sender, EventArgs e)
        {
            rptGuncelle("select * from yenimezunbilgileri");
            sorguDurum = 1;
        }

        protected void btnTemizle_Click(object sender, EventArgs e)
        {
            rptGuncelle("select * from mezunbilgileri");
            sorguDurum = 0;
        }

        //https://docs.microsoft.com/tr-tr/dotnet/api/system.web.ui.webcontrols.button.commandname?view=netframework-4.7.2
        protected void btnSil_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Kabul")
            {
                rptGuncelle("insert into mezunbilgileri (mezunno,mezunadi,mezunsoyadi,mbssifre) select mezunno,mezunadi,mezunsoyadi,mbssifre from yenimezunbilgileri where mezunno=" + e.CommandArgument);
                rptGuncelle("insert into iletisimbilgileri (mezunno) VALUES(" + e.CommandArgument + ")");
                rptGuncelle("insert into kariyerbilgileri (mezunno) VALUES(" + e.CommandArgument + ")");
            }
            if (e.CommandName == "Kabul" || e.CommandName == "Sil")
            {
                rptGuncelle("delete from yenimezunbilgileri where mezunno=" + e.CommandArgument + "");
                btnBekleyenListesi_Click(btnBekleyenListesi, EventArgs.Empty);
            }

            if (e.CommandName == "Goruntule")
            {
                Response.Write("<script>");
                Response.Write("window.open('bilgiler.aspx?u=" + e.CommandArgument+"','_blank')");
                Response.Write("</script>");
                //Response.Redirect("bilgiler.aspx?u=" + e.CommandArgument);
            }

        }
    }
}