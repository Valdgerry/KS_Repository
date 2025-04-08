using KidneySaversApi.Models;

namespace KidneySaversApi.Services
{
    public interface ITrackingService
    {
        Task AddTrackingAsync(Tracking tracking);
        Task<List<Tracking>> GetTrackingByUserIdAsync(Guid userId);
    }
}
