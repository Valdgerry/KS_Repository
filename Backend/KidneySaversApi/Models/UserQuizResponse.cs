namespace KidneySaversApi.Models
{
    public class UserQuizResponse
    {
        public Guid Id { get; set; }
        public Guid UserId { get; set; }
        public Guid QuizId { get; set; }
        public Guid QuestionId { get; set; }
        public string Answer { get; set; }
        public DateTime SubmittedAt { get; set; }
    }
}
