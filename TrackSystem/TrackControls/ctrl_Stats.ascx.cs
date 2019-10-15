using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ctrl_Stats : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void SetCountersSprint(int CountPaused, int CountAnalyze, int CountDevelopment, int CountFinalize, int CountFeature)
    {
        string Countervalues = CountPaused + "," + CountAnalyze + "," + CountDevelopment + "," + CountFinalize  + "," +  CountFeature;
        CountSprintHidden.Value = Countervalues;
    }
    public void SetCountersPost(int CountComment, int CountBug, int CountTask, int CountDone)
    {
        string Countervalues = CountComment + "," + CountBug + "," + CountTask + "," + CountDone;
        CountHidden.Value = Countervalues;
    }
}