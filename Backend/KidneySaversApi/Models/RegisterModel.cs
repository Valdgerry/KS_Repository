namespace KidneySaversApi.Models
{
    public class RegisterModel
    {
        public string Email { get; set; }
        public string Password { get; set; }
        public string UserType { get; set; } // "Patient" or "Doctor"
    }
}
