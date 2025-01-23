# Bank Account CLI Application

This is a simple command-line interface (CLI) application to simulate basic banking operations such as checking the balance, depositing money, and withdrawing money from a bank account. The application is implemented in Python.

## Features

- **Check Balance**: View the current balance in your account.
- **Deposit Money**: Add money to your account.
- **Withdraw Money**: Withdraw money from your account, even allowing negative balances.
- **Exit**: Exit the application.

## How to Use

1. Clone or download this repository to your local machine.
2. Make sure Python 3 is installed on your system.
3. Run the script:

   ```bash
   python bank_account_cli.py
   ```

4. Follow the on-screen instructions to choose an operation by entering the corresponding number (1-4).

## Code Structure

### `BankAccount` Class

This class represents a bank account and contains the following methods:

- **`__init__`**: Initializes the account with a default balance of 200.
- **`get_balance`**: Prints and returns the current balance.
- **`deposit(amount)`**: Adds the specified amount to the balance and prints the updated balance.
- **`withdraw(amount)`**: Deducts the specified amount from the balance and prints the updated balance. The account balance can go negative.

### `main_menu` Function

This function provides a menu-driven interface for interacting with the bank account. Users can select one of the following options:

- **1**: Check balance
- **2**: Deposit money
- **3**: Withdraw money
- **4**: Exit the application

## Example Usage

```text
--- Bank Account System ---
1. Check Balance
2. Deposit
3. Withdraw
4. Exit
Enter your choice (1-4): 1
Current balance: 200

--- Bank Account System ---
1. Check Balance
2. Deposit
3. Withdraw
4. Exit
Enter your choice (1-4): 2
Enter amount to deposit: 100
Deposited 100. New balance: 300

--- Bank Account System ---
1. Check Balance
2. Deposit
3. Withdraw
4. Exit
Enter your choice (1-4): 3
Enter amount to withdraw: 50
Withdrew 50. New balance: 250

--- Bank Account System ---
1. Check Balance
2. Deposit
3. Withdraw
4. Exit
Enter your choice (1-4): 4
Exit
```

## License

This project is open-source and available under the MIT License. Feel free to modify and use it as needed.

## Contributions

Contributions are welcome! Feel free to fork this repository and submit a pull request with your improvements.

