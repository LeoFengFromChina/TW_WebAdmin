using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddUser : BaseForm
{
    private string ctrID
    {
        get
        {
            if (ViewState["ctrID"] != null)
                return (string)ViewState["ctrID"];
            else
            {
                return null;
            }
        }
        set
        {
            ViewState["ctrID"] = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string id = Context.Request["id"];
            ctrID = id;
            if (!string.IsNullOrEmpty(id))
            {

                string jpath = @"\json\Users.json";
                List<User> pll = GetJsonToObject<List<User>>(jpath);
                foreach (User item in pll)
                {
                    if (item.id.ToString() == id)
                    {
                        txt_name.Text = item.username;
                        //txt_psw.Text = GetMD5Value(txt_psw.Text);
                        ddl_isadmin.SelectedValue = item.isadmin;
                        break;
                    }
                }
            }
            else
            {

            }
        }
    }

    protected void btn_OK_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(txt_name.Text)
            || string.IsNullOrEmpty(txt_psw.Text))
        {
            Alert("账号或密码不能为空！");
            return;
        }
        if (string.IsNullOrEmpty(ctrID))
        {
            AddFunc();
        }
        else
        {
            EditFunc(ctrID);
        }

    }
    private void AddFunc()
    {
        User pl = new User();
        pl.username = txt_name.Text.Trim();
        pl.psw = GetMD5Value(txt_psw.Text.Trim());
        pl.isadmin = ddl_isadmin.SelectedValue;
        pl.createby = Session["userName"].ToString();
        pl.createdate = DateTime.Now.ToString();

        string jpath = @"\json\Users.json";
        List<User> pll = GetJsonToObject<List<User>>(jpath);
        pl.id = pll.Count + 1;
        pll.Add(pl);
        //保存修改
        string s1 = JsonSerializer<List<User>>(pll);
        Write(CurrentPath + "\\" + jpath, s1);

        Alert("添加成功！");
    }

    private void EditFunc(string id)
    {
        string jpath = @"\json\Users.json";
        List<User> pll = GetJsonToObject<List<User>>(jpath);

        for (int i = 0; i < pll.Count; i++)
        {
            if (pll[i].id.ToString() == id)
            {
                pll[i].username = txt_name.Text.Trim();
                pll[i].psw = GetMD5Value(txt_psw.Text.Trim());
                pll[i].isadmin = ddl_isadmin.SelectedValue;
                pll[i].createby = Session["userName"].ToString();
                break;
            }
        }
        //保存修改
        string s1 = JsonSerializer<List<User>>(pll);
        Write(CurrentPath + "\\" + jpath, s1);

        Alert("保存成功！");
    }
}