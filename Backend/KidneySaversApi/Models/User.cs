using Microsoft.AspNetCore.Identity;

namespace KidneySaversApi.Models
{
    public class User:IdentityUser<Guid>
    {
        public string UserType { get; set; }
        public DateTime CreatedAt { get; set; }    
    }
}
