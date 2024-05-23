Import-Module JAMS
[System.Management.Automation.PSCredential]$creds = Get-JAMSCredential JAMS
Invoke-Command -ComputerName <<ExchangeSvr>> -ScriptBlock `
    {
				#Exchange snapin for Exchange commands
				Add-PSSnapin Microsoft.Exchange.Management.PowerShell.SnapIn

        #Variables
        $TodaysDate = get-date -Format "MM-dd-yyyy"
        
        #Get Database sizes and current "WhiteSpace"

        $DatabaseSizingInfo = Get-MailboxDatabase -status | select Name, Databasesize, AvailablenewMailboxspace | Sort-Object Name | Format-Table -Auto

				#Get the Mailbox count of users per Database

#				$DBUserCount = Get-Mailbox -resultsize unlimited | Group-Object -Property Database | Select-Object Name,Count | Sort-Object Name | Format-Table -Auto

        #Get all Mailbox total sizes along with database location

        $MailBoxSizingInfo = get-mailbox -resultsize unlimited -ErrorAction SilentlyContinue | Get-MailboxStatistics | select DisplayName,totalitemsize,databasename | sort databasename

        # Group for Stats
        Foreach($mailbox in $MailBoxSizingInfo)
            {
#								If(Get-Variable - Name $mailbox.DatabaseName -ErrorAction SilentlyContinue)
#										{
#												##The variable Exists												
#										} else{
#												##The Variable does not Exist
#												New-Variable -Name "$($DBName.DatabaseName)count" -Value 1
#												New-Variable -Name "$($DBName.DatabaseName)Size" -Value $mailbox.TotalItemSize
#										}
                If($mailbox.DatabaseName -eq "DB19-001")
                    {
                        $DB19001count ++
                        $DB19001Size += $mailbox.TotalItemSize
                    }
                Elseif($mailbox.DatabaseName -eq "DB19-002")
                    {
                        $DB19002count ++
                        $DB19002Size += $mailbox.TotalItemSize
                    }
                Elseif($mailbox.DatabaseName -eq "DB19-003")
                    {
                        $DB19003count ++
                        $DB19003Size += $mailbox.TotalItemSize
                    }
                Elseif($mailbox.DatabaseName -eq "DB19-004")
                    {
                        $DB19004count ++
                        $DB19004Size += $mailbox.TotalItemSize
                    }
                Elseif($mailbox.DatabaseName -eq "DB19-005")
                    {
                        $DB19005count ++
                        $DB19005Size += $mailbox.TotalItemSize
                    }
                Elseif($mailbox.DatabaseName -eq "DB19-006")
                    {
                        $DB19006count ++
                        $DB19006Size += $mailbox.TotalItemSize
                    }
                Elseif($mailbox.DatabaseName -eq "DB19-007")
                    {
                        $DB19007count ++
                        $DB19007Size += $mailbox.TotalItemSize
                    }
                Elseif($mailbox.DatabaseName -eq "DB19-008")
                    {
                        $DB19008count ++
                        $DB19008Size += $mailbox.TotalItemSize
                    }
                Elseif($mailbox.DatabaseName -eq "DB19-009")
                    {
                        $DB19009count ++
                        $DB19009Size += $mailbox.TotalItemSize
                    }
                Elseif($mailbox.DatabaseName -eq "DB19-010")
                    {
                        $DB19010count ++
                        $DB19010Size += $mailbox.TotalItemSize
                    }
								Elseif($mailbox.DatabaseName -eq "DB19-011")
                    {
                        $DB19011count ++
                        $DB19011Size += $mailbox.TotalItemSize
                    }
								Elseif($mailbox.DatabaseName -eq "DB19-012")
                    {
                        $DB19012count ++
                        $DB19012Size += $mailbox.TotalItemSize
                    }
								Elseif($mailbox.DatabaseName -eq "DB19-013")
                    {
                        $DB19013count ++
                        $DB19013Size += $mailbox.TotalItemSize
                    }
								Elseif($mailbox.DatabaseName -eq "DB19-014")
                    {
                        $DB19014count ++
                        $DB19014Size += $mailbox.TotalItemSize
                    }
								Elseif($mailbox.DatabaseName -eq "DB19-015")
                    {
                        $DB19015count ++
                        $DB19015Size += $mailbox.TotalItemSize
                    }
								Elseif($mailbox.DatabaseName -eq "DB19-016")
                    {
                        $DB19016count ++
                        $DB19016Size += $mailbox.TotalItemSize
                    }
								Elseif($mailbox.DatabaseName -eq "DB19-017")
                    {
                        $DB19017count ++
                        $DB19017Size += $mailbox.TotalItemSize
                    }
								Elseif($mailbox.DatabaseName -eq "DB19-018")
                    {
                        $DB19018count ++
                        $DB19018Size += $mailbox.TotalItemSize
                    }
								Elseif($mailbox.DatabaseName -eq "DB19-019")
                    {
                        $DB19019count ++
                        $DB19019Size += $mailbox.TotalItemSize
                    }
								Elseif($mailbox.DatabaseName -eq "DB19-020")
                    {
                        $DB19020count ++
                        $DB19020Size += $mailbox.TotalItemSize
                    }
								Elseif($mailbox.DatabaseName -eq "DB19-021")
                    {
                        $DB19021count ++
                        $DB19021Size += $mailbox.TotalItemSize
                    }
								Elseif($mailbox.DatabaseName -eq "DB19-022")
                    {
                        $DB19022count ++
                        $DB19022Size += $mailbox.TotalItemSize
                    }
								Elseif($mailbox.DatabaseName -eq "DB19-023")
                    {
                        $DB19023count ++
                        $DB19023Size += $mailbox.TotalItemSize
                    }
								Elseif($mailbox.DatabaseName -eq "DB19-024")
                    {
                        $DB19024count ++
                        $DB19024Size += $mailbox.TotalItemSize
                    }
								Elseif($mailbox.DatabaseName -eq "DB19-025")
                    {
                        $DB19025count ++
                        $DB19025Size += $mailbox.TotalItemSize
                    }
								Elseif($mailbox.DatabaseName -eq "DB19-026")
                    {
                        $DB19026count ++
                        $DB19026Size += $mailbox.TotalItemSize
                    }
								Elseif($mailbox.DatabaseName -eq "DB19-027")
                    {
                        $DB19027count ++
                        $DB19027Size += $mailbox.TotalItemSize
                    }
								Elseif($mailbox.DatabaseName -eq "DB19-028")
                    {
                        $DB19028count ++
                        $DB19028Size += $mailbox.TotalItemSize
                    }
								Elseif($mailbox.DatabaseName -eq "DB19-029")
                    {
                        $DB19029count ++
                        $DB19029Size += $mailbox.TotalItemSize
                    }
								Elseif($mailbox.DatabaseName -eq "DB19-030")
                    {
                        $DB19030count ++
                        $DB19030Size += $mailbox.TotalItemSize
                    }
								Elseif($mailbox.DatabaseName -eq "DB19-031")
                    {
                        $DB19031count ++
                        $DB19031Size += $mailbox.TotalItemSize
                    }
								Elseif($mailbox.DatabaseName -eq "MADB19-01")
                    {
                        $MADB1901count ++
                        $MADB1901Size += $mailbox.TotalItemSize
                    }
            }


        # Stats info to object for exporting
        $CountObj = New-Object PSObject
            $CountObj | Add-Member NoteProperty DB19001count ($DB19001count)
            $CountObj | Add-Member NoteProperty DB19002count ($DB19002count)
            $CountObj | Add-Member NoteProperty DB19003count ($DB19003count)
            $CountObj | Add-Member NoteProperty DB19004count ($DB19004count)
            $CountObj | Add-Member NoteProperty DB19005count ($DB19005count)
            $CountObj | Add-Member NoteProperty DB19006count ($DB19006count)
            $CountObj | Add-Member NoteProperty DB19007count ($DB19007count)
            $CountObj | Add-Member NoteProperty DB19008count ($DB19008count)
            $CountObj | Add-Member NoteProperty DB19009count ($DB19009count)
            $CountObj | Add-Member NoteProperty DB19010count ($DB19010count)
            $CountObj | Add-Member NoteProperty DB19011count ($DB19011count)
            $CountObj | Add-Member NoteProperty DB19012count ($DB19012count)
            $CountObj | Add-Member NoteProperty DB19013count ($DB19013count)
            $CountObj | Add-Member NoteProperty DB19014count ($DB19014count)
            $CountObj | Add-Member NoteProperty DB19015count ($DB19015count)
            $CountObj | Add-Member NoteProperty DB19016count ($DB19016count)
            $CountObj | Add-Member NoteProperty DB19017count ($DB19017count)
            $CountObj | Add-Member NoteProperty DB19018count ($DB19018count)
            $CountObj | Add-Member NoteProperty DB19019count ($DB19019count)
            $CountObj | Add-Member NoteProperty DB19020count ($DB19020count)
            $CountObj | Add-Member NoteProperty DB19021count ($DB19021count)
            $CountObj | Add-Member NoteProperty DB19022count ($DB19022count)
            $CountObj | Add-Member NoteProperty DB19023count ($DB19023count)
            $CountObj | Add-Member NoteProperty DB19024count ($DB19024count)
            $CountObj | Add-Member NoteProperty DB19025count ($DB19025count)
            $CountObj | Add-Member NoteProperty DB19026count ($DB19026count)
            $CountObj | Add-Member NoteProperty DB19027count ($DB19027count)
            $CountObj | Add-Member NoteProperty DB19028count ($DB19028count)
            $CountObj | Add-Member NoteProperty DB19029count ($DB19029count)
            $CountObj | Add-Member NoteProperty DB19030count ($DB19030count)
            $CountObj | Add-Member NoteProperty DB19031count ($DB19031count)
            $CountObj | Add-Member NoteProperty MADB1901count ($MADB1901count)
            $CountObj | Add-Member NoteProperty TotalofAll ($DB19001count + $DB19002count + $DB19003count + $DB19004count + $DB19005count + $DB19006count + $DB19007count + $DB19008count + $DB19009count + $DB19010count + $DB19011count + $DB19012count + $DB19013count + $DB19014count + $DB19015count + $DB19016count + $DB19017count + $DB19018count + $DB19019count + $DB19020count + $DB19021count + $DB19022count + $DB19023count + $DB190024count + $DB190025count + $DB19026count + $DB19027count + $DB19028count + $DB19029count + $DB19030count + $DB19031count + $MADB1901count)


        $sizeObj = New-Object PSObject

            $sizeObj | Add-Member NoteProperty DB19001size ($DB19001size)
            $sizeObj | Add-Member NoteProperty DB19002size ($DB19002size)
            $sizeObj | Add-Member NoteProperty DB19003size ($DB19003size)
            $sizeObj | Add-Member NoteProperty DB19004size ($DB19004size)
            $sizeObj | Add-Member NoteProperty DB19005size ($DB19005size)
            $sizeObj | Add-Member NoteProperty DB19006size ($DB19006size)
            $sizeObj | Add-Member NoteProperty DB19007size ($DB19007size)
            $sizeObj | Add-Member NoteProperty DB19008size ($DB19008size)
            $sizeObj | Add-Member NoteProperty DB19009size ($DB19009size)
						$sizeObj | Add-Member NoteProperty DB19010size ($DB19010size)
            $sizeObj | Add-Member NoteProperty DB19011size ($DB19011size)
            $sizeObj | Add-Member NoteProperty DB19012size ($DB19012size)
            $sizeObj | Add-Member NoteProperty DB19013size ($DB19013size)
            $sizeObj | Add-Member NoteProperty DB19014size ($DB19014size)
            $sizeObj | Add-Member NoteProperty DB19015size ($DB19015size)
            $sizeObj | Add-Member NoteProperty DB19016size ($DB19016size)
            $sizeObj | Add-Member NoteProperty DB19017size ($DB19017size)
            $sizeObj | Add-Member NoteProperty DB19018size ($DB19018size)
            $sizeObj | Add-Member NoteProperty DB19019size ($DB19019size)
						$sizeObj | Add-Member NoteProperty DB19020size ($DB19020size)
            $sizeObj | Add-Member NoteProperty DB19021size ($DB19021size)
            $sizeObj | Add-Member NoteProperty DB19022size ($DB19022size)
            $sizeObj | Add-Member NoteProperty DB19023size ($DB19023size)
            $sizeObj | Add-Member NoteProperty DB19024size ($DB19024size)
            $sizeObj | Add-Member NoteProperty DB19025size ($DB19025size)
            $sizeObj | Add-Member NoteProperty DB19026size ($DB19026size)
            $sizeObj | Add-Member NoteProperty DB19027size ($DB19027size)
            $sizeObj | Add-Member NoteProperty DB19028size ($DB19028size)
            $sizeObj | Add-Member NoteProperty DB19029size ($DB19029size)
						$sizeObj | Add-Member NoteProperty DB19030size ($DB19030size)
						$sizeObj | Add-Member NoteProperty DB19031size ($DB19031size)
            $sizeObj | Add-Member NoteProperty MADB1901size ($MADB1901size)
            $sizeObj | Add-Member NoteProperty TotalofAll ($DB19001size + $DB19002size + $DB19003size + $DB19004size + $DB19005size + $DB19006size + $DB19007size + $DB19008size + $DB19009size + $DB19010size + $DB19011size + $DB19012size + $DB19013size + $DB19014size + $DB19015size + $DB19016size + $DB19017size + $DB19018size + $DB19019size + $DB19020size + $DB19021size + $DB19022size + $DB19023size + $DB19024size + $DB19025size + $DB19026size + $DB19027size + $DB19028size + $DB19029size + $DB19030size + $DB19031size + $MADB1901size)

        # Create today's date folder for today's files
        New-Item -Path "\\dmi2\systems\Admins\ExchangeSizing\" -ItemType directory -Name $TodaysDate -force

        # Export data into separate CSV which will then be merged together.
         $DatabaseSizingInfo | Export-Csv -Path "\\dmi2\systems\Admins\ExchangeSizing\$TodaysDate\2DatabaseSizingInfo.csv" -Append -NoTypeInformation
#				 $DBUserCount | Export-Csv -Path "\\dmi2\systems\Admins\ExchangeSizing\$TodaysDate\3UserSizingInfo.csv" -Append -NoTypeInformation
         $MailBoxSizingInfo | Export-Csv -Path "\\dmi2\systems\Admins\ExchangeSizing\$TodaysDate\4MailBoxSizingInfo.csv" -Append  -NoTypeInformation
         $CountObj | Export-Csv -Path "\\dmi2\systems\Admins\ExchangeSizing\$TodaysDate\1CountObj.csv" -Append -NoTypeInformation
         $SizeObj | Export-Csv -Path "\\dmi2\systems\Admins\ExchangeSizing\$TodaysDate\2SizeObj.csv" -Append -NoTypeInformation
 
         #Merge Files into one CSV.
         $files = Get-ChildItem "\\dmi2\systems\Admins\ExchangeSizing\$TodaysDate\*.csv"
         Get-Content $files | Set-Content "\\dmi2\systems\Admins\ExchangeSizing\$TodaysDate\ExchangeSizingReport.csv"


         #Delete indiviual CSVs since they have all been combined
         Remove-Item "\\dmi2\systems\Admins\ExchangeSizing\$TodaysDate\*.csv" -Exclude "ExchangeSizingReport.csv"

    } -Authentication Credssp -Credential $creds

Write-host "See '\\dmi2\systems\Admins\ExchangeSizing\' for the sizing information gathered."
                                                                                                                                                                                 
<#
 $DB19001count
 $DB19002count
 $DB19003count
 $DB19004count
 $DB19005count
 $DB19006count
 $DB19007count
 $DB19008count
 $DB19009count
 $DB19010count
 $DB19011count
 $DB19012count
 $DB19013count
 $DB19014count
 $DB19015count
 $DB19016count
 $DB19017count
 $DB19018count
 $DB19019count
 $DB19020count
 $DB19021count
 $DB19022count
 $DB19023count
 $DB19024count
 $DB19025count
 $DB19026count
 $DB19027count
 $DB19028count
 $DB19029count
 $DB19030count
 $DB19031count
 $MADB1901count

 $DB19001size
 $DB19002size
 $DB19003size
 $DB19004size
 $DB19005size
 $DB19006size
 $DB19007size
 $DB19008size
 $DB19009size
 $DB19010size
 $DB19011size
 $DB19012size
 $DB19013size
 $DB19014size
 $DB19015size
 $DB19016size
 $DB19017size
 $DB19018size
 $DB19019size
 $DB19020size
 $DB19021size
 $DB19022size
 $DB19023size
 $DB19024size
 $DB19025size
 $DB19026size
 $DB19027size
 $DB19028size
 $DB19029size
 $DB19030size
 $DB19031size
 $MADB1901size
 #>