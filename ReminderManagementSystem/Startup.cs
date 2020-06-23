using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ReminderManagementSystem.Startup))]
namespace ReminderManagementSystem
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
