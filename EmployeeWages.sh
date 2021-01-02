#!/bin/bash -x

isPresent=1;
isPartime=2;
fullHours=8;
partHours=4;
hourlyWages=100;
dailyWage=0;
monthlyWage=0;
monthlyWorkDays=20;
monthlyWorkHours=30;
totalWorkDays=0;
totalWorkingHours=0

declare -a DailyWage

#function to calculate work hours

        function getWorkingHours(){
        employeeHours=0;
                        case $1 in 
$isPartime)
                                        employeeHours=$partHours

                                        ;;
                                $isPresent)
                                        employeeHours=$fullHours

                                        ;;
                                *)
                                        employeeHours=0
                        esac
echo $employeeHours;

        }

#function to return daily wage of employee

        function calculateWage(){
                workHours=$1
                wage=$(($workHours * $hourlyWages ))
                echo $wage
        }
 while [[ $totalWorkDays -le $monthlyWorkDays && $totalWorkingHours -le $monthlyWorkHours ]]
        do
                randomCheck=$(( RANDOM % 3 ));

#function call to getworkingHours to get the work hours in return 
        workHours="$( getWorkingHours $randomCheck )"

#adding totalWorking hours
        totalWorkingHours=$(( $totalWorkingHours +  $workHours ))
#incremnting the work days
        ((totalWorkDays ++))

                echo "working hours" $totalWorkingHours
        echo "working days"  $totalWorkDays

#function call to daily wage method which will return daily wage and add in the array 
        DailyWage[totalWorkDays]="$(calculateWage $workHours )"

done

echo "All values of daily wages"${DailyWage[@]}
echo  monthly wage of employee is $(calculateWage $totalWorkingHour)
