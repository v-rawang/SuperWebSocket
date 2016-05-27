using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ServiceStack.Redis;

namespace SuperWebSocketServer
{
    public class CacheManager
    {
        private RedisClient redisClient;

        public CacheManager(string ServerAddress, int Port, string Password, long DBIndex)
        {
            this.redisClient = new RedisClient(ServerAddress, Port);
            this.redisClient.Password = Password;
            this.redisClient.ChangeDb(DBIndex);
        }

        public object ClearCache(string ID)
        {
            return this.redisClient.Del(ID);
        }

        public object GetCache(string ID)
        {
            return this.redisClient.GetValue(ID);
        }

        public void SetCache(string ID, object ObjectToCache)
        {
            this.redisClient.SetValue(ID, (string)(ObjectToCache));
            //this.redisClient.Save();
        }

        public void SetCache(string ID, object ObjectToCache, TimeSpan ExpireIn)
        {
            this.redisClient.SetValue(ID, (string)(ObjectToCache), ExpireIn);
        }
    }
}
