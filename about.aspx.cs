using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class about : BaseForm
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //给是删除按钮注册js事件
            deleteBtn.Attributes.Add("OnClick", "return  del_sure()");

            //初始化绑定数据
            string jpath = @"\json\about.json";
            List<AboutList> pls = GetJsonToObject<List<AboutList>>(jpath);
            myRepeat.DataSource = null;
            myRepeat.DataSource = pls;
            myRepeat.DataBind();
        }
    }
    //删除
    protected void deleteBtn_Click(object sender, EventArgs e)
    {
        //获取选中IDS
        string ids = GetSelectedAsString(myRepeat);
        if (ids == "-999")
        {
            Alert("没有选择任何记录！");
            return;
        }
        //删除指定
        string jpath = @"\json\ComponentList.json";
        List<AboutList> pls = GetJsonToObject<List<AboutList>>(jpath);
        int j = 0;
        string[] idsArray = ids.Split(',');
        foreach (string indexs in idsArray)
        {
            for (int i = 0; i < pls.Count; i++)
            {
                if (pls[i].id.ToString() == indexs)
                {
                    pls.Remove(pls[i]);
                    break;
                }
            }
        }

        //重置json内的id序列
        for (int i = 0; i < pls.Count; i++)
        {
            pls[i].id = i + 1;
        }

        //删除后重新绑定数据
        myRepeat.DataSource = pls;
        myRepeat.DataBind();

        //保存修改
        string s2 = JsonSerializer<List<AboutList>>(pls);
        Write(CurrentPath + "\\" + jpath, @s2);
        Alert("删除成功！");
    }
}