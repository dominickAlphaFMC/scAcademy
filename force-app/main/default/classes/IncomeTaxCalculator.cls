public class IncomeTaxCalculator {
    
    public static void calculateIncomeTax(Double taxableIncome) {
        
        //Federal and State income tax calculator (doesnt include local income tax)
        //Following are user inputs:
        
        String stateOfResidence = 'California';
        Boolean filingJointly = False;
        
        //Calculating federal tax
        Double federalTax = 0.0;
        
        if (filingJointly == True) {
            if (taxableIncome <= 10275) {
                federalTax = taxableIncome * .1;
            } else if (taxableIncome <= 41775) {
                federalTax = 1027.5 + (taxableIncome - 10275) * .12;
            } else if (taxableIncome <= 89075) {
                federalTax = 4807.5 + (taxableIncome - 41775) * .22;
            } else if (taxableIncome <= 170050) {
                federalTax = 15213.5 + (taxableIncome - 41775) * .24;
            } else if (taxableIncome <= 215950) {
                federalTax = 34647.5 + (taxableIncome - 41775) * .32;
            } else if (taxableIncome <= 539900) {
                federalTax = 49335.5 + (taxableIncome - 41775) * .35;
            } else if (taxableIncome > 89075) {
                federalTax = 162718 + (taxableIncome - 41775) * .37;
            }
        } else if (filingJointly == False) {
            if (taxableIncome <= 20550) {
                federalTax = taxableIncome * .1;
            } else if (taxableIncome <= 83550) {
                federalTax = 2055 + (taxableIncome - 10275) * .12;
            } else if (taxableIncome <= 178150) {
                federalTax = 9615 + (taxableIncome-41775) * .22;
            } else if (taxableIncome <= 340100) {
                federalTax = 30427 + (taxableIncome-41775) * .24;
            } else if (taxableIncome <= 431900) {
                federalTax = 69295 + (taxableIncome-41775) * .32;
            } else if (taxableIncome <= 647850) {
                federalTax = 98671 + (taxableIncome-41775) * .35;
            } else if (taxableIncome > 647851) {
                federalTax = 174253.5 + (taxableIncome-41775) * .37;
            }
        }
        
        //Calculating state tax for states with *flat rate*
        Double stateTax = 0.0;
        String[] flatRateStates = new String[]{'Colorado', 'Illinois', 'Indiana', 'Kentucky', 'Massachusetts', 'Michigan','New Hampshire', 'North Carolina', 'Pennsylvania', 'Utah'};
            Double[] flatRate = new Double[]{.0455, .0495, .0323, .05, .05, .0425, .05, .0499, .0307, .0495};
                
                if (stateOfResidence == 'Colorado' || 
                    stateOfResidence == 'Illinois' || 
                    stateOfResidence == 'Indiana' || 
                    stateOfResidence == 'Kentucky'|| 
                    stateOfResidence == 'Massachusetts'|| 
                    stateOfResidence == 'Michigan'|| 
                    stateOfResidence == 'New Hampshire' || 
                    stateOfResidence == 'North Carolina' || 
                    stateOfResidence == 'Pennsylvania' || 
                    stateOfResidence == 'Utah') {
                        stateTax = taxableIncome * flatRate[flatRateStates.indexOf(stateOfResidence)];
                    }
        
        //Calculating state tax for states with *tax brackets*
        //New York:
        if (filingJointly == True && stateOfResidence == 'New York') {
            if (taxableIncome <= 17150) {
                stateTax = taxableIncome * .04;
            } else if (taxableIncome <= 23600) {
                stateTax = 686 + (taxableIncome - 17150) * .045;
            } else if (taxableIncome <= 27900) {
                stateTax = 976 + (taxableIncome - 23600) * .0525;
            } else if (taxableIncome <= 161550) {
                stateTax = 1202 + (taxableIncome - 27900) * .0585;
            } else if (taxableIncome <= 323200) {
                stateTax = 9021 + (taxableIncome - 161550) * .0625;
            } else if (taxableIncome <= 2155350) {
                stateTax = 19124 + (taxableIncome - 323200) * .0685;
            } else if (taxableIncome <= 5000000) {
                stateTax = 144626 + (taxableIncome - 2155350) * .0965;
            } else if (taxableIncome <= 25000000) {
                stateTax = 419135 + (taxableIncome - 5000000) * .103;
            } else if (taxableIncome > 25000001) {
                stateTax = 2479135 + (taxableIncome - 25000000) * .109;
            }
        } else if (filingJointly == False && stateOfResidence == 'New York') {
            if (taxableIncome <= 8500) {
                stateTax = taxableIncome * .04;
            } else if (taxableIncome <= 11700) {
                stateTax = 340 + (taxableIncome - 8500) * .045;
            } else if (taxableIncome <= 13900) {
                stateTax = 484 + (taxableIncome - 11700) * .0525;
            } else if (taxableIncome <= 80650) {
                stateTax = 600 + (taxableIncome - 13900) * .0585;
            } else if (taxableIncome <= 215400) {
                stateTax = 4504 + (taxableIncome - 80650) * .062;
            } else if (taxableIncome <= 1077550) {
                stateTax = 12926 + (taxableIncome - 215400) * .068;
            } else if (taxableIncome <= 5000000) {
                stateTax = 71984 + (taxableIncome - 1077550) * .096;
            } else if (taxableIncome <= 25000000) {
                stateTax = 450500 + (taxableIncome - 5000000) * .103;
            } else if (taxableIncome > 25000001) {
                stateTax = 2510500 + (taxableIncome - 25000000) * .109;
            }
        }
        //California
        if (filingJointly == True && stateOfResidence == 'California') {
            if (taxableIncome <= 20198) {
                stateTax = taxableIncome * .01;
            } else if (taxableIncome <= 47884) {
                stateTax = 201.98 + (taxableIncome - 20198) * .02;
            } else if (taxableIncome <= 75576) {
                stateTax = 755.7 + (taxableIncome - 47884) * .04;
            } else if (taxableIncome <= 104910) {
                stateTax = 1863.38 + (taxableIncome - 75576) * .06;
            } else if (taxableIncome <= 132590) {
                stateTax = 3623.42 + (taxableIncome - 104910) * .08;
            } else if (taxableIncome <= 677278) {
                stateTax = 5837.82 + (taxableIncome - 132590) * .093;
            } else if (taxableIncome <= 812728) {
                stateTax = 56493.8 + (taxableIncome - 677278) * .103;
            } else if (taxableIncome <= 1354550) {
                stateTax = 70445.15 + (taxableIncome - 812728) * .113;
            } else if (taxableIncome > 1354551) {
                stateTax = 131671.04 + (taxableIncome - 1354550) * .123;
            }
        } else if (filingJointly == False && stateOfResidence == 'California') {
            if (taxableIncome <= 10099) {
                stateTax = taxableIncome * .01;
            } else if (taxableIncome <= 23942) {
                stateTax = 100.99 + (taxableIncome - 10099) * .02;
            } else if (taxableIncome <= 37788) {
                stateTax = 377.85 + (taxableIncome - 23942) * .04;
            } else if (taxableIncome <= 52455) {
                stateTax = 931.69 + (taxableIncome - 37788) * .06;
            } else if (taxableIncome <= 66295) {
                stateTax = 1811.71 + (taxableIncome - 52455) * .08;
            } else if (taxableIncome <= 338639) {
                stateTax = 2918.91 + (taxableIncome - 66295) * .093;
            } else if (taxableIncome <= 406364) {
                stateTax = 28246.9 + (taxableIncome - 338639) * .103;
            } else if (taxableIncome <= 677275) {
                stateTax = 35222.58 + (taxableIncome - 406364) * .113;
            } else if (taxableIncome > 677276) {
                stateTax = 65835.52 + (taxableIncome - 677275) * .123;
            }
        }
        //*Final Output*: Federal tax, State tax, and remaining income
        if (stateOfResidence == 'New York' || stateOfResidence == 'California' ||
            stateOfResidence == 'Colorado' || stateOfResidence == 'Illinois' ||
            stateOfResidence == 'Indiana' || stateOfResidence == 'Kentucky' ||
            stateOfResidence == 'Massachusetts' || stateOfResidence == 'Michigan' ||
            stateOfResidence == 'New Hampshire' || stateOfResidence == 'North Carolina' ||
            stateOfResidence == 'Pennsylvania' || stateOfResidence == 'Utah' ||
            stateOfResidence == 'Alaska' || stateOfResidence == 'Florida' ||
            stateOfResidence == 'Nevada' || stateOfResidence == 'South Dakota' ||
            stateOfResidence == 'Tennessee' || stateOfResidence == 'Texas' ||
            stateOfResidence == 'Washington' || stateOfResidence == 'Wyoming') {
                System.debug('Federal Tax Owed: '+ federalTax);
                System.debug('State Tax Owed: '+ stateTax);
                System.debug('Remaining scraps: '+ (taxableIncome - (stateTax + federalTax)));
            } else {     
                System.debug('Woops! No one lives in this state (state not included, or misspelled)');
            }
        
    }
    
    
    
}