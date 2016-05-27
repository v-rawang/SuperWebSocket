using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SuperWebSocket;
using SuperSocket.SocketBase;

namespace SuperWebSocketServer
{
    class Program
    {
        static CacheManager cacheManager = new CacheManager("118.194.132.112", 6379, "begin@2015", 1);

        static void Main(string[] args)
        {
            Console.WriteLine("Press any key to start the server!");

            Console.ReadKey();
            Console.WriteLine();

            SuperWebSocket.WebSocketServer server = new WebSocketServer();

            int portNumber = 2016;

            Console.WriteLine("Please enter port number: (Press enter to accept default (2016))");

            string portNumberString = Console.ReadLine();

            if (String.IsNullOrEmpty(portNumberString) || !int.TryParse(portNumberString, out portNumber))
            {
                portNumber = 2016;

                Console.WriteLine("Invalid port number detected! Default value (2016) is taken.");
            }

            //Setup the server
            if (!server.Setup(portNumber)) //Setup with listening port
            {
                Console.WriteLine("Failed to setup!");
                Console.ReadKey();
                return;
            }
            else
            {
                Console.WriteLine(String.Format("Ready to be listening on port {0}.",portNumber));
            }

            Console.WriteLine();

            //server.NewRequestReceived += Server_NewRequestReceived;

            server.NewMessageReceived += Server_NewMessageReceived;

            server.NewDataReceived += Server_NewDataReceived;

            server.NewSessionConnected += Server_NewSessionConnected;

            server.SessionClosed += Server_SessionClosed;

            //Try to start the server
            if (!server.Start())
            {
                Console.WriteLine("Failed to start!");
                Console.ReadKey();
                return;
            }

            Console.WriteLine("The server started successfully, press key 'q' to stop it!");

            while (Console.ReadKey().KeyChar != 'q')
            {
                Console.WriteLine();
                continue;
            }

            //Stop the appServer
            server.Stop();

            Console.WriteLine("The server was stopped!");
            Console.ReadKey();
        }

        private static void Server_SessionClosed(WebSocketSession session, CloseReason value)
        {
            Console.WriteLine(String.Format("Session Closed. Session ID： {0}", session.SessionID));
            Console.WriteLine(value);
            Console.WriteLine(session.AppServer.SessionCount);
            //cacheManager.SetCache(session.AppServer.Name, session.AppServer.SessionCount.ToString());
            cacheManager.SetCache(session.Host, session.AppServer.SessionCount.ToString());
        }

        //private static void Server_NewRequestReceived(WebSocketSession session, SuperWebSocket.Protocol.IWebSocketFragment requestInfo)
        //{
        //    if (requestInfo != null)
        //    {

        //    }
        //}

        private static void Server_NewMessageReceived(WebSocketSession session, string value)
        {
            if (value != null)
            {
                Console.WriteLine(value);
                string response = String.Format("Got it. Have a nice day:-) [{0}, {1}, {2}, {3}]", value, session.Origin, session.SessionID, DateTime.Now);
                session.Send(response);
                Console.WriteLine(response);
            }
        }

        private static void Server_NewDataReceived(WebSocketSession session, byte[] value)
        {
            if (value != null)
            {

            }
        }

        private static void Server_NewSessionConnected(WebSocketSession session)
        {

            if (session != null)
            {
                //cacheManager.SetCache(session.AppServer.Name, session.AppServer.SessionCount.ToString());
                cacheManager.SetCache(session.Host, session.AppServer.SessionCount.ToString());
                Console.WriteLine(session.AppServer.SessionCount);
                Console.WriteLine(session.SessionID);
                Console.WriteLine(session.Origin);
            }
        }
    }
}
