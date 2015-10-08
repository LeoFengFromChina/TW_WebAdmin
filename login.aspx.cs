using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : BaseForm
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_Login_Click(object sender, EventArgs e)
    {
        string userName = txt_user.Text.Trim();
        string psw = GetMD5Value(txt_psw.Text.Trim());

        string jpath = @"\json\users.json";
        List<User> pls = GetJsonToObject<List<User>>(jpath);
        foreach (User item in pls)
        {
            if (item.username.Equals(userName) )//&& item.psw.Equals(psw)
            {
                Session["islogin"] = "1";
                Session.Timeout = 15;

                Session["userName"] = userName;

                Response.Redirect("index.aspx");
                return;
            }
        }

        Alert("login Failed.");
    }
}