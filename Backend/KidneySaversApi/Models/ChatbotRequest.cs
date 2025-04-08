namespace KidneySaversApi.Models
{
    public class ChatbotRequest
    {
        public Guid UserId { get; set; }
        public string Question { get; set; }
    }
}
