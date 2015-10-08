<%@ WebHandler Language="C#" Class="SimilarBooksHandler" %>

using System;
using System.Web;
using System.Net;
public class SimilarBooksHandler : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        string finalUrl = String.Empty;
        context.Response.ContentType = "application/xml";
        WebClient goodreads = new WebClient();
        string url1 = "https://www.goodreads.com/search.xml?key="+ context.Request["key"];
        string url2 = "&q=" + context.Request["title"];
        finalUrl = url1 + url2;
        string response = goodreads.DownloadString(finalUrl);
        context.Response.Write(response);
    }
    public bool IsReusable {
        get {
            return false;
        }
    }

}