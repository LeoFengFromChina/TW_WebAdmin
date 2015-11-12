using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddProductType : BaseForm
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

                string jpath = @"\json\ProductType.json";
                List<ProductType> pll = GetJsonToObject<List<ProductType>>(jpath);
                foreach (ProductType item in pll)
                {
                    if (item.id.ToString() == id)
                    {
                        txt_title.Text = item.title;
                        txt_img.Text = item.img;
                        txt_mainstyle.Text = item.mainstyle;
                        txt_memo.Text = item.memo;
                        ddl_pagetype.SelectedValue = item.pagetype;
                        txt_titlestyle.Text = item.titlestyle;
                        txt_url.Text = item.url;
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
        if (string.IsNullOrEmpty(txt_title.Text))
        {
            Alert("标题或内容不能为空！");
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
        ProductType pl = new ProductType();
        pl.title = txt_title.Text;
        pl.img = txt_img.Text;
        pl.mainstyle = txt_mainstyle.Text;
        pl.memo = txt_memo.Text;
        pl.pagetype = ddl_pagetype.SelectedValue;
        pl.titlestyle = txt_titlestyle.Text;
        pl.url = txt_url.Text;


        string jpath = @"\json\ProductType.json";
        List<ProductType> pll = GetJsonToObject<List<ProductType>>(jpath);
        pl.id = pll.Count + 1;
        pll.Add(pl);
        //保存修改
        string s1 = JsonSerializer<List<ProductType>>(pll);
        Write(CurrentPath + "\\" + jpath, s1);
         ClientScript.RegisterStartupScript(ClientScript.GetType(), "myscript", "<script>successCallback('添加成功！');</script>"); 
        // Alert("添加成功！");
    }

    private void EditFunc(string id)
    {
        string jpath = @"\json\ProductType.json";
        List<ProductType> pll = GetJsonToObject<List<ProductType>>(jpath);

        for (int i = 0; i < pll.Count; i++)
        {
            if (pll[i].id.ToString() == id)
            {
                pll[i].title = txt_title.Text;
                pll[i].img = txt_img.Text;
                pll[i].mainstyle = txt_mainstyle.Text;
                pll[i].memo = txt_memo.Text;
                pll[i].pagetype = ddl_pagetype.SelectedValue;
                pll[i].titlestyle = txt_titlestyle.Text;
                pll[i].url = txt_url.Text;
                break;
            }
        }
        //保存修改
        string s1 = JsonSerializer<List<ProductType>>(pll);
        Write(CurrentPath + "\\" + jpath, s1);
        ClientScript.RegisterStartupScript(ClientScript.GetType(), "myscript", "<script>successCallback('保存成功！');</script>"); 
        //Alert("保存成功！");
    }
}