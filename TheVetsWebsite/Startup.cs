using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(TheVetsWebsite.Startup))]
namespace TheVetsWebsite
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
