using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Json;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// BaseForm 的摘要说明
/// </summary>
public abstract class BaseForm : System.Web.UI.Page
{
    public BaseForm()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    protected void Alert(string msg)
    {
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert" + msg, "alert(\"" + msg + "\");", true);
    }
    public static string JsonSerializer<T>(T t)
    {
        DataContractJsonSerializer ser = new DataContractJsonSerializer(typeof(T));
        MemoryStream ms = new MemoryStream();
        ser.WriteObject(ms, t);
        string jsonString = Encoding.UTF8.GetString(ms.ToArray());
        ms.Close();
        return jsonString.Replace("\\", "");
    }

    public static T JsonDeserialize<T>(string jsonString)
    {
        DataContractJsonSerializer ser = new DataContractJsonSerializer(typeof(T));
        MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(jsonString));
        T obj = (T)ser.ReadObject(ms);
        return obj;
    }
    public string CurrentPath
    {
        get { return Path.GetDirectoryName(Page.Request.PhysicalPath); }
    }

    private bool _islogin = false;
    public bool IsLogin
    {
        get { return _islogin; }
        set { _islogin = true; }
    }

    public void ValidateLogin()
    {
        if (Session["islogin"] == null || Session["islogin"].ToString() == "0")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"" + "请先登陆！" + "\");", true);
            Response.Redirect("login.aspx");
        }
    }
    public T GetJsonToObject<T>(string filePath)
    {
        string jpath = CurrentPath + @filePath;
        string s = ReadText(jpath);
        T pls = JsonDeserialize<T>(s);
        return pls;
    }

    public string ReadText(string path)
    {
        string result = string.Empty;
        StreamReader sr = new StreamReader(path, Encoding.UTF8);
        String line;
        while ((line = sr.ReadLine()) != null)
        {
            result += line.ToString();
        }
        sr.Close();
        return result;
    }
    public void Write(string path, string content)
    {
        try
        {
            FileStream fs = new FileStream(path, FileMode.Create);
            StreamWriter sw = new StreamWriter(fs);
            //开始写入
            sw.Write(@content);
            //清空缓冲区
            sw.Flush();
            //关闭流
            sw.Close();
            fs.Close();
        }
        catch (Exception ex)
        {
            Alert("Write File Error:" + ex);
        }
    }
    /// <summary>
    /// 获取ID集合如（1,2,3,4...）
    /// </summary>
    /// <param name="rpt"></param>
    /// <returns></returns>
    protected string GetSelectedAsString(Repeater rpt)
    {
        CheckBox cb = new CheckBox();
        HiddenField hdf = new HiddenField();
        int count = rpt.Items.Count;
        string ids = "";
        for (int i = 0; i < count; i++)
        {
            cb = (CheckBox)rpt.Items[i].FindControl("chkItem");
            if (cb != null && cb.Checked)
            {
                hdf = (HiddenField)rpt.Items[i].FindControl("hdfID");
                ids += hdf.Value + ",";
            }
        }
        if (string.IsNullOrEmpty(ids))
            ids = "-9999";
        return ids.Substring(0, ids.Length - 1);
    }

    public static string GetMD5Value(string orginStr)
    {
        byte[] result = Encoding.Default.GetBytes(orginStr);    //tbPass为输入密码的文本框
        MD5 md5 = new MD5CryptoServiceProvider();
        byte[] output = md5.ComputeHash(result);
        return BitConverter.ToString(output).Replace("-", "");  //tbMd5pass为输出加密文本的文本框
    }
}

public class ProductList
{
    private int _id;
    private int _typeid;
    private string _pagetype;
    private string _title;
    private string _mainstyle;
    private string _titlestyle;
    private string _url;
    private string _img;
    private string _memo;

    public int id
    {
        get { return _id; }
        set { _id = value; }
    }
    public int typeid
    {
        get { return _typeid; }
        set { _typeid = value; }
    }
    public string pagetype
    {
        get { return _pagetype; }
        set { _pagetype = value; }
    }
    public string title
    {
        get { return _title; }
        set { _title = value; }
    }
    public string mainstyle
    {
        get { return _mainstyle; }
        set { _mainstyle = value; }
    }
    public string titlestyle
    {
        get { return _titlestyle; }
        set { _titlestyle = value; }
    }
    public string url
    {
        get { return _url; }
        set { _url = value; }
    }
    public string img
    {
        get { return _img; }
        set { _img = value; }
    }
    public string memo
    {
        get { return _memo; }
        set { _memo = value; }
    }
}

