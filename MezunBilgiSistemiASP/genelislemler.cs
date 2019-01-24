using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Text;
using System.Text.RegularExpressions;

namespace MezunBilgiSistemiASP
{
    public static class genelislemler
    {
               public static MySqlConnection baglan() {
             MySqlConnection baglanti = new MySqlConnection("Server=localhost;Database=mezunbilgi;Uid=umitdrr;Pwd=123456;charset=UTF8;");
            if (baglanti.State != System.Data.ConnectionState.Open)
            {
                baglanti.Open();
                return baglanti;
            }
            else return null;
        }

        public static string md5(string nesne)
        {
            //https://stackoverflow.com/questions/11454004/calculate-a-md5-hash-from-a-string
            using (System.Security.Cryptography.MD5 md5 = System.Security.Cryptography.MD5.Create())
            {
                byte[] inputBytes = Encoding.ASCII.GetBytes(nesne);
                byte[] hashBytes = md5.ComputeHash(inputBytes);

                // Convert the byte array to hexadecimal string
                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < hashBytes.Length; i++)
                {
                    sb.Append(hashBytes[i].ToString("X2"));
                }
                return sb.ToString();
            }
        }

        //https://stackoverflow.com/a/51764513
        public static bool IsValidEmail(this string email)
        {
            const string pattern = @"^(?!\.)(""([^""\r\\]|\\[""\r\\])*""|" + @"([-a-z0-9!#$%&'*+/=?^_`{|}~]|(?<!\.)\.)*)(?<!\.)" + @"@[a-z0-9][\w\.-]*[a-z0-9]\.[a-z][a-z\.]*[a-z]$";
            var regex = new Regex(pattern, RegexOptions.IgnoreCase);
            return regex.IsMatch(email);
        }
    }
}