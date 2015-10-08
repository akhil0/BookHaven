<%@ WebHandler Language="C#" Class="BestsellerDetailsHandler" %>

using System;
using System.Web;
using System.Net;
public class BestsellerDetailsHandler : IHttpHandler {
   
    public void ProcessRequest (HttpContext context) {
        string finalUrl = String.Empty;
        context.Response.ContentType = "application/xml";
        WebClient bestsellers = new WebClient();
        string url1 = "http://api.nytimes.com/svc/books/v2/lists/best-sellers/" + context.Request["category"];
        string url2 = ".xml?&api-key=" + context.Request["key"]+"&isbn="+context.Request["isbn"];
        finalUrl = url1 + url2;
        string response = bestsellers.DownloadString(finalUrl);
        context.Response.Write(response);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}