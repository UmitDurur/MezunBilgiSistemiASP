using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Text;

namespace MezunBilgiSistemiASP
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["mezunno"] != null)
            {
                Response.Redirect("index.aspx");
            }
        }

        protected void btnGiris_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(mezunno.Text) && !string.IsNullOrWhiteSpace(sifre.Text))
            {
                MySqlConnection baglanti = genelislemler.baglan();
                MySqlCommand komut = new MySqlCommand("select * from mezunbilgileri where mezunno=@mezunno and mbssifre=@sifre", baglanti);
                komut.Parameters.AddWithValue("@mezunno", mezunno.Text);
                komut.Parameters.AddWithValue("@sifre", genelislemler.md5(sifre.Text));
                MySqlDataReader dr = komut.ExecuteReader();
                if (dr.Read())
                {
                    Session.Add("mezunno", mezunno.Text);
                    baglanti.Close();
                    Response.Redirect("index.aspx");
                }
                else lblHata.Visible = true;
            }
        }


        protected void btnKaydol_Click(object sender, EventArgs e)
        {
            Response.Redirect("kaydol.aspx");
        }

        protected void btnYetkili_Click(object sender, EventArgs e)
        {
            Response.Redirect("yetkiligiris.aspx");
        }
    }
}