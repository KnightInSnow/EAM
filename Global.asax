<%@ Application Language="c#" %>
<%@ Import Namespace="System.Reflection" %>
<%@ Import Namespace="System.Timers" %>
<%@ Import Namespace="DataLayer" %>
<%@ Import Namespace="FCSystem.Utility" %>
<%@ Import Namespace="DataLayer.SqlStatement" %>
<script RunAt="server">

    public void Application_Start(object sender, EventArgs e)
    {
        // 在应用程序启动时运行的代码 
        //创建一个计时器，单位：毫秒 
        //Dim aTimer As New System.Timers.Timer(10000) 
        // 将 Fresher 指定为计时器的 Elapsed 事件处理程序 
        //AddHandler aTimer.Elapsed, AddressOf Fresher 

        // AutoReset 属性为 true 时，每隔指定时间循环一次； 
        // 如果为 false，则只执行一次。 
        //aTimer.AutoReset = True 
        //aTimer.Enabled = True 

        //先给 Application("TimeStamp") 指定一个初值 
        //Application.Lock() 
        //Application("TimeStamp") = DateTime.Now.ToString() 
        //Application.UnLock() 

        WebDebug.WriteLog("应用程序启动");

        //启动log4net日志 
        log4net.Config.XmlConfigurator.Configure();

        //创建全局数据库字典容器
        // XmlParser xmlParser = new XmlParser(ConfigurationManager.AppSettings["DatabasePathConfig"]);//Xml配置文件分析器
        //XmlParser xmlParser = new XmlParser();//Xml配置文件分析器
        //XmlDictContainer xmlDictContainer = new XmlDictContainer(xmlParser);//用Xml分析器配置一个Xml数据字典容器
        //Application.Add("XmlDictonary", xmlDictContainer);

        //构造工厂上下文
        //FactoryContext factoryContext = new FactoryContext();
        //factoryContext.DictContainer = xmlDictContainer;//设置字典
        //factoryContext.ConnectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;//设置连接字符串

        //string sDataEntityKey = ConfigurationManager.AppSettings["DataEntityKey"];
        //string[] saDataEntityKey = sDataEntityKey.Split(',');
        //factoryContext.FullAssemblyName = saDataEntityKey[1];//程序集名称
        //factoryContext.DataEntityFullClassName = saDataEntityKey[0];//数据实体类的名称

        //string sSqlStatementBuilderSetting = ConfigurationManager.AppSettings["SqlStatementBuilder"];
        //string[] saSqlStatementBuilderSetting = sSqlStatementBuilderSetting.Split(',');
        //factoryContext.SqlStatementBuilderFullClassName = saSqlStatementBuilderSetting[0]; //设置语句构造器的名称

        //获取当前服务器的硬件信息
        //string sCpuID = DataLayer.Hardware.Computer.CpuID;
        //factoryContext.CpuID = sCpuID;

        //Application.Add("FactoryContext", factoryContext);
        Application["online"] = 0;
    }

    public void Application_End(object sender, EventArgs e)
    {
        // 在应用程序关闭时运行的代码 
        WebDebug.WriteLog("应用程序结束");
    }

    public void Application_Error(object sender, EventArgs e)
    {
        //获得最近一个Exception
        Exception ex = this.Context.Server.GetLastError();
        WebDebug.WriteLog("应用程序出错：" + ex.Message);

        //获得所有未处理的Exception集
        //Exception[] errors = this.Context.AllErrors;

        //清除掉Exception，OK啦
        //this.Context.Server.ClearError();

       // Server.Transfer("error.aspx");
    }

    public void Session_Start(object sender, EventArgs e)
    {
        // 在新会话启动时运行的代码 

        WebDebug.WriteLog("会话启动");

        Application.Lock();//锁定后，只有这个Session能够会话
        Application["online"] = (int)Application["online"] + 1;
        Application.UnLock();//会话完毕后解锁
    }

    public void Session_End(object sender, EventArgs e)
    {
        // 在会话结束时运行的代码。 
        // 注意: 只有在 Web.config 文件中的 sessionstate 模式设置为 
        // InProc 时，才会引发 Session_End 事件。如果会话模式设置为 StateServer 
        // 或 SQLServer，则不会引发该事件。 

        WebDebug.WriteLog("会话结束");
        Application.Lock();
        Application["online"] = (int)Application["online"] - 1;
        Application.UnLock();
    }

    //Sub Fresher(ByVal sender As Object, ByVal e As ElapsedEventArgs) 
    //Application.Lock() 
    //Application("TimeStamp") = DateTime.Now.ToString() 
    //Application.UnLock() 
    //End Sub
</script>
