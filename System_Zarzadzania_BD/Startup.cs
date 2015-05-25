using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(System_Zarzadzania_BD.Startup))]
namespace System_Zarzadzania_BD
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
