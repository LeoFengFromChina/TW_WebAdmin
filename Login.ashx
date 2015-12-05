<%@ WebHandler Language="C#" Class="Login" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.IO;
using System.Runtime.Serialization.Json;
using System.Text;
public class Login : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.AddHeader("Access-Control-Allow-Origin", "*");
        context.Response.AddHeader("Access-Control-Allow-Methods", "POST");
        context.Response.AddHeader("Access-Control-Allow-Headers", "x-requested-with,content-type");
        context.Response.ContentType = "text/plain";
        string userName = context.Request["userName"];
        string psw = context.Request["psw"];
        string jpath = @"\json\users.json";
        List<User> pls = GetJsonToObject<List<User>>(jpath);
        bool isFind = false;
        foreach (User item in pls)
        {
            if (item.username.Equals(userName) && item.psw.ToLower().Equals(psw.ToLower()))//&& item.psw.Equals(psw)
            {
                isFind = true;
                context.Response.Write("0");
            }
        }
        if (!isFind)
        {
            context.Response.Write("1");
        }
    }
    public T GetJsonToObject<T>(string filePath)
    {
        string jpath = HttpContext.Current.Request.PhysicalApplicationPath+ @filePath;
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
    public static T JsonDeserialize<T>(string jsonString)
    {
        DataContractJsonSerializer ser = new DataContractJsonSerializer(typeof(T));
        MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(jsonString));
        T obj = (T)ser.ReadObject(ms);
        return obj;
    }
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}