public class Product
{
    private int _id;
    private string _date;
    private string _content;

    public int id
    {
        get { return _id; }
        set { _id = value; }
    }
    public string date
    {
        get { return _date; }
        set { _date = value; }
    }
    public string content
    {
        get { return _content; }
        set { _content = value; }
    }
}


public class ProductType
{
    private int _id;
    private string _pagetype;
    private string _title;
    private string _mainstyle;
    private string _titlestyle;
    private string _url;
    private string _img;
    private string _memo;

    public int id
    {
        get { return _id; }
        set { _id = value; }
    }
    public string pagetype
    {
        get { return _pagetype; }
        set { _pagetype = value; }
    }
    public string title
    {
        get { return _title; }
        set { _title = value; }
    }
    public string mainstyle
    {
        get { return _mainstyle; }
        set { _mainstyle = value; }
    }
    public string titlestyle
    {
        get { return _titlestyle; }
        set { _titlestyle = value; }
    }
    public string url
    {
        get { return _url; }
        set { _url = value; }
    }
    public string img
    {
        get { return _img; }
        set { _img = value; }
    }
    public string memo
    {
        get { return _memo; }
        set { _memo = value; }
    }
}


public class ComponentList
{
    private int _id;
    private string _pagetype;
    private string _title;
    private string _mainstyle;
    private string _titlestyle;
    private string _img;
    private string _memo;

    public int id
    {
        get { return _id; }
        set { _id = value; }
    }
    public string pagetype
    {
        get { return _pagetype; }
        set { _pagetype = value; }
    }
    public string title
    {
        get { return _title; }
        set { _title = value; }
    }
    public string mainstyle
    {
        get { return _mainstyle; }
        set { _mainstyle = value; }
    }
    public string titlestyle
    {
        get { return _titlestyle; }
        set { _titlestyle = value; }
    }

    public string img
    {
        get { return _img; }
        set { _img = value; }
    }
    public string memo
    {
        get { return _memo; }
        set { _memo = value; }
    }
}


public class SolutionList
{
    private int _id;
    private string _pagetype;
    private string _title;
    private string _city;
    private string _date;
    private string _mainstyle;
    private string _titlestyle;
    private string _img;
    private string _memo;

    public int id
    {
        get { return _id; }
        set { _id = value; }
    }
    public string pagetype
    {
        get { return _pagetype; }
        set { _pagetype = value; }
    }
    public string title
    {
        get { return _title; }
        set { _title = value; }
    }
    public string mainstyle
    {
        get { return _mainstyle; }
        set { _mainstyle = value; }
    }
    public string city
    {
        get { return _city; }
        set { _city = value; }
    }
    public string date
    {
        get { return _date; }
        set { _date = value; }
    }
    public string titlestyle
    {
        get { return _titlestyle; }
        set { _titlestyle = value; }
    }

    public string img
    {
        get { return _img; }
        set { _img = value; }
    }
    public string memo
    {
        get { return _memo; }
        set { _memo = value; }
    }
}


public class AboutList
{
    private int _id;
    private string _pagetype;
    private string _title;
    private string _mainstyle;
    private string _titlestyle;
    private string _img;
    private string _memo;

    public int id
    {
        get { return _id; }
        set { _id = value; }
    }
    public string pagetype
    {
        get { return _pagetype; }
        set { _pagetype = value; }
    }
    public string title
    {
        get { return _title; }
        set { _title = value; }
    }
    public string mainstyle
    {
        get { return _mainstyle; }
        set { _mainstyle = value; }
    }
    public string titlestyle
    {
        get { return _titlestyle; }
        set { _titlestyle = value; }
    }

    public string img
    {
        get { return _img; }
        set { _img = value; }
    }
    public string memo
    {
        get { return _memo; }
        set { _memo = value; }
    }
}

public class User
{

    private int _id;
    private string _username;
    private string _psw;
    private string _isadmin;
    private string _createby;
    private string _createdate;
    public int id
    {
        get { return _id; }
        set { _id = value; }
    }
    public string username
    {
        get { return _username; }
        set { _username = value; }
    }
    public string psw
    {
        get { return _psw; }
        set { _psw = value; }
    }
    public string isadmin
    {
        get { return _isadmin; }
        set { _isadmin = value; }
    }
    public string createby
    {
        get { return _createby; }
        set { _createby = value; }
    }
    public string createdate
    {
        get { return _createdate; }
        set { _createdate = value; }
    }
}