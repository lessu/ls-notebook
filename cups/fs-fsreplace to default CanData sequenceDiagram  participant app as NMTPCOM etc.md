```mermaid
sequenceDiagram
	participant app as NM/TP/COM etc...
	participant if as CanIf
	participant fs as FSMonitor
  participant can as CanTrcv
	app->>+if:CanIf_Transmit
		if->>+fs:FS_CanDataSupervise
      fs->>fs:check current Mode
      opt in Safe_Communication Mode
        fs->>fs:replace to default CanData
      end
     fs->>-if:ret
     if->>if:other CanIf Logic
     if->>can:write data
	if->>-app:ret
	
```

```mermaid
sequenceDiagram
participant task
	participant app as NM/TP/COM etc...
	participant if as CanIf

	participant fs as FSMonitor
	participant trcv as CanTrcv
		task->>+fs:main
		fs->>trcv:set_op(STANDBY)
	fs->>-task:ret
	
	app->>+if:Enabled
	if->>if:CanIf_PCB.c .set_op = FS_CanTrcv
	if->>+fs:set_op()
	fs->>fs:save request
	fs->>fs:check status
	opt FS_SAFE_COMMUNICATION
		fs->>trcv:set_op()
	end
	fs->>-if:ret
	if->>-app:ret
	
	
	task->>+fs:main
		fs->>fs:check status
	opt FS_SAFE_COMMUNICATION
		fs->>trcv:set_op()
	end
	fs->>-task:ret
```





|SAFE_SILENT                  | SAFE_COMMUNICATION | NORMAL_COMMUNICATION | SAFE_COMMUNICATION

开机->BSW  --------> FS    | state transition                                                                     cat3 happens

​              NM XXXXXXXXXX

​           					    Self->finish(Cat2)

​                    				app ------------------------------------------------------> soc pwr on







|-----------------                  | SAFE_COMMUNICATION | NORMAL_COMMUNICATION | SAFE_COMMUNICATION

开机->BSW  --------> FS   | state transition                                                                     cat3 happens

​           					   Self->finish(Cat2)

​                    			  app ------------------------------------------------------> soc pwr on





