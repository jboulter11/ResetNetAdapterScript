function Invoke-PrepareScheduledTask
{
    $taskName = "FixMyDumbNetworkAdapter"
    $task = Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue
    if ($task -ne $null)
    {
        Unregister-ScheduledTask -TaskName $taskName -Confirm:$false 
    }

    # TODO: EDIT THIS STUFF AS NEEDED...
    $action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument '-File "C:\Users\jboul\code\RestartNetAdapterScript\Restart-NetAdapter.ps1"'
    $trigger = New-ScheduledTaskTrigger -AtStartup
    $settings = New-ScheduledTaskSettingsSet -Compatibility Win8

    $principal = New-ScheduledTaskPrincipal -UserId SYSTEM -LogonType ServiceAccount -RunLevel Highest

    $definition = New-ScheduledTask -Action $action -Principal $principal -Trigger $trigger -Settings $settings -Description "Run $($taskName) at startup"

    Register-ScheduledTask -TaskName $taskName -InputObject $definition

    $task = Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue

    # TODO: LOG AS NEEDED...
    if ($task -ne $null)
    {
        Write-Output "Created scheduled task: '$($task.ToString())'."
    }
    else
    {
        Write-Output "Created scheduled task: FAILED."
    }
}

Invoke-PrepareScheduledTask