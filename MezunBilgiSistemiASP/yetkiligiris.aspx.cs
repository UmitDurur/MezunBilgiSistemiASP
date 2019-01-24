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
    public partial class yetkiligiris : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
            }
        }

        protected void btnOgrenci_Click(object sender, EventArgs e)
        {
            Response.Redirect("giris.aspx");
        }

        protected void btnGiris_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(yetkilino.Text) && !string.IsNullOrWhiteSpace(sifre.Text))
            {
                MySqlConnection baglanti = genelislemler.baglan();
                MySqlCommand komut = new MySqlCommand("select * from yetkilibilgileri where yetkilino=@yetkilino and yetkilisifre=@sifre", baglanti);
                komut.Parameters.AddWithValue("@yetkilino", yetkilino.Text);
                komut.Parameters.AddWithValue("@sifre",genelislemler.md5(sifre.Text));
                MySqlDataReader dr = komut.ExecuteReader();
                if (dr.Read())
                {
                    Session.Add("yetkilino", yetkilino.Text);
                    baglanti.Close();
                    Response.Redirect("admin.aspx");
                }
                else lblHata.Visible = true;
            }
        }
    }
}