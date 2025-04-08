namespace KidneySaversApi.Models
{
    public class Quiz
    {
        public Guid Id { get; set; }
        public string Title { get; set; }
        public string UserType { get; set; }
        public DateTime Date { get; set; }
        public List<Question> Questions { get; set; }
    }
}
