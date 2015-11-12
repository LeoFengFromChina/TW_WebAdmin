using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : BaseForm
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            base.ValidateLogin();
            lbl_userName.Text = Session["userName"].ToString();
            //给是删除按钮注册js事件
            //btn_Logout.Attributes.Add("OnClick", "return  del_sure()");
        }
    }

    protected void btn_Logout_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("login.aspx");
    }

}