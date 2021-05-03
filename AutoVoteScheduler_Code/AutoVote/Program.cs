
using Chroniton;
using Chroniton.Jobs;
using Chroniton.Schedules;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace AutoVote
{
    class Program
    {
        static void Main(string[] args)
        {
            var singularity = Singularity.Instance;
            if (args.Length == 0)
            {
                Console.WriteLine("Executable path is required as first argument");
                return;
            }

            string executablePath = args[0];
            if (!System.IO.File.Exists(executablePath))
            {
                Console.WriteLine("The executable file from arguments is not found :" + executablePath);
                return;
            }
            executablePath = System.IO.Path.GetFullPath(executablePath);
            Console.WriteLine("Executable path: " + executablePath);

            var job = new SimpleParameterizedJob<string>((parameter, scheduledTime) =>
            {
                Console.WriteLine($"{parameter} \t Started : {DateTime.Now:o}");
                System.Diagnostics.Process.Start(executablePath);
            });

            var schedule = new EveryXTimeSchedule(TimeSpan.FromMinutes(30.5));

            //var scheduledJob = singularity.ScheduleParameterizedJob(
            //    schedule, job, "Hello World", true); //starts immediately
            DateTime startTime = DateTime.UtcNow;
            int initialDelayInMinutes = 0;
            if (args.Length > 1)
                startTime = DateTime.UtcNow.Add(TimeSpan.FromSeconds(int.TryParse(args[1], out initialDelayInMinutes) ? initialDelayInMinutes * 60 : 0));

            Console.WriteLine("Initial Delay for job (in minutes): " + initialDelayInMinutes);
            Console.WriteLine("Job starts at (in minutes): " + startTime.AddMinutes(330));

            var scheduledJob2 = singularity.ScheduleParameterizedJob(schedule, job, "Vote Every 30 min Job ", startTime);

            singularity.Start();

            Thread.Sleep(10 * 1000);

            //singularity.StopScheduledJob(scheduledJob);
            string s = string.Empty;
            do
            {
                Thread.Sleep(5 * 1000);
                s = Console.ReadLine();
            } while (s != "y");

            if (s == "Y")
                singularity.Stop();
        }

    }
}
