#!/bin/bash

menu()
{
	echo
	echo -e "  		\e[1mITC 350-Open Source SOftware Project\e[0m			 \n"
	echo "==========================================================================="
	echo -e "                 \e[94m Customer Account Banking System \e[0m	        		 "
	echo -e "===========================================================================\n"
	

	echo -e "\e[31m 1. Create a new customer Account\e[0m \n"
	echo -e "\e[32m 2. Update Account Data\e[0m \n"
	echo -e "\e[33m 3. View and manage transactions\e[0m \n"
	echo -e "\e[34m 4. Chech the details of an existing account\e[0m \n"
	echo -e "\e[0m 5. Remove existing account\e[0m \n"
	echo -e "\e[36m 6. Exit\e[0m \n"
}


New_Account() 
{

if [ ! -f account_info.csv ]
then
	touch account_info.csv
fi

clear

echo -e "\e[94mPlease enter the following information to create your new account!\e[0m\n"
echo "Enter your Full Name: "
	read customer_name
		while ! [[ $customer_name = [[:alpha:]]+$ || -n $customer_name ]]
			do 
				echo "Please enter a valid name: "
				read customer_name
			done
echo

echo "Enter your Date of Birth: (Year-Month-Day)"
	read D_birth 
		while [ -z $D_birth ]
			do 
				echo "Please enter a valid Date of Birth: "
				read D_birth
			done
echo

echo "Enter your National I.D card number:"
	read I_D
		while ! [[ $I_D =~ [0-9]+$ ]]
			do
				echo "Please enter a valid Number:"
				read I_D
			done
echo

echo "Enter your email address:"
	read email_add
		while [ -z $email_add ]
			do 
				echo "Please enter a valid Email Address: "
				read email_add
			done
echo

echo "Enter your country:"
	read country
		while ! [[ $country = [[:alpha:]]+$ || -n $country ]]
			do 
				echo "Please enter a valid Country: "
				read country
			done
echo

echo "Enter your city:"
	read city
		while ! [[ $city = [[:alpha:]]+$ || -n $city ]]
			do 
				echo "Please enter a valid city name: "
				read city
			done
echo

echo "Enter your phone number"
read ph_number
	while ! [[ $ph_number =~ [0-9]+$ ]]
			do 
				echo "Please enter a valid Phone Number: "
				read ph_number
			done
echo

echo "Select your account type:"
echo "1. Saving"
echo "2. Current"
	read input
		case $input in
			1) acc_type="saving"
			;;
			2) acc_type="current"
			;;
			*)
			echo "Enter a valid option"
			read input
		esac
	
echo

echo "How much do you want to deposit?"
read dep_money
	
	while ! [[ $dep_money =~ [0-9]+$ ]]
		do 
			echo "Please enter a valid Number: "
			read dep_money
		done


echo "$(($(tail -1 account_info.csv | awk '{print $1}' FS=",")+1)), $customer_name, $D_birth, $I_D, $email_add, $country, $city, $ph_number, $acc_type, $dep_money" >> /home/carnage/final_project/account_info.csv

echo -e "\e[94mYour account iformation is:\e[0m \n"
echo -e "\e[94mID", "Customer Name", "Date of Birth", "National ID", "Emaill Address", "Country", "City", "Phone Number", "Account Type", "Money Deposit\e[0m"
		echo "$(($(tail -1 account_info.csv | awk '{print $1}' FS=","))), $customer_name, $D_birth, $I_D, $email_add, $country, $city, $ph_number, $acc_type, $dep_money"
echo

}


view() {

clear
	echo -e "\e[94mEnter your I.D\e[0m\n"
	read id_num
	echo
	echo -e "\e[94mID", "Customer Name", "Date of Birth", "National ID", "Emaill Address", "Country", "City", "Phone Number", "Account Type", "Money Deposit\e[0m"
		awk -F, '$1 == '$id_num'' account_info.csv
	echo

}


