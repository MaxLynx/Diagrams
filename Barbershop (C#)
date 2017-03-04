using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Barbershop
{
    class Hairdresser
    {
        int workTime;

        public Hairdresser()
        {
        }
        public void setWorkTime(int time)
        {
            workTime = time;
        }
        public void updateWorkTime(int time)
        {
            workTime-=time;
        }
        public int isFree()
        {
            if (workTime <= 0)
                return 1;
            else
                return 0;
        }
    }

    class Client
    {
        int waitTime;
        int limit;

        public Client()
        {
            limit = 120;
            waitTime = limit;
        }
        public Client(int time)
        {
            waitTime = time;
        }
        public void updateWaitTime(int time)
        {
            waitTime -= time;
        }
        public int getWaitTime()
        {
            return (limit-waitTime);
        }
        public int isLeaving()
        {
            if (waitTime <= 0)
                return 1;
            else
                return 0;
        }
    }

    class Simulation
    {
        Hairdresser hairdresser1 = new Hairdresser();
        Hairdresser hairdresser2 = new Hairdresser();
        Queue<Client> queue = new Queue<Client>();
        Client currentClient;
        int minutesPerDay = 480;
        int daysInAYear = 5*52;
        int modulationInterval = 5;
        int lastClientCameTime = 0;
        int clientsComingInterval = 40;
        int totalAmountOfClients = 0;
        double averageAmountOfClients = 0.0;
        int totalWaitingTime = 0;
        double averageWaitingTime = 0.0;
        int queueLimit = 8;
        int rejectedQuantity = 0;
        int hairdresser1Load = 0;
        int hairdresser2Load = 0;
        int activeQueueHeadNumber = 0;
        int nextClientNumber = 0;
        int totalClientsAmount = 0;

        public void YearSimulation()
        {
            for (int count = 0; count < daysInAYear; count++)
                DaySimulation();
        }

        public void DaySimulation()
        {
            Client[] temporaryArray = new Client[1 + queueLimit + minutesPerDay / clientsComingInterval];
            activeQueueHeadNumber = 0;
            nextClientNumber = 0;
            Client[] clients = new Client[1 + queueLimit+minutesPerDay / clientsComingInterval];
            for (int count = 0; count < 1 + queueLimit + minutesPerDay / clientsComingInterval; count++)
                clients[count] = new Client();

            for (nextClientNumber = 0; nextClientNumber < queueLimit; nextClientNumber++)
                queue.Enqueue(clients[nextClientNumber]);

            for (int i = 0; i < minutesPerDay; i += modulationInterval)
            {
                if ((queue.Count > 0) && (hairdresser1.isFree() == 1))
                {
                    currentClient = queue.Dequeue();
                    totalWaitingTime += currentClient.getWaitTime();
                    Random random = new Random();
                    int randomNumber = random.Next(20, 46);
                    hairdresser1.setWorkTime(randomNumber);
                    hairdresser1Load += randomNumber;
                    activeQueueHeadNumber++;
                }
                if ((queue.Count > 0) && (hairdresser2.isFree() == 1))
                {
                    currentClient = queue.Dequeue();
                    totalWaitingTime += currentClient.getWaitTime();
                    Random random = new Random();
                    int randomNumber = random.Next(20, 46);
                    hairdresser2.setWorkTime(randomNumber);
                    hairdresser2Load += randomNumber;
                    activeQueueHeadNumber++;
                }
                lastClientCameTime += modulationInterval;
                if ((lastClientCameTime >= clientsComingInterval) && (queue.Count < queueLimit))
                {
                    lastClientCameTime = 0;
                    queue.Enqueue(clients[nextClientNumber++]);
                }
                hairdresser1.updateWorkTime(modulationInterval);
                hairdresser2.updateWorkTime(modulationInterval);
                totalAmountOfClients += queue.Count;
                for (int count = activeQueueHeadNumber; count < nextClientNumber; count++)
                    if (clients[count] != null)
                        clients[count].updateWaitTime(modulationInterval);
                         int j = activeQueueHeadNumber;
                         int k = 0;
                         while (j < nextClientNumber)
                         {
                             if((clients[j] != null)&&(clients[j].isLeaving() == 0))
                             {
                                 temporaryArray[k++] = clients[j];
                             }
                             j++;
                         }
                                                 
                             for (int rejectedCount = activeQueueHeadNumber; rejectedCount < nextClientNumber; rejectedCount++)
                                 if (clients[rejectedCount] != null)
                                     if (clients[rejectedCount].isLeaving() == 1)
                                         {
                                            totalWaitingTime += clients[rejectedCount].getWaitTime();
                                            rejectedQuantity++;
                                            clients[rejectedCount] = null;
                                         }
                             queue.Clear();
                             for (int newCount = 0; newCount < k; newCount++)
                                 queue.Enqueue(temporaryArray[newCount]);
                         
                         
            }
            queue.Clear();
            totalClientsAmount += nextClientNumber - 1;
        }

        public void Stats()
        {
            Console.WriteLine("Amount of clients during a year: {0}", totalClientsAmount);
            averageAmountOfClients = (double) totalAmountOfClients * modulationInterval / (minutesPerDay * daysInAYear);
            Console.WriteLine("Average amount of clients in the queue during a year: {0:0.00}", averageAmountOfClients);
            averageWaitingTime = (double) totalWaitingTime / totalClientsAmount;
            Console.WriteLine("Average clients time of waiting in the queue during a year: {0:0.00} minutes", averageWaitingTime);
            Console.WriteLine("Amount of rejected clients during a year: {0} ({1:0.00}%)", rejectedQuantity, (double)100*rejectedQuantity/totalClientsAmount);
            Console.WriteLine("1st hairdresser's load during a year = {0} hours ({1:0.00}%)", hairdresser1Load/60, (double)hairdresser1Load * 100 / (minutesPerDay * daysInAYear));
            Console.WriteLine("2st hairdresser's load during a year = {0} hours ({1:0.00}%)", hairdresser2Load/60, (double)hairdresser2Load * 100 / (minutesPerDay * daysInAYear));
            Console.ReadKey();
        }

    }

    class Program
    {
        static void Main(string[] args)
        {
            Simulation Barbershop = new Simulation();
            Barbershop.YearSimulation();
            Barbershop.Stats();
        }
    }
}
