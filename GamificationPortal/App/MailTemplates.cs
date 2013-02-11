namespace GamificationPortal.App
{
    public class MailTemplates
    {
        public const string MissionCompleted111 =
            @"
<table style=""width : 100%;"">
<tr>
<td style=""text-align:center;"">


<table style=""z-index: 100;"">
        <tr>
            <td background=""cid:supportPageBg"" height=""509"" width=""800"" bgcolor=""#131313"">
<!--[if gte mso 9]>
<v:image xmlns:v=""urn:schemas-microsoft-com:vml"" id=""theImage"" style='behavior: url(#default#VML); 
        display:inline-block;position:absolute; height:338px; width:465px;top:50;left:300;border:0;z-index:1;' 
        src=""cid:supportPageBg""/>
<v:shape xmlns:v=""urn:schemas-microsoft-com:vml"" id=""theText"" style='behavior: url(#default#VML); 
        display:inline-block;position:absolute; height:509px; width:800px;top:-5;left:-10;border:0;z-index:2;'>
<div>
<![endif]-->

<!-- This is where you nest a table with the content that will float over the image -->
<table width=""800"" cellpadding=""0"" cellspacing=""0"" border=""0"">
    <tr>
        <td width=""800"" height=""509"" valign=""top"">

<div style=""width: 255px;"">
            <h3 >Hi {0}!</h2>
            <p style=""color: #ffffff;"">
{1} marked your '{2}' mission as <b>completed<b/>. <br/>
Now it’s your turn to mark it as <b>'Verified' <b/> or <b>'Failed' <b/>.
<br/>
<br/>
Cheers, <br/>
DC Gamification Team

            </p>


</td>
</tr>
</table>
<!-- This ends the nested table content -->
<!--[if gte mso 9]>
</div>
</v:shape>
<![endif]-->
</td>
        </tr>
        </table>
</td>
</tr>
</table>
";

        public const string MissionCompleted =
                    @"

            <h3 >Hi {0}!</h3>
            <p >
{1} marked your '{2}' mission as <b>completed<b/>. <br/>
Now it’s your turn to mark it as <b>'Verified' <b/> or <b>'Failed' <b/>.
<br/>
<br/>
Cheers, <br/>
DC Gamification Team
</p>
";


        public const string MissionTakenForCompletion =
                    @"
<h3>Hi {0}!</h3>
<p>
{1} took your '{2}' mission for completion. <br />
We will get you informed as soon as the mission is completed.
<br />
<br />
Cheers,<br />
DC Gamification Team
</p>
";

    }
}