edit() {
clear
	echo -e "\e[94mChoose the data you want to update\e[0m\n"
		echo "1. Name"
		echo "2. Date of Birth"
		echo "3. National I.D Card Number"
		echo "4. Email Address"
		echo "5. Country"
		echo "6. City"
		echo "7. Phone Number"
		echo "8. Account Type"
		echo 
read input


case $input in
	1) echo -e "\e[94mEnter your ID Number\e[0m\n"
		read id_num
		echo "Enter the New Name"
		read name

		awk -v id=$id_num -v data=$name 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $2=data; print}' account_info.csv > Data.tmp && mv Data.tmp account_info.csv
			awk -F, '$1 == 1' account_info.csv
			
	;;
	2) echo -e "\e[94mEnter your ID Number\e[0m\n"
		read id_num
		echo "Enter Your Birth Day"
		read b_date
			awk -v id=$id_num -v data=$b_date 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $3=data; print}' account_info.csv > Data.tmp && mv Data.tmp account_info.csv
			awk -F, '$1 == 1' account_info.csv
	;;
	3) echo -e "\e[94mEnter your ID Number\e[0m\n"
		read id_num
		echo "Enter the new National I.D card number"
		read N_ID
			awk -v id=$id_num -v data=$N_ID 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $4=data; print}' account_info.csv > Data.tmp && mv Data.tmp account_info.csv
			awk -F, '$1 == 1' account_info.csv
	;;
	4) echo -e "\e[94mEnter your ID Number\e[0m\n"
		read id_num
		echo "Enter your new Email Address"
		read email_add
			awk -v id=$id_num -v data=$email_add 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $5=data; print}' account_info.csv > Data.tmp && mv Data.tmp account_info.csv
			awk -F, '$1 == 1' account_info.csv
	;;
	5) echo -e "\e[94mEnter your ID Number\e[0m\n"
		read id_num
		echo "Enter your Country"
		read C_name
			awk -v id=$id_num -v data=$C_name 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $6=data; print}' account_info.csv > Data.tmp && mv Data.tmp account_info.csv
			awk -F, '$1 == 1' account_info.csv
	;;
	6) echo -e "\e[94mEnter your ID Number\e[0m\n"
		read id_num
		echo "Enter Your City"
		read city
			awk -v id=$id_num -v data=$city 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $7=data; print}' account_info.csv > Data.tmp && mv Data.tmp account_info.csv
			awk -F, '$1 == 1' account_info.csv
	;;
	7) echo -e "\e[94mEnter your ID Number\e[0m\n"
		read id_num
		echo "Enter your new Phone number"
		read ph_num
			awk -v id=$id_num -v data=$ph_num 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $8=data; print}' account_info.csv > Data.tmp && mv Data.tmp account_info.csv
			awk -F, '$1 == 1' account_info.csv
	;;
	8) echo -e "\e[94mEnter your ID Number\e[0m\n"
		read id_num
		echo "Select your new account type:"
		echo "1. Saving"
		echo "2. Current"
		read input
		case $input in
			1) acc_type="saving"
			;;
			2) acc_type="current"
			;;
			*)
			echo "Enter a valid option"
			read input
		esac
			awk -v id=$id_num -v data=$acc_type 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $9=data; print}' account_info.csv > Data.tmp && mv Data.tmp account_info.csv
			awk -F, '$1 == 1' account_info.csv
	;;
	*)
	echo -e "\e[94mChoose a Valid option\e[0m\n"
esac
echo
}


transaction() {

	clear
	echo -e "\e[94mEnter your ID Number\e[0m\n"
	read id_num
	clear
	echo -e "\e[94mChoose an option\e[0m\n"
		echo "1. Show Current balance"
		echo "2. Deposit Money"
		echo "3. Withdraw Money"
		echo
	read input
		case $input in
			1) echo "Your current balance is: "
			 awk -F, '$1 == '$id_num'' account_info.csv | cut -d, -f 10
			;;
			2) echo "Enter the amount you want to deposit"
				read amount
					while ! [[ $amount =~ [0-9]+$ ]]
					do 
						echo "Please enter a valid Number: "
						read amount
					done

			current_balance=`awk -F, '$1 == '$id_num'' account_info.csv | cut -d, -f 10`
			new_balance=`expr $current_balance + $amount`

			awk -v id=$id_num -v data=$new_balance 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $10=data; print}' account_info.csv > Data.tmp && mv Data.tmp account_info.csv
				echo "Your new Balance is: " 
				awk -F, '$1 == '$id_num'' account_info.csv | cut -d, -f 10
			;;
			3) echo "Enter the amount you want to Withdraw"
				read amount
					while ! [[ $amount =~ [0-9]+$ ]]
					do 
						echo "Please enter a valid Number: "
						read amount
					done

			current_balance=`awk -F, '$1 == '$id_num'' account_info.csv | cut -d, -f 10`
			new_balance=`expr $current_balance - $amount`
			awk -v id=$id_num -v data=$new_balance 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $10=data; print}' account_info.csv > Data.tmp && mv Data.tmp account_info.csv
				echo "Your new Balance is: " 
				awk -F, '$1 == '$id_num'' account_info.csv | cut -d, -f 10
			;;
			*)
			echo -e "\e[94mChoose a Valid option\e[0m\n"
			read input
		esac
		echo	
	
}


delet() {
	echo -e "\e[94mPlease Enter the ID of the account you want to delet\e[0m\n"
	read id_num
	
	sed -i '/\b\('$del'\)\b/d' ./account_info.csv
	echo -e "\e[94mYou have successfully deleted your account\e[0m\n"
}


Exit()
{
	exit
}

while [ "$input" != "n" ]
	do
		menu
			echo -e "\e[92mEnter your option: \e[0m "
			read option

		case $option in
			1) New_Account
				echo -e "Do you want to go back to the main Menu? (y,n)\n"
				read input
			;;
			2) edit
				echo -e "Do you want to go back to the main Menu? (y,n)\n"
				read input
			;; 
			3) transaction
				echo -e "Do you want to go back to the main Menu? (y,n)\n"
				read input
			;;
			4) view
				echo -e "Do you want to go back to the main Menu? (y,n)\n"
				read input
				
			;;
			5) delet
				echo -e "Do you want to go back to the main Menu? (y,n)\n"
				read input
			;;
			6) Exit
			;;
			*)
			echo "Select a valid option"
		esac
done
