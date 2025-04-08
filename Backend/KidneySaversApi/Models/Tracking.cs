namespace KidneySaversApi.Models
{
    public class Tracking
    {
        public Guid Id { get; set; }
        public Guid UserId { get; set; }
        public string Type { get; set; }
        public string Value { get; set; }
        public DateTime Timestamp { get; set; }
    }
}
