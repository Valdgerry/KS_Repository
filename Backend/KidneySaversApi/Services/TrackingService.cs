using Microsoft.EntityFrameworkCore;
using KidneySaversApi.Data;
using KidneySaversApi.Models;
namespace KidneySaversApi.Services
{
    public class TrackingService : ITrackingService
    {
        private readonly ApplicationDbContext _context;
        public TrackingService(ApplicationDbContext context) => _context = context;
        public async Task AddTrackingAsync(Tracking tracking)
        {
            tracking.Id = Guid.NewGuid();
            tracking.Timestamp = DateTime.UtcNow;
            _context.Trackings.Add(tracking);
            await _context.SaveChangesAsync();
        }
        public async Task<List<Tracking>> GetTrackingByUserIdAsync(Guid userId) =>
            await _context.Trackings.Where(t => t.UserId == userId).ToListAsync();
    }
}