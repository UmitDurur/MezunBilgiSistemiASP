using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace MezunBilgiSistemiASP
{
    public partial class kaydol : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGiris_Click(object sender, EventArgs e)
        {
            Response.Redirect("giris.aspx");
        }

        protected void btnKaydol_Click(object sender, EventArgs e)
        {
            Int64 degisken =0;
            bool sonuc = Int64.TryParse(mezunno.Text, out degisken);
            if (sonuc && !string.IsNullOrWhiteSpace(txtAd.Text) && !string.IsNullOrWhiteSpace(txtSoyad.Text) && !string.IsNullOrWhiteSpace(mezunno.Text) && !string.IsNullOrWhiteSpace(sifre.Text))
            {
                MySqlConnection baglanti = genelislemler.baglan();
                MySqlCommand komut = new MySqlCommand("insert into yenimezunbilgileri(mezunno,mezunadi,mezunsoyadi,mbssifre) VALUES(@mezunno,@mezunadi,@mezunsoyadi,@mbssifre)", baglanti);
                komut.Parameters.AddWithValue("@mezunno", degisken);
                komut.Parameters.AddWithValue("@mezunadi", txtAd.Text);
                komut.Parameters.AddWithValue("@mezunsoyadi", txtSoyad.Text);
                komut.Parameters.AddWithValue("@mbssifre", genelislemler.md5(sifre.Text));
                komut.ExecuteNonQuery();
                Response.Redirect("giris.aspx");
            }
            else lblHata.Visible = true;
        }
    }
}