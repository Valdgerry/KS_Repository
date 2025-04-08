using KidneySaversApi.Models;

namespace KidneySaversApi.Services
{
    public interface ITokenService
    {
        string GenerateJwtToken(User user);
    }
}
