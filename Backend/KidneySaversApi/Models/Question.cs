namespace KidneySaversApi.Models
{
    public class Question
    {
        public Guid Id { get; set; }
        public Guid QuizId { get; set; }
        public string Text { get; set; }
        public List<string> Options { get; set; }
        public string CorrectAnswer { get; set; }
        public string Explanation { get; set; }
    }
}
