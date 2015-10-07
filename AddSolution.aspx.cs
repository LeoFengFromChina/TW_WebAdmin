﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddSolution : BaseForm
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

                string jpath = @"\json\SolutionList.json";
                List<SolutionList> pll = GetJsonToObject<List<SolutionList>>(jpath);
                foreach (SolutionList item in pll)
                {
                    if (item.id.ToString() == id)
                    {
                        txt_title.Text = item.title;
                        txt_img.Text = item.img;
                        txt_mainstyle.Text = item.mainstyle;
                        txt_memo.Text = item.memo;
                        ddl_pagetype.SelectedValue = item.pagetype;
                        txt_titlestyle.Text = item.titlestyle;
                        ddl_city.SelectedValue = item.city;
                        break;
                    }
                }

                string jpath2 = @"\json\solutions\solution" + id + ".json";
                List<Product> p = GetJsonToObject<List<Product>>(jpath2);
                txt_content.Text = p[0].content;
            }
            else
            {

            }
        }
    }

    protected void btn_OK_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(txt_title.Text)
    || string.IsNullOrEmpty(txt_content.Text))
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
        SolutionList pl = new SolutionList();
        pl.title = txt_title.Text;
        pl.img = txt_img.Text;
        pl.mainstyle = txt_mainstyle.Text;
        pl.memo = txt_memo.Text;
        pl.pagetype = ddl_pagetype.SelectedValue;
        pl.titlestyle = txt_titlestyle.Text;
        pl.city = ddl_city.SelectedValue;


        string jpath = @"\json\SolutionList.json";
        List<SolutionList> pll = GetJsonToObject<List<SolutionList>>(jpath);
        pl.id = pll.Count + 1;
        pll.Add(pl);
        //保存修改
        string s1 = JsonSerializer<List<SolutionList>>(pll);
        Write(CurrentPath + "\\" + jpath, s1);

        Product product = new Product();
        product.id = pll.Count;
        string jpath2 = @"\json\Solutions\Solution" + product.id + ".json";
        product.date = DateTime.Now.ToLongDateString();
        product.content = txt_content.Text;
        string s2 = JsonSerializer<List<Product>>(new List<Product>() { product });
        Write(CurrentPath + "\\" + jpath2, s2);
        Alert("添加成功！");
    }

    private void EditFunc(string id)
    {
        string jpath = @"\json\SolutionList.json";
        List<SolutionList> pll = GetJsonToObject<List<SolutionList>>(jpath);

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
                pll[i].city =ddl_city.SelectedValue;
                break;
            }
        }
        //保存修改
        string s1 = JsonSerializer<List<SolutionList>>(pll);
        Write(CurrentPath + "\\" + jpath, s1);

        string jpath2 = @"\json\solutions\solution" + id + ".json";
        List<Product> p = GetJsonToObject<List<Product>>(jpath2);
        p[0].date = DateTime.Now.ToLongDateString();
        p[0].content = txt_content.Text;
        string s2 = JsonSerializer<List<Product>>(p);
        Write(CurrentPath + "\\" + jpath2, s2);
        Alert("保存成功！");
    }
}