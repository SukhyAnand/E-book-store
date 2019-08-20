using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
/// <summary>
/// Summary description for htmlify
/// </summary>
public class Htmlify
{
	public string Convert(string input)
    {
        string output, intermediate, intquot, intapos, intamp, intlt, intgt, intnl;

        //initialize intermediate string to blank
        intermediate = "";
        //first replace all the amps
        intamp = input.Replace("&", "&amp;");
        intermediate = intamp;

        intquot = intermediate.Replace("\"", "&quot;");
        intermediate = intquot;

        intapos = intermediate.Replace("\'", "&apos;");
        intermediate = intapos;

        intlt = intermediate.Replace("<", "&lt;");
        intermediate = intlt;

        intgt = intermediate.Replace(">", "&gt;");
        intermediate = intgt;

        intnl = intermediate.Replace(System.Environment.NewLine, "<br>");
        intermediate = intnl;

        output = intermediate;

        return output;
    }

    public string Revert(string input)
    {
        string output, intermediate, intquot, intapos, intamp, intlt, intgt, intnl;

        //initialize intermediate string to blank
        intermediate = "";
        //first replace all the amps
        intamp = input.Replace("&amp", "&;");
        intermediate = intamp;

        intquot = intermediate.Replace("&quot;", "\"");
        intermediate = intquot;

        intapos = intermediate.Replace("&apos;", "\'");
        intermediate = intapos;

        intlt = intermediate.Replace("&lt;", "<");
        intermediate = intlt;

        intgt = intermediate.Replace("&gt;", ">");
        intermediate = intgt;

        intnl = intermediate.Replace("<br>", System.Environment.NewLine);
        intermediate = intnl;

        output = intermediate;

        return output;
    }
}