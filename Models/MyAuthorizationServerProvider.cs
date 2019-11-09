using Microsoft.Owin.Security.OAuth;
using OnlineJewelryShopping.Models;
using System.Security.Claims;
using System.Threading.Tasks;
namespace TokenAuthenticationInWebAPI.Models
{
    public class MyAuthorizationServerProvider : OAuthAuthorizationServerProvider
    {
        public override async Task ValidateClientAuthentication(OAuthValidateClientAuthenticationContext context)
        {
            context.Validated();
        }
        public override async Task GrantResourceOwnerCredentials(OAuthGrantResourceOwnerCredentialsContext context)
        {
            using (AdminLoginMstRespository _repo = new AdminLoginMstRespository())
            {
                var user = _repo.ValidateAdmin(context.UserName, context.Password);
                if (user == null)
                {
                    context.SetError("invalid_grant", "Provided username and password is incorrect");
                    return;
                }
                var identity = new ClaimsIdentity(context.Options.AuthenticationType);
                identity.AddClaim(new Claim(ClaimTypes.Name, user.username));
                identity.AddClaim(new Claim(ClaimTypes.Role, "Admin"));
                identity.AddClaim(new Claim("Password", user.password));
                context.Validated(identity);
            }
        }
    }
}
