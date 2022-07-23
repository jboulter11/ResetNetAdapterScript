# Reset Network Adapter on Startup using Powershell

1. Clone/Download this repo to your Windows machine
2. Change the path in RegisterJob.ps1 to point to where you want to keep your Restart-NetAdapter.ps1 script
3. Change the name of the Network Adapter specified in Restart-NetAdapter.ps1 to match your device, mine's "Ethernet" so that is what is the default.
4. Open a Powershell terminal as Administrator and run "Set-ExecutionPolicy RemoteSigned" to allow running local powershell scripts.
5. Run RegisterJob.ps1 as an Administrator, this will schedule Restart-NetAdapter.ps1 to run every startup.
6. Run Task Scheduler and check for the job id found in RegisterJob.ps1.
7. Done.